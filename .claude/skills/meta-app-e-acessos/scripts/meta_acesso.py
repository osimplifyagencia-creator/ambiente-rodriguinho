#!/usr/bin/env python3
"""Raio-x de um token da Meta, sem imprimir o token.

Diz de quem e, de que app, que tipo, quando vence, quais permissoes tem e sobre QUAIS ativos
(conta de anuncio, pagina, Instagram, WhatsApp e numeros). Escopo nao e acesso: o token pode ter
`ads_management` e nao enxergar a conta. Por isso o que vale e a lista de ativos que respondem.

Usa so a biblioteca padrao do Python 3. Le o arquivo `.env` da raiz do projeto.

    python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py
    python ... --env outro.env --var META_ACCESS_TOKEN
    python ... --json        # saida em JSON para outro script

Com META_APP_ID e META_APP_SECRET no .env, cada chamada leva `appsecret_proof` (obrigatorio
quando o app liga "Exigir prova da chave secreta") e o debug_token roda com o token do app.
Saida 0 = token valido e enxerga tudo o que o .env promete; 3 = valido mas algum ativo do .env
nao responde; 2 = invalido ou vencido; 1 = erro de uso.
"""
import argparse
import hashlib
import hmac
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

VERSAO = os.environ.get("META_API_VERSION", "v26.0")
BASE = f"https://graph.facebook.com/{VERSAO}"

# Codigo da Meta -> o que costuma ser e o que fazer (detalhe em references/manutencao.md)
DICAS = {
    (190, 463): "token vencido: gerar outro (usuário do sistema) ou renovar antes dos 60 dias",
    (190, 460): "senha da pessoa mudou ou sessão encerrada: gerar token novo",
    (190, 467): "token inválido ou revogado: gerar token novo",
    (190, 458): "o app foi removido pela pessoa: reinstalar o app no usuário do sistema",
    (190, 492): "usuário do sistema perdeu o acesso ao ativo ou ao app: reatribuir no portfólio",
    (190, None): "token não vale mais: gerar novo e trocar no .env",
    (200, None): "falta permissão OU o ativo não foi atribuído ao usuário do sistema",
    (10, None): "permissão não liberada para o app (acesso Avançado, App Review ou verificação do negócio)",
    (100, None): "parâmetro, campo ou ID errado, ou ativo que este token não enxerga",
    (4, None): "limite de chamadas do app: esperar e espaçar",
    (17, None): "limite de chamadas da conta: esperar e espaçar",
    (613, None): "limite de chamadas: esperar e espaçar",
    (80004, None): "limite da conta de anúncio (Marketing API): esperar",
    (368, None): "bloqueio temporário por política: não insistir, ver Qualidade da Conta",
    (3, None): "o app não tem a capacidade: adicionar o caso de uso ou produto no app",
}


STATUS_CONTA = {1: "ATIVA", 2: "DESATIVADA", 3: "PAGAMENTO PENDENTE", 7: "EM ANÁLISE DE RISCO",
                8: "ACERTO PENDENTE", 9: "PERÍODO DE CARÊNCIA", 100: "FECHANDO", 101: "FECHADA"}

# Variavel do .env -> que ativo o token precisa enxergar: (rotulo, formatador do id, campos a ler)
ATIVOS_DO_ENV = {
    "META_AD_ACCOUNT_ID": ("conta de anúncio", lambda v: v if v.startswith("act_") else f"act_{v}", "id,name,account_status"),
    "META_PAGE_ID": ("página", str, "id,name"),
    "META_IG_USER_ID": ("Instagram", str, "id,username"),
    "META_WABA_ID": ("conta do WhatsApp", str, "id,name,account_review_status"),
    "META_PHONE_NUMBER_ID": ("número de WhatsApp", str, "id,display_phone_number,quality_rating,status"),
    "META_BM_ID": ("portfólio", str, "id,name,verification_status"),
}
# Outros nomes comuns para o mesmo ativo
APELIDOS = {
    "META_BM_ID": ["META_BUSINESS_ID"],
    "META_IG_USER_ID": ["INSTAGRAM_BUSINESS_ID"],
    "META_WABA_ID": ["WHATSAPP_WABA_ID"],
}


def variaveis_de_ativo(env):
    """(nome da variavel no .env, nome canonico) para cada ID de ativo que o arquivo traz."""
    for canonico in ATIVOS_DO_ENV:
        for nome in [canonico] + APELIDOS.get(canonico, []):
            if env.get(nome):
                yield nome, canonico


def ler_env(caminho):
    valores = {}
    for linha in Path(caminho).read_text(encoding="utf-8-sig").splitlines():
        linha = linha.strip().replace("\r", "")
        if not linha or linha.startswith("#") or "=" not in linha:
            continue
        k, v = linha.split("=", 1)
        valores[k.strip().removeprefix("export ").strip()] = v.strip().strip('"').strip("'")
    return valores


class Meta:
    def __init__(self, token, segredo=None):
        self.token = token
        self.prova = hmac.new(segredo.encode(), token.encode(), hashlib.sha256).hexdigest() if segredo else None

    def get(self, caminho, token=None, **params):
        params["access_token"] = token or self.token
        if self.prova and not token:
            params["appsecret_proof"] = self.prova
        url = f"{BASE}/{caminho.lstrip('/')}?{urllib.parse.urlencode(params)}"
        try:
            with urllib.request.urlopen(url, timeout=30) as r:
                return json.loads(r.read().decode())
        except urllib.error.HTTPError as e:
            try:
                return json.loads(e.read().decode())
            except Exception:
                return {"error": {"message": f"HTTP {e.code}", "code": None}}
        except urllib.error.URLError as e:
            return {"error": {"message": f"rede: {e.reason}", "code": None}}


def dica(erro):
    c, s = erro.get("code"), erro.get("error_subcode")
    return DICAS.get((c, s)) or DICAS.get((c, None)) or "ver references/manutencao.md"


def data(ts):
    if not ts:
        return "nunca"
    dias = (ts - time.time()) / 86400
    return time.strftime("%d/%m/%Y", time.localtime(ts)) + (f" (faltam {dias:.0f} dias)" if dias > 0 else " (VENCIDO)")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--env", default=".env", help="arquivo .env que guarda o token (padrão: .env)")
    ap.add_argument("--var", default="META_ACCESS_TOKEN", help="nome da variável do token")
    ap.add_argument("--app-id-var", default="META_APP_ID", help="variável com o App ID")
    ap.add_argument("--app-secret-var", default="META_APP_SECRET", help="variável com o segredo do app")
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()

    if not Path(a.env).exists():
        print(f"ERRO: arquivo {a.env} não existe. Rode da raiz do projeto ou passe --env.")
        return 1
    env = ler_env(a.env)
    token = env.get(a.var)
    if not token:
        candidatas = sorted(k for k, v in env.items() if "TOKEN" in k and v)
        print(f"ERRO: {a.var} vazio ou ausente em {a.env}. Tokens preenchidos no arquivo: {', '.join(candidatas) or 'nenhum'}")
        return 1
    app_id = env.get(a.app_id_var)
    segredo = env.get(a.app_secret_var)
    m = Meta(token, segredo)

    token_app = f"{app_id}|{segredo}" if app_id and segredo else None
    resp = m.get("debug_token", token=token_app or token, input_token=token)
    dbg = resp.get("data", {})
    if "error" in resp and not dbg.get("error"):
        dbg["error"] = resp["error"]
    rel = {"versao": VERSAO, "token": {
        "valido": dbg.get("is_valid"), "app_id": dbg.get("app_id"), "app": dbg.get("application"),
        "tipo": dbg.get("type"), "vence": data(dbg.get("expires_at")),
        "acesso_a_dados_vence": data(dbg.get("data_access_expires_at")),
        "permissoes": dbg.get("scopes", []),
        "por_ativo": {g["scope"]: g.get("target_ids", "todos") for g in dbg.get("granular_scopes", [])},
        "erro": dbg.get("error"),
    }}

    # Token invalido: nao adianta perguntar pelos ativos.
    if not rel["token"]["valido"]:
        if a.json:
            print(json.dumps(rel, ensure_ascii=False, indent=2))
        else:
            t = rel["token"]
            print(f"Graph API {VERSAO}")
            print("token: INVÁLIDO")
            if t["erro"]:
                print(f"  erro: {t['erro'].get('message')} -> {dica(t['erro'])}")
            else:
                print("  a Meta disse que o token não vale. Gere outro (veja references/manutencao.md).")
        return 2

    eu = m.get("me", fields="id,name")
    rel["quem"] = eu if "error" not in eu else {"erro": eu["error"].get("message"), "dica": dica(eu["error"])}

    def lista(caminho, **p):
        r = m.get(caminho, limit=100, **p)
        if "error" in r:
            return {"erro": r["error"].get("message"), "codigo": r["error"].get("code"), "dica": dica(r["error"])}
        return r.get("data", [])

    escopos = set(rel["token"]["permissoes"])
    rel["negocios"] = lista("me/businesses", fields="id,name,verification_status") if "business_management" in escopos else "sem business_management"
    if escopos & {"ads_read", "ads_management"}:
        rel["contas_de_anuncio"] = lista("me/adaccounts", fields="account_id,name,account_status,disable_reason,currency")
    if escopos & {"pages_show_list", "pages_read_engagement", "pages_manage_metadata"}:
        rel["paginas"] = lista("me/accounts", fields="id,name,tasks,instagram_business_account{id,username}")
    wabas = rel["token"]["por_ativo"].get("whatsapp_business_management")
    if isinstance(wabas, list):
        rel["whatsapp"] = []
        for w in wabas:
            info = m.get(w, fields="id,name,account_review_status")
            info["numeros"] = lista(f"{w}/phone_numbers", fields="display_phone_number,verified_name,quality_rating,status,code_verification_status,messaging_limit_tier")
            rel["whatsapp"].append(info)

    for conta in rel.get("contas_de_anuncio") or []:
        if isinstance(conta, dict) and "account_status" in conta:
            conta["status"] = STATUS_CONTA.get(conta["account_status"], str(conta["account_status"]))

    # Escopo nao e acesso: cada ID que o .env promete precisa responder com ESTE token.
    rel["env_x_token"] = []
    for var, canonico in variaveis_de_ativo(env):
        rotulo, forma, campos = ATIVOS_DO_ENV[canonico]
        alvo = forma(env[var])
        r = m.get(alvo, fields=campos)
        if "error" in r:
            rel["env_x_token"].append({"var": var, "ativo": rotulo, "id": alvo, "ok": False,
                                       "erro": r["error"].get("message"), "codigo": r["error"].get("code"),
                                       "dica": dica(r["error"])})
        else:
            if "account_status" in r:
                r["status"] = STATUS_CONTA.get(r["account_status"], str(r["account_status"]))
            rel["env_x_token"].append({"var": var, "ativo": rotulo, "id": alvo, "ok": True, "visto": r})
    if env.get("META_APP_ID") and rel["token"]["app_id"] and env["META_APP_ID"] != rel["token"]["app_id"]:
        rel["env_x_token"].append({"var": "META_APP_ID", "ativo": "app", "id": env["META_APP_ID"], "ok": False,
                                   "erro": f"o token é do app {rel['token']['app_id']}, não do META_APP_ID do .env",
                                   "dica": "corrigir o .env ou gerar o token no app certo; appsecret_proof falha com o segredo do app errado"})

    if a.json:
        print(json.dumps(rel, ensure_ascii=False, indent=2))
    else:
        t = rel["token"]
        print(f"Graph API {VERSAO}")
        print(f"token: VÁLIDO | tipo {t['tipo']} | app {t['app']} ({t['app_id']})")
        print(f"  vence: {t['vence']} | acesso a dados vence: {t['acesso_a_dados_vence']}")
        print(f"  quem: {rel['quem']}")
        print(f"  permissões ({len(t['permissoes'])}): {', '.join(t['permissoes'])}")
        for s, ids in t["por_ativo"].items():
            print(f"    {s}: {ids if ids == 'todos' else ', '.join(ids)}")
        for chave in ("negocios", "contas_de_anuncio", "paginas", "whatsapp"):
            if chave in rel:
                print(f"{chave}:")
                v = rel[chave]
                for item in (v if isinstance(v, list) else [v]):
                    print(f"  - {json.dumps(item, ensure_ascii=False)}")
        if rel["env_x_token"]:
            print("o que o .env promete x o que o token enxerga:")
            for c in rel["env_x_token"]:
                if c["ok"]:
                    print(f"  OK     {c['var']:26} {c['ativo']}: {json.dumps(c['visto'], ensure_ascii=False)}")
                else:
                    print(f"  FALHA  {c['var']:26} {c['ativo']} {c['id']}: {c['erro']} -> {c['dica']}")
    return 3 if any(not c["ok"] for c in rel["env_x_token"]) else 0


if __name__ == "__main__":
    sys.exit(main())
