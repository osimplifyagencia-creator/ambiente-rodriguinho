# Ambiente Claude para donos de empresa

Um ambiente pronto para o dono de pequena empresa trabalhar com o Claude: gestão do dia, anúncios (Meta e Google), vendas no WhatsApp, conteúdo e um conselho de IA (CEO, vendas, marketing, tráfego, finanças, gestão, jurídico). São 25 skills e 9 agentes, em português, montados pela Osimplify.

Livre para qualquer pessoa usar e adaptar.

## Escolha como usar

| Jeito | Para quem | O que precisa | Guia |
|---|---|---|---|
| **claude.ai** (navegador, celular, app) | Quer começar hoje, sem instalar nada | Plano pago do Claude | [web/LEIA-ME.md](web/LEIA-ME.md) |
| **Claude Code na web** (claude.ai/code) | Quer as pastas e o histórico, sem instalar | Plano pago do Claude e conta no GitHub | [web/LEIA-ME.md](web/LEIA-ME.md#claude-code-na-web-claudeaicode) |
| **Claude Code no computador** (VS Code) | Quer tudo, inclusive navegador e subir anúncio pela API | Windows 10 ou 11, plano pago e GitHub | [INSTALAR.md](INSTALAR.md) |

Os três usam as mesmas skills. Dá para começar no claude.ai e passar para o computador depois.

## Fazer a sua cópia

1. Crie uma conta em `github.com`.
2. Nesta página, clique em **Use this template**, depois **Create a new repository**.
3. Dê um nome, marque **Private** e clique em **Create repository**.

A sua cópia guarda o perfil da empresa, metas e anotações. Mantenha-a **privada**. Este repositório aqui é só o modelo: não suba dado da sua empresa nele.

## O que vem dentro

```
CLAUDE.md          as regras que o Claude segue neste ambiente
empresa/PERFIL.md  o retrato do negócio (preencha primeiro: "me entrevista para preencher meu perfil")
gestao/            plano do dia, metas e rotinas
anuncios/          campanhas, criativos e relatórios
vendas/            processo, scripts, calls e funis
conteudo/          posts, carrosséis e calendário
anotacoes/         reuniões, pessoas, ideias e decisões
.claude/skills/    o que o Claude sabe fazer
.claude/agents/    o conselho
web/               instruções e pacotes para o claude.ai
scripts/           instalar.ps1 (confere o computador) e empacotar-web.py (gera os pacotes do claude.ai)
```

## Segurança

- Chave, token e senha ficam só no arquivo `.env` do seu computador. Ele nunca vai para o GitHub e nunca se cola no chat.
- O Claude pede o seu ok antes de gastar dinheiro, ativar anúncio, mandar mensagem para cliente ou publicar.
- Anúncio nasce pausado.

## Dúvida ou erro

Copie o texto do erro e fale com a Osimplify.
