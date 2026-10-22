# Abre uma sessao do bsk no Navegador Osimplify (o Chrome do dono) e navega.
# Sem acento neste arquivo: o PowerShell 5.1 le .ps1 sem BOM como ANSI.
#
# uso:
#   & .claude\skills\navegador-osimplify\scripts\abrir.ps1 -Url https://exemplo.com
#   & .claude\skills\navegador-osimplify\scripts\abrir.ps1 -Url https://exemplo.com -Navegador meu-chrome
#
# Qual Chrome usar:
#   1. o parametro -Navegador (id da instancia ou nome dado no popup da extensao);
#   2. a variavel BSK_NAVEGADOR (ambiente ou linha BSK_NAVEGADOR= do arquivo .env);
#   3. se so houver um Chrome conectado, ele mesmo.
param(
    [string]$Url = 'about:blank',
    [string]$Navegador = '',
    [int]$Largura = 1440,
    [int]$Altura = 900
)

function Achar-Bsk {
    $c = Get-Command bsk -ErrorAction SilentlyContinue
    if ($c) { return $c.Source }
    $p = Join-Path $HOME '.local\bin\bsk.exe'
    if (Test-Path -LiteralPath $p) { return $p }
    return $null
}

$b = Achar-Bsk
if (-not $b) {
    'ERRO: o bsk nao esta instalado. Siga o passo do Navegador Osimplify no INSTALAR.md.'
    exit 1
}

function Listar-Navegadores {
    $j = (& $b browsers --json 2>$null | Out-String)
    if (-not $j.Trim()) { return @() }
    try { return @($j | ConvertFrom-Json) } catch { return @() }
}

# Qual navegador: parametro, depois ambiente, depois a linha BSK_NAVEGADOR do .env (so essa linha e lida).
if (-not $Navegador) { $Navegador = $env:BSK_NAVEGADOR }
if (-not $Navegador) {
    $raiz = $PSScriptRoot
    foreach ($i in 1..4) { $raiz = Split-Path $raiz -Parent }
    $arq = Join-Path $raiz '.env'
    if (Test-Path -LiteralPath $arq) {
        $linha = Get-Content -LiteralPath $arq | Where-Object { $_ -match '^\s*BSK_NAVEGADOR\s*=' } | Select-Object -First 1
        if ($linha) { $Navegador = (($linha -split '=', 2)[1]).Trim().Trim('"').Trim("'") }
    }
}

# O servico sobe sozinho em qualquer comando, e a extensao reconecta em alguns segundos.
$lista = Listar-Navegadores
if ($lista.Count -eq 0) {
    & $b status | Out-Null
    foreach ($i in 1..6) { Start-Sleep -Seconds 2; $lista = Listar-Navegadores; if ($lista.Count -gt 0) { break } }
}
if ($lista.Count -eq 0) {
    'ERRO: o Navegador Osimplify esta desconectado. Abra o Chrome, clique no icone da extensao e ligue o interruptor ate aparecer Conectado. Nao use outro navegador.'
    exit 1
}

if ($Navegador) {
    $alvo = $lista | Where-Object { $_.instance_id -eq $Navegador -or $_.label -eq $Navegador } | Select-Object -First 1
    if (-not $alvo) {
        "ERRO: nao achei o navegador '$Navegador' entre os conectados:"
        & $b browsers
        exit 1
    }
}
elseif ($lista.Count -eq 1) {
    $alvo = $lista[0]
}
else {
    'ERRO: ha mais de um Chrome conectado. Escolha o do dono e rode de novo com -Navegador <id ou nome>:'
    & $b browsers
    exit 1
}

# Sempre --browser: com mais de um Chrome conectado, a sessao sem alvo cai em qualquer um.
$ses = (& $b session start --browser $alvo.instance_id --no-focus | Select-Object -Last 1).Trim()
& $b window resize --width $Largura --height $Altura --session $ses | Out-Null
& $b navigate $Url --session $ses | Out-Null
& $b wait-ms 1500 | Out-Null
"sessao=$ses"
& $b evaluate "location.href + ' | ' + document.title" --session $ses
