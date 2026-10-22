# Confere se o computador esta pronto para o ambiente Claude Code.
# NAO instala nada sozinho: mostra o que falta e o comando para instalar.
# Cria o arquivo .env a partir do .env.exemplo se ele ainda nao existir.
#
# uso (na pasta do projeto, no PowerShell):
#   powershell -ExecutionPolicy Bypass -File .\scripts\instalar.ps1
#
# Sem acento neste arquivo: o PowerShell 5.1 le .ps1 sem BOM como ANSI.

$raiz = Split-Path $PSScriptRoot -Parent
$faltando = 0

function Tem-Comando([string]$nome) { [bool](Get-Command $nome -ErrorAction SilentlyContinue) }

function Linha-Ok([string]$nome, [string]$detalhe) {
    Write-Host ("  [ok]     {0}: {1}" -f $nome, $detalhe) -ForegroundColor Green
}

function Linha-Falta([string]$nome, [string]$comando) {
    $script:faltando++
    Write-Host ("  [FALTA]  {0}" -f $nome) -ForegroundColor Yellow
    Write-Host ("           para instalar, copie e cole no PowerShell:")
    Write-Host ("           {0}" -f $comando) -ForegroundColor Cyan
}

function Linha-Aviso([string]$texto) {
    Write-Host ("  [aviso]  {0}" -f $texto) -ForegroundColor DarkYellow
}

function Achar-Python {
    foreach ($c in @('py', 'python')) {
        if (Tem-Comando $c) {
            $saida = ''
            try { $saida = (& $c --version 2>&1 | Out-String) } catch { }
            if ($saida -match 'Python 3') { return $saida.Trim() }
        }
    }
    return $null
}

function Achar-Code {
    $c = Get-Command code -ErrorAction SilentlyContinue
    if ($c) { return $c.Source }
    $p = Join-Path $env:LOCALAPPDATA 'Programs\Microsoft VS Code\bin\code.cmd'
    if (Test-Path -LiteralPath $p) { return $p }
    return $null
}

Write-Host ""
Write-Host "Conferindo o seu computador..." -ForegroundColor Cyan
Write-Host ""

if (-not (Tem-Comando 'winget')) {
    Linha-Aviso "O winget (instalador do Windows) nao foi encontrado. Atualize o 'Instalador de Aplicativo' na Microsoft Store, ou baixe os programas pelos sites: git-scm.com, nodejs.org, python.org, code.visualstudio.com."
}

# 1. Git
if (Tem-Comando 'git') { Linha-Ok 'Git' ((git --version) -join ' ') }
else { Linha-Falta 'Git' 'winget install --id Git.Git -e --source winget' }

# 2. Node
if (Tem-Comando 'node') { Linha-Ok 'Node' ((node --version) -join ' ') }
else { Linha-Falta 'Node (versao LTS)' 'winget install --id OpenJS.NodeJS.LTS -e --source winget' }

# 3. Python
$py = Achar-Python
if ($py) { Linha-Ok 'Python' $py }
else { Linha-Falta 'Python' 'winget install --id Python.Python.3.12 -e --source winget' }

# 4. VS Code
$code = Achar-Code
if ($code) { Linha-Ok 'VS Code' 'instalado' }
else { Linha-Falta 'VS Code' 'winget install --id Microsoft.VisualStudioCode -e --source winget' }

# 5. Claude Code (comando claude)
if (Tem-Comando 'claude') { Linha-Ok 'Claude Code' ((claude --version 2>&1) -join ' ') }
else {
    if (Tem-Comando 'npm') { Linha-Falta 'Claude Code (comando claude)' 'npm install -g @anthropic-ai/claude-code' }
    else { Linha-Falta 'Claude Code (comando claude)' 'primeiro instale o Node (acima); depois: npm install -g @anthropic-ai/claude-code' }
}

Write-Host ""
Write-Host "Conferencias extras (nao travam nada):" -ForegroundColor Cyan

# Extensao Claude Code no VS Code
if ($code) {
    $ext = ''
    try { $ext = (& $code --list-extensions 2>$null | Out-String) } catch { }
    if ($ext -match '(?i)anthropic\.claude-code') { Linha-Ok 'Extensao Claude Code no VS Code' 'instalada' }
    else { Linha-Aviso "A extensao Claude Code ainda nao esta no VS Code. Instale com: code --install-extension anthropic.claude-code" }
}

# Identidade do Git (necessaria para salvar versoes)
if (Tem-Comando 'git') {
    $nomeGit = (git config --global user.name) -join ''
    $emailGit = (git config --global user.email) -join ''
    if ($nomeGit -and $emailGit) { Linha-Ok 'Identidade do Git' 'nome e e-mail configurados' }
    else { Linha-Aviso 'O Git ainda nao sabe seu nome. Rode: git config --global user.name "Seu Nome"  e  git config --global user.email "seu@email.com"' }
}

# bsk (Navegador Osimplify)
$bskCaminho = Join-Path $HOME '.local\bin\bsk.exe'
if ((Tem-Comando 'bsk') -or (Test-Path -LiteralPath $bskCaminho)) { Linha-Ok 'bsk (Navegador Osimplify)' 'instalado' }
else { Linha-Aviso 'O bsk (ponte do Claude com o Chrome) ainda nao esta instalado. Veja o passo "Navegador Osimplify" no INSTALAR.md.' }

# 6. .env
Write-Host ""
$envArq = Join-Path $raiz '.env'
$envModelo = Join-Path $raiz '.env.exemplo'
if (Test-Path -LiteralPath $envArq) {
    Linha-Ok '.env' 'ja existe (nao mexi nele)'
}
elseif (Test-Path -LiteralPath $envModelo) {
    Copy-Item -LiteralPath $envModelo -Destination $envArq
    Linha-Ok '.env' 'criado a partir do .env.exemplo. Preencha as chaves aos poucos, so as que for usar.'
}
else {
    Linha-Aviso 'Nao achei o .env.exemplo. Rode este script de dentro da pasta do projeto.'
}

# 7. Proximo passo
Write-Host ""
if ($faltando -gt 0) {
    Write-Host "Faltam $faltando item(ns) acima." -ForegroundColor Yellow
    Write-Host "Proximo passo: rode os comandos 'winget' ou 'npm' mostrados, um de cada vez, feche e abra o PowerShell (para o Windows enxergar os programas novos) e rode este script de novo."
}
else {
    Write-Host "Tudo certo no computador." -ForegroundColor Green
    Write-Host "Proximo passo: abra esta pasta no VS Code (digite: code .), abra o Claude Code e peca:"
    Write-Host "  me entrevista para preencher meu perfil" -ForegroundColor Cyan
}
Write-Host ""
