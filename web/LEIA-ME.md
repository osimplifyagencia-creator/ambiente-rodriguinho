# Usar no claude.ai (navegador, app do celular e app do computador)

O mesmo ambiente do Claude Code, para usar sem instalar nada. Leva uns 10 minutos.

**O que funciona aqui:** todas as skills de texto e estratégia (vendas, conteúdo, carrossel, raio-x, funil, conselho, plano do dia, anotações, explicações).
**O que só funciona no computador (Claude Code):** navegador, subir anúncio pela API da Meta ou do Google e qualquer coisa que rode script. Para isso, siga o [INSTALAR.md](../INSTALAR.md).

Precisa de plano pago do Claude (Pro, Max, Team ou Enterprise).

---

## 1. Baixar os pacotes

Na página do repositório no GitHub, abra a pasta `web/pacotes/` e baixe:

- `ambiente-completo.zip` (todas as skills e estas instruções);
- `conhecimento.zip` (o modelo do perfil da empresa, metas e rotinas).

Descompacte os dois.

## 2. Ligar as skills

1. No claude.ai, abra **Configurações, Capacidades** e ligue **Execução de código e criação de arquivos**.
2. Na mesma tela, em **Skills**, clique em **Enviar skill** e escolha um arquivo `.zip` da pasta `skills/`. Repita para cada um (são 25). Comece por estes, se tiver pressa: `conselho`, `plano-do-dia`, `copiloto-whatsapp`, `whatsapp-sales-process`, `carrossel`, `conteudo-da-empresa`, `raio-x-comercial`, `pre-voo-de-trafego`.
3. Confira que todas aparecem ligadas na lista.

Em conta Team ou Enterprise, o administrador pode subir as skills uma vez para a organização inteira.

## 3. Criar o Projeto

1. No claude.ai, clique em **Projetos, Novo projeto** e dê o nome da empresa.
2. Em **Instruções do projeto**, cole o texto do arquivo [INSTRUCOES-DO-PROJETO.md](INSTRUCOES-DO-PROJETO.md) (tudo abaixo da linha).
3. Em **Conhecimento do projeto**, suba os arquivos de `conhecimento.zip` (`PERFIL.md`, `metas.md`, `rotinas.md`, `plano-do-dia.md`, `INDICE.md`).

## 4. Primeiro uso

Abra uma conversa dentro do Projeto e peça:

> me entrevista para preencher meu perfil

No fim ele devolve o `PERFIL.md` preenchido. Baixe e **substitua** o arquivo antigo no conhecimento do Projeto. Faça o mesmo sempre que preço, meta ou número do mês mudar.

## 5. Cinco pedidos para testar

1. "Monta meu dia."
2. "Vê se estou pronto para anunciar."
3. "O cliente me mandou isso: [cole a mensagem]. Como eu respondo?"
4. "Cria um carrossel de Instagram sobre [assunto]."
5. "O conselho acha que eu posso contratar alguém agora?"

---

## Claude Code na web (claude.ai/code)

Quem quer o ambiente completo, com as pastas e o histórico, sem instalar nada no computador:

1. Faça a sua cópia privada do repositório (botão **Use this template** no GitHub, veja o [README](../README.md)).
2. Entre em `claude.ai/code`, conecte o GitHub e escolha o seu repositório.
3. O Claude lê o `CLAUDE.md`, as skills e os agentes direto do repositório. Peça "me entrevista para preencher meu perfil" e, no fim, "salva meu trabalho no GitHub".

O navegador (`navegador-osimplify`) não roda na nuvem: ele precisa do Chrome do seu computador.

## Atualizar

Quando o repositório ganhar skill nova ou mudada, baixe de novo o `.zip` dela e envie por cima da antiga em **Configurações, Capacidades, Skills**.
Quem mantém o repositório gera os pacotes com `python scripts/empacotar-web.py`.
