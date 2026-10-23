"""Gera os pacotes do claude.ai (web e app) a partir de .claude/.

Uso: python scripts/empacotar-web.py

Saída em web/pacotes/:
  skills/<nome>.zip        uma skill por arquivo, no formato que o claude.ai aceita
  skills/conselho.zip      os agentes de .claude/agents/ juntos numa skill só
                           (no claude.ai não existe agente; o conselho vira skill)
  ambiente-completo.zip    todas as skills acima num arquivo só, para baixar de uma vez
  conhecimento.zip         os arquivos do dono para subir no Projeto (perfil, metas, rotinas)

Rode de novo sempre que mudar uma skill ou um agente.
"""

import re
import shutil
import zipfile
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
SKILLS = RAIZ / ".claude" / "skills"
AGENTES = RAIZ / ".claude" / "agents"
SAIDA = RAIZ / "web" / "pacotes"

# Só funcionam no computador do dono (Chrome, bsk): ficam fora do claude.ai.
SO_NO_COMPUTADOR = {"navegador-osimplify"}

CONHECIMENTO = [
    "empresa/PERFIL.md",
    "gestao/metas.md",
    "gestao/rotinas.md",
    "gestao/plano-do-dia.md",
    "anotacoes/INDICE.md",
]

CONSELHO_SKILL = """---
name: conselho
description: "O conselho da empresa: CEO, conselheiros de vendas, marketing, tráfego, finanças, gestão e jurídico, e o revisor. Use quando: \\"o que eu priorizo\\", \\"como eu cresço\\", \\"posso contratar?\\", \\"escalo ou corto?\\", decisão de fundo de uma ou várias áreas. Não é: tarefa pontual (subir anúncio, escrever resposta)."
---

# Conselho da empresa

No Claude Code cada conselheiro é um agente. Aqui eles são papéis: você assume o papel certo lendo o arquivo dele em `references/`.

## Como escolher

| Pedido | Papel | Arquivo |
|---|---|---|
| Decisão ampla ou de várias áreas ("o que priorizo", "como cresço", "monta o 360") | CEO | `references/ceo.md` |
| Processo comercial, objeção, fechamento, preço por valor | Vendas | `references/conselheiro-vendas.md` |
| Ângulo, oferta, texto que não converte | Marketing | `references/conselheiro-marketing.md` |
| Conta de anúncio, verba, escalar ou cortar | Tráfego | `references/conselheiro-trafego.md` |
| Caixa, margem, "posso contratar?" | Finanças | `references/conselheiro-financas.md` |
| Delegar, contratar, prioridade do trimestre | Gestão | `references/conselheiro-gestao.md` |
| Contrato, LGPD, promessa em anúncio | Jurídico | `references/conselheiro-juridico.md` |
| Revisar uma recomendação antes de entregar | Revisor | `references/revisor.md` |
| Imagem base de anúncio ou post | Iris | `references/iris.md` |

## Regras de tradução para o claude.ai

1. Leia o arquivo do papel inteiro e siga como se fosse você.
2. Onde o arquivo manda ler `empresa/PERFIL.md`, `gestao/metas.md` ou outra pasta do dono, use o arquivo de mesmo nome no conhecimento do Projeto. Se não estiver lá, diga isso e ofereça a entrevista ("me entrevista para preencher meu perfil").
3. Onde manda ler `.claude/skills/<nome>/SKILL.md`, use a skill `<nome>`.
4. Onde o CEO manda acionar outro conselheiro ou o revisor, faça em sequência na mesma resposta: um bloco por papel, depois a síntese e a revisão.
5. Ferramenta que não existe aqui (Bash, PowerShell, Agent, navegador): diga que essa parte roda só no Claude Code do computador e siga com o resto.
"""


def frontmatter_nome(skill_md: Path) -> str:
    texto = skill_md.read_text(encoding="utf-8")
    achado = re.search(r"^name:\s*(\S+)", texto, re.MULTILINE)
    if not achado:
        raise SystemExit(f"{skill_md}: falta 'name:' no frontmatter")
    return achado.group(1)


def zipar_pasta(pasta: Path, nome: str, destino: Path) -> None:
    with zipfile.ZipFile(destino, "w", zipfile.ZIP_DEFLATED) as z:
        for arq in sorted(pasta.rglob("*")):
            if arq.is_file() and "__pycache__" not in arq.parts:
                z.write(arq, Path(nome) / arq.relative_to(pasta))


def sem_campos_de_agente(texto: str) -> str:
    # tools e model só valem para agente do Claude Code
    return re.sub(r"^(tools|model):.*\n", "", texto, flags=re.MULTILINE)


def main() -> None:
    if SAIDA.exists():
        shutil.rmtree(SAIDA)
    (SAIDA / "skills").mkdir(parents=True)

    feitos = []
    for skill_md in sorted(SKILLS.glob("*/SKILL.md")):
        pasta = skill_md.parent
        if pasta.name in SO_NO_COMPUTADOR:
            continue
        nome = frontmatter_nome(skill_md)
        zipar_pasta(pasta, nome, SAIDA / "skills" / f"{nome}.zip")
        feitos.append(nome)

    temp = SAIDA / "_conselho"
    (temp / "references").mkdir(parents=True)
    (temp / "SKILL.md").write_text(CONSELHO_SKILL, encoding="utf-8")
    for agente in sorted(AGENTES.glob("*.md")):
        texto = sem_campos_de_agente(agente.read_text(encoding="utf-8"))
        (temp / "references" / agente.name).write_text(texto, encoding="utf-8")
    zipar_pasta(temp, "conselho", SAIDA / "skills" / "conselho.zip")
    shutil.rmtree(temp)
    feitos.append("conselho")

    with zipfile.ZipFile(SAIDA / "ambiente-completo.zip", "w", zipfile.ZIP_DEFLATED) as z:
        for pacote in sorted((SAIDA / "skills").glob("*.zip")):
            z.write(pacote, Path("skills") / pacote.name)
        z.write(RAIZ / "web" / "INSTRUCOES-DO-PROJETO.md", "INSTRUCOES-DO-PROJETO.md")
        z.write(RAIZ / "web" / "LEIA-ME.md", "LEIA-ME.md")

    with zipfile.ZipFile(SAIDA / "conhecimento.zip", "w", zipfile.ZIP_DEFLATED) as z:
        for rel in CONHECIMENTO:
            arq = RAIZ / rel
            if arq.exists():
                z.write(arq, rel)

    print(f"{len(feitos)} skills em {SAIDA / 'skills'}")
    print("ambiente-completo.zip e conhecimento.zip prontos")


if __name__ == "__main__":
    main()
