# Instalar: passo a passo para Windows

Para quem nunca usou. Leva cerca de 40 minutos, e você só faz isso uma vez.

Quer só testar, sem instalar nada? Use pelo navegador: [web/LEIA-ME.md](web/LEIA-ME.md).

**Você vai precisar de:** um computador com Windows 10 ou 11, o Google Chrome, um e-mail e um cartão para o plano do Claude.

**Como abrir o PowerShell** (a janela onde você cola os comandos): aperte a tecla Windows, digite `PowerShell` e aperte Enter. Para colar um comando, clique com o botão direito dentro da janela e aperte Enter. Cada bloco de comando abaixo se cola de uma vez.

Onde aparecer **"a Osimplify te manda"**, é algo que só a Osimplify entrega. Peça pelo WhatsApp.

---

## 1. Conta no GitHub

O GitHub guarda a pasta do seu ambiente (pense num Google Drive para esse tipo de pasta) e mantém o histórico de tudo que mudou.

1. Entre em `github.com` e clique em **Sign up**. Crie a conta com o seu e-mail e confirme o e-mail.
2. Entre em `github.com/osimplifyagencia-creator/ambiente-rodriguinho`, clique em **Use this template** e depois em **Create a new repository**.
3. Dê um nome (por exemplo `ambiente-minha-empresa`), marque **Private** e clique em **Create repository**. Copie o link que aparece no navegador: é o **link do seu repositório**, usado no passo 5.

## 2. Plano do Claude

1. Entre em `claude.ai` e crie a conta.
2. Escolha um plano pago (o Claude Code vem incluído nos planos **Pro** e **Max**). Comece pelo Pro; se o limite acabar rápido, suba para o Max.

## 3. Instalar os programas

No PowerShell, cole este bloco (ele instala Git, Node, Python e VS Code). Se pedir para aceitar termos, digite `Y` e Enter.

```powershell
winget install --id Git.Git -e --source winget
winget install --id OpenJS.NodeJS.LTS -e --source winget
winget install --id Python.Python.3.12 -e --source winget
winget install --id Microsoft.VisualStudioCode -e --source winget
```

Depois **feche o PowerShell e abra de novo** (o Windows só enxerga os programas novos numa janela nova). Confira:

```powershell
git --version
node --version
python --version
```

Cada um deve mostrar um número de versão. Se o `winget` não existir no seu computador, instale pelos sites: `git-scm.com`, `nodejs.org` (versão LTS), `python.org` (marque **Add python.exe to PATH**) e `code.visualstudio.com`.

Diga ao Git quem é você (troque pelos seus dados):

```powershell
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

Instale também o comando `claude`:

```powershell
npm install -g @anthropic-ai/claude-code
```

## 4. VS Code e a extensão Claude Code

1. Abra o **VS Code**.
2. Aperte `Ctrl+Shift+X` (abre as extensões), busque **Claude Code** (de Anthropic) e clique em **Install**. Ou, no PowerShell: `code --install-extension anthropic.claude-code`.
3. Clique no ícone do Claude na barra do VS Code, escolha **Sign in** e entre com a conta do passo 2. O navegador abre, você confirma, e volta para o VS Code.

## 5. Baixar o seu ambiente

No PowerShell, troque `LINK-DO-REPOSITORIO` pelo link do seu repositório (passo 1):

```powershell
cd $HOME\Documents
git clone LINK-DO-REPOSITORIO
```

Na primeira vez, abre uma janela pedindo o login do GitHub: entre com a conta do passo 1. A pasta do seu ambiente aparece dentro de **Documentos**.

## 6. Abrir no VS Code

```powershell
cd NOME-DA-PASTA-QUE-FOI-CRIADA
code .
```

(ou, no VS Code: **File**, **Open Folder** e escolha a pasta). Se perguntar se confia nos autores da pasta, clique em **Yes, I trust**. Abra o Claude pelo ícone dele: a partir daqui ele já conhece este ambiente, porque lê o arquivo `CLAUDE.md` da pasta.

## 7. Conferir o computador e criar o arquivo das chaves

No VS Code, abra o terminal (menu **Terminal**, **New Terminal**) e rode:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\instalar.ps1
```

O script **não instala nada sozinho**. Ele confere Git, Node, Python, VS Code e Claude Code, mostra o que falta (com o comando para instalar), cria o arquivo `.env` a partir do `.env.exemplo` e diz qual é o próximo passo.

Sobre o `.env`:

- É onde ficam as **chaves** (de acesso à Meta, ao Google e ao Gemini). Cada linha do `.env.exemplo` diz de onde pegar a chave.
- Ele **nunca vai para o GitHub** e **nunca se cola no chat**.
- Não precisa preencher tudo agora. As skills (principalmente a `meta-app-e-acessos`) te guiam quando chegar a hora de cada chave.
- Se preferir fazer à mão: `Copy-Item .env.exemplo .env`.

## 8. Navegador Osimplify

É a extensão do Chrome que deixa o Claude abrir sites, entrar nas suas contas e clicar, numa janela separada que você acompanha. Ele usa o seu Chrome só por essa extensão, e para na hora quando você desliga o interruptor.

Antes: tenha o **Google Chrome** instalado e o **Claude Code aberto pelo menos uma vez** (passo 4).

1. **Baixe o instalador** em uma pasta que você não vai mover nem apagar (o Chrome lê a extensão direto dela):

   ```powershell
   git clone https://github.com/osimplifyagencia-creator/osimplify-navegador-instalar.git C:\osimplify-navegador
   ```

   Se o endereço der "não encontrado" ou pedir login, **a Osimplify te manda** a pasta compactada (arquivo `.zip`): descompacte em `C:\osimplify-navegador`.
2. Abra a pasta `C:\osimplify-navegador` e dê **dois cliques em `INSTALAR.bat`**. Ele instala o `bsk` (a ponte entre o Claude e o Chrome), instala a skill no Claude Code e abre o Chrome na tela de extensões. Não feche a janela preta.
3. No Chrome que abriu (`chrome://extensions`):
   - ligue o **Modo do desenvolvedor**, no canto de cima à direita;
   - clique em **Carregar sem compactação**;
   - cole o caminho da pasta `extensao` (o instalador já deixou copiado, é só `Ctrl+V`; é `C:\osimplify-navegador\extensao`) e confirme.
4. Clique no ícone do **Navegador Osimplify** na barra do Chrome (se não aparecer, clique na peça de quebra-cabeça e fixe). No quadro que abrir:
   - ligue o interruptor de conexão e espere aparecer **Conectado** (a porta `52800` é a padrão);
   - dê um nome ao navegador, por exemplo `meu-chrome`.
5. Volte à janela preta do instalador e aperte Enter. Ele confere a ligação e mostra o seu Chrome na lista. Se o seu Chrome aparece, está pronto.
6. **Feche e abra de novo o VS Code** para o Claude enxergar a skill.
7. **Teste.** No Claude, peça:

   > Usa o navegador-osimplify, abre https://example.com e me diz o título da página.

   Uma janela nova do Chrome abre com o aviso "O agente está no controle", e o Claude responde "Example Domain". Se respondeu, funciona.

Bom saber:

- O Chrome mostra o aviso "Desative as extensões no modo de desenvolvedor" toda vez que abre. É normal para extensão carregada de pasta: feche o aviso.
- Se houver mais de um Chrome conectado, rode `bsk browsers`, copie o código (ou o nome) do seu e ponha no `.env` na linha `BSK_NAVEGADOR=`.
- Para parar o Claude no navegador a qualquer hora: desligue o interruptor no ícone da extensão.
- Atualizar quando sair versão nova: `cd C:\osimplify-navegador`, `git pull`, e no `chrome://extensions` clique na seta de recarregar do cartão da extensão.
- Se algum erro aparecer no instalador, copie o texto e mande para a Osimplify.

## 9. Primeiro uso: preencher o perfil da empresa

O ambiente só dá respostas boas se conhecer o seu negócio. Abra o Claude na pasta e peça:

> me entrevista para preencher meu perfil

Ele faz perguntas curtas, uma seção por vez (o que você vende, preço, público, concorrentes, metas, números do mês, tom da marca), escreve as respostas no arquivo `empresa/PERFIL.md` e lê de volta para você conferir. Leva uns 15 minutos. Se não souber um número, diga "não sei": ele marca `[a confirmar]`.

## 10. Cinco pedidos para testar

Digite no Claude, do jeito que você falaria:

1. **"Monta meu dia."** Ele lê metas e pendências e propõe 3 coisas para fazer hoje (skill `plano-do-dia`).
2. **"Vê se estou pronto para anunciar."** Ele confere oferta, público, mensagem e rastreio e dá um veredito (skill `pre-voo-de-trafego`).
3. **"O cliente me mandou isso: [cole a mensagem]. Como eu respondo?"** Ele lê a situação e escreve a resposta em balões curtos (skill `copiloto-whatsapp`).
4. **"Cria um carrossel de Instagram sobre [assunto]."** Ele monta os slides, os pedidos de imagem e a legenda no tom da sua marca (skill `carrossel`).
5. **"Faz o raio-x do meu comercial: onde estou perdendo venda?"** Ele percorre da vitrine ao pós-venda e mostra onde vaza (skill `raio-x-comercial`).

## 11. Salvar o seu trabalho no GitHub

Quando quiser guardar o que foi feito, peça: **"salva meu trabalho no GitHub"**. O Claude só salva (commit e push) quando você pede.

## 12. Regras de segurança, em 4 linhas

- O Claude **pede o seu ok antes de gastar dinheiro, deixar anúncio ativo, mandar mensagem para cliente ou publicar**.
- Anúncio é criado **pausado** e só liga com o seu ok.
- Chaves e senhas ficam só no `.env`. Nunca cole no chat.
- Senha, código do celular e captcha, quem digita é você.

## Se der errado

| O que aparece | O que fazer |
|---|---|
| `git`, `node` ou `python` "não é reconhecido" | Feche o PowerShell e abra de novo. Se continuar, rode o `scripts\instalar.ps1` e instale o que ele marcar como FALTA. |
| O script diz que "a execução de scripts está desabilitada" | Rode do jeito do passo 7, com `-ExecutionPolicy Bypass`. |
| O Claude pede login de novo | Entre de novo com a conta do passo 2. |
| O quadro da extensão fica em "Desconectado" | No PowerShell, rode `bsk doctor` e siga a dica da linha que falhou. |
| `bsk` "não é reconhecido" | Feche e abra o PowerShell. Se continuar, rode o `INSTALAR.bat` de novo. |
| O Claude diz que não conhece o navegador-osimplify | Feche e abra o VS Code. |
| A extensão sumiu do Chrome | A pasta foi movida ou apagada. Refaça os passos 1 e 3 da seção Navegador Osimplify. |
| Qualquer outro erro | Copie o texto do erro e mande para a Osimplify. |
