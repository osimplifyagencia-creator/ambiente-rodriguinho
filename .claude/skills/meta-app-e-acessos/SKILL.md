---
name: meta-app-e-acessos
description: "Acessos da Meta de ponta a ponta: criar app, usuário do sistema, token que não vence, ligar conta de anúncio, página, Instagram e WhatsApp, permissões e manutenção. Use quando: \"cria o app na Meta\", \"pega o token\", \"o token caiu\". Não é: subir anúncio (meta-ads-subir-anuncio)."
---

# Acessos da Meta: app, usuário do sistema, token e ativos

Tudo o que você faz na Meta por API (anúncio, Instagram, WhatsApp, Conversions API) depende da mesma corrente. Quando algo "não tem permissão", o elo quebrado é um destes cinco:

```
portfólio (BM) ── dono do ── app (caso de uso + nível de acesso)
      │                         │
      └─ usuário do sistema ────┘ app instalado nele
              │
              ├─ ativos ATRIBUÍDOS (conta de anúncio, página, Instagram, WhatsApp) com tarefas
              └─ token (gerado no app, com as permissões marcadas, "Nunca" expira)
```

**Escopo não é acesso.** O token pode ter `ads_management` e não enxergar a conta, porque a conta não foi atribuída ao usuário do sistema. A prova nunca é o `debug_token` sozinho: é o ativo responder. Por isso a skill tem um script que faz as duas coisas.

## A prova de qualquer token: `meta_acesso.py`

Roda da raiz do projeto, lê o `.env` da raiz e só usa o Python 3 padrão (sem instalar nada):

```bash
python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py
#   --env outro.env        (outro arquivo)
#   --var NOME_DA_VARIAVEL (se o token tem outro nome; o padrão é META_ACCESS_TOKEN)
#   --json                 (saída para outro script)
```

Mostra, sem imprimir o token: app, tipo (SYSTEM_USER, USER, PAGE), quando vence, permissões, contas de anúncio (com o status em português), páginas com Instagram, contas do WhatsApp e números. E confere **cada ID que o `.env` promete** contra o que o token enxerga. Se `META_APP_ID` e `META_APP_SECRET` estão no `.env`, o script manda o `appsecret_proof` sozinho.

Saída: `0` tudo certo, `3` token válido mas algum ativo do `.env` não responde, `2` token inválido ou vencido, `1` erro de uso (arquivo ou variável faltando).

Medido numa conta real: um token pode sair `3` por enxergar anúncio, página e portfólio e não ter permissão de Instagram nem de WhatsApp. Outro pode sair `0` com a conta de anúncio em PAGAMENTO PENDENTE. Leia a lista inteira, não só o código de saída.

## Antes de começar: qual dos três casos é

| Caso | Exemplo | Caminho |
|---|---|---|
| **A. Ativo da sua empresa** | sua conta de anúncio, seu Instagram, seu WhatsApp | app e usuário do sistema no **seu** portfólio; só Acesso Padrão basta |
| **B. Ativo que outra pessoa ou agência opera para você** | uma agência cuida dos seus anúncios | a agência dá **acesso de parceiro** ao seu portfólio, ou você cria o app e o token no seu e entrega só o que ela precisa |
| **C. Pessoas de fora conectam a conta delas no SEU produto** | você constrói um sistema que outras empresas usam | Acesso Avançado, App Review e verificação do negócio. É outro nível de trabalho |

O caso A é o seu. Os outros dois só entram se a situação pedir.

## O que é seu e o que é do Claude

O painel da Meta pede login com chave de acesso (passkey), código no celular e às vezes vídeo. Isso é seu. O Claude **prepara, conduz e prova**:

- conduz pelo navegador quando você está logado: **sempre o Navegador Osimplify**, pelo `bsk` (skill `navegador-osimplify`). Ele para onde a Meta pede senha, passkey ou código e espera você;
- faz pela API o que a API faz (instalar app no usuário do sistema, gerar token com `appsecret_proof`, atribuir ativo, conferir);
- **nunca** cola token no chat, em print ou em arquivo que vá para o git: o valor vai direto para o `.env`.

## Passo a passo (casos A e B)

Cada fase termina com uma prova. Os cliques, com os nomes de tela, estão em [references/passo-a-passo.md](references/passo-a-passo.md).

1. **Portfólio pronto.** Uma pessoa de verdade é admin. Verificação do negócio iniciada se for usar WhatsApp em volume ou Acesso Avançado. *Prova:* `verification_status` no script (`META_BM_ID`).
2. **App criado no portfólio certo**, com os casos de uso do objetivo (anúncios, Instagram, WhatsApp) e o básico preenchido: ícone, política de privacidade, exclusão de dados, categoria. Publicado ("Ao vivo"): app em desenvolvimento bloqueia criativo e webhook de produção. *Prova:* App ID e segredo guardados no `.env`.
3. **Usuário do sistema** (tipo Administrador; um por portfólio) com o **app instalado**. *Prova:* `GET /{SYSTEM_USER_ID}/applications` lista o app.
4. **Ativos atribuídos** com as tarefas mínimas (anúncio: `ADVERTISE` + `ANALYZE`; `MANAGE` só se mexer em pagamento ou pessoas). O Instagram entra pela página ligada a ele.
5. **Token** gerado no app, com só as permissões do objetivo ([references/permissoes.md](references/permissoes.md)), validade "Nunca". Vai direto para o `.env`.
6. **Prova final:** `meta_acesso.py` sai `0`. Depois uma chamada real do objetivo (listar campanha, ler mídia do Instagram, `GET` do número do WhatsApp).
7. **Registrar:** os IDs públicos em `empresa/PERFIL.md` e os segredos só no `.env`. Confirme que o `.env` está no `.gitignore`.

### Nomes das variáveis no `.env` da raiz

| Variável | O que é | Segredo? |
|---|---|---|
| `META_ACCESS_TOKEN` | token do usuário do sistema | sim |
| `META_APP_ID` | ID do app | não |
| `META_APP_SECRET` | chave secreta do app | sim |
| `META_SYSTEM_USER_ID` | ID do usuário do sistema | não |
| `META_BM_ID` | ID do portfólio | não |
| `META_AD_ACCOUNT_ID` | conta de anúncio (com ou sem `act_`) | não |
| `META_PAGE_ID` | página do Facebook | não |
| `META_IG_USER_ID` | Instagram profissional (17841...) | não |
| `META_WABA_ID` | conta do WhatsApp Business | não |
| `META_PHONE_NUMBER_ID` | número do WhatsApp | não |
| `META_PIXEL_ID` | pixel (dataset) | não |
| `META_CAPI_TOKEN` | token da Conversions API (Gerenciador de Eventos) | sim |

O nome da variável não prova nada sobre o token. Um `META_APP_ID` pode ser de um app e o token ter sido gerado em outro. O script acusa isso.

## Manutenção

Token caiu, permissão sumiu, conta parou, app saiu do ar: o roteiro por sintoma e por código de erro está em [references/manutencao.md](references/manutencao.md). Primeiro passo sempre: rodar `meta_acesso.py` e ler o que falhou.

## Vizinhas

- Subir anúncio: `meta-ads-subir-anuncio`. Ler campanha, pixel e Conversions API: `meta-ads-expert`.
- Abrir tela do painel da Meta: `navegador-osimplify`.
- Antes de gastar em tráfego: `pre-voo-de-trafego`.
