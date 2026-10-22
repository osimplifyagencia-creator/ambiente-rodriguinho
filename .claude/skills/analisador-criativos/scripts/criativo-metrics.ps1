<#
  criativo-metrics.ps1 - ajudante do analisador-criativos
  ASCII puro de proposito: o PowerShell 5.1 le .ps1 como ANSI; acento, travessao e emoji quebram o leitor.
  Roda sozinho: nao precisa de .env, de internet nem de nenhuma outra pasta.

  Funcoes:
   1) Get-CriativoInfo  -> tamanho REAL em px, proporcao, placement e peso do arquivo.
      jpg/jpeg/png pelo System.Drawing; .webp pelo cabecalho RIFF/WEBP (o System.Drawing do PS 5.1
      nao abre WebP). Nunca estime px a olho: o inventario da rubrica pede a medida real.
   2) Get-NotaCriativo  -> media ponderada das 8 dimensoes pelo perfil (ENGAJAMENTO padrao ou CONVERSAO),
      confere que os pesos somam 100 e aplica as travas do veredito (nao deixa SOBE com dimensao < 5,
      nem com D6 < 6). O gate de compliance NAO e avaliado aqui: quem decide e voce.
   3) Get-ContrastRatio -> contraste WCAG entre a cor do texto e a do fundo. Exato e sem chute: leia as
      duas cores na peca (conta-gotas) e o script confere a regua (corpo >= 4.5, titulo >= 3.0).
   4) Get-CraftInfo     -> densidade de detalhe (proxy de quanto a peca compete consigo mesma) e
      luminancia media. NAO e leitor de texto (OCR).

  USO (PowerShell, na pasta do script):
   . .\criativo-metrics.ps1                                    # carrega as funcoes
   Get-CriativoInfo -Path ..\..\..\..\empresa\trafego\criativos\entrada\2026-10-21
   Get-NotaCriativo -D 8,8,9,7,6,7,8,7                         # perfil ENGAJAMENTO
   Get-NotaCriativo -D 6,4,3,3,2,7,7,3 -Perfil CONVERSAO      # perfil CONVERSAO
   Get-ContrastRatio -Fg '#E8C66A' -Bg '#0A0A0A'              # dourado sobre preto
   Get-CraftInfo -Path .\peca-01.png                           # densidade + luminancia
#>

# ---------- WebP: tamanho pelo cabecalho (sem System.Drawing) ----------
function Get-WebpSize {
  param([Parameter(Mandatory)][string]$Path)
  $b = [System.IO.File]::ReadAllBytes($Path)
  if ($b.Length -lt 30) { return $null }
  if ([System.Text.Encoding]::ASCII.GetString($b,0,4) -ne 'RIFF') { return $null }
  if ([System.Text.Encoding]::ASCII.GetString($b,8,4) -ne 'WEBP') { return $null }
  $fmt = [System.Text.Encoding]::ASCII.GetString($b,12,4)
  switch ($fmt) {
    'VP8 ' { # com perda: 14 bits de largura e de altura depois do start code (offsets 26 e 28)
      $w = (([int]$b[26] -bor ([int]$b[27] -shl 8)) -band 0x3fff)
      $h = (([int]$b[28] -bor ([int]$b[29] -shl 8)) -band 0x3fff)
      return [pscustomobject]@{ W=$w; H=$h }
    }
    'VP8L' { # sem perda: 14 bits de (largura-1) e 14 de (altura-1), empacotados a partir do offset 21
      $b1=[int]$b[21]; $b2=[int]$b[22]; $b3=[int]$b[23]; $b4=[int]$b[24]
      $w = ((($b2 -band 0x3f) -shl 8) -bor $b1) + 1
      $h = ((($b4 -band 0x0f) -shl 10) -bor ($b3 -shl 2) -bor (($b2 -band 0xc0) -shr 6)) + 1
      return [pscustomobject]@{ W=$w; H=$h }
    }
    'VP8X' { # estendido: 24 bits de (largura-1) no offset 24 e de (altura-1) no 27, little-endian
      # converter para [int] ANTES do shift: [byte] -shl 8 volta a byte (1024 viraria 0).
      $w = ([int]$b[24] -bor ([int]$b[25] -shl 8) -bor ([int]$b[26] -shl 16)) + 1
      $h = ([int]$b[27] -bor ([int]$b[28] -shl 8) -bor ([int]$b[29] -shl 16)) + 1
      return [pscustomobject]@{ W=$w; H=$h }
    }
    default { return $null }
  }
}

# ---------- proporcao e placement ----------
function Get-RatioPlacement {
  param([int]$W,[int]$H)
  $a=$W; $b=$H
  while ($b -ne 0) { $t=$b; $b=$a % $b; $a=$t }
  $ratio = "{0}:{1}" -f ($W/$a), ($H/$a)
  $r = $W / $H
  if ([math]::Abs($r-1) -lt 0.02) { $place='1:1 feed' }
  elseif ([math]::Abs($r-0.8) -lt 0.03) { $place='4:5 feed' }
  elseif ([math]::Abs($r-0.5625) -lt 0.03) { $place='9:16 stories/reels' }
  else { $place='fora do padrao' }
  $menor = [math]::Min($W,$H)
  $aviso = if ($menor -lt 1080) { 'lado menor abaixo de 1080px (apontamento de craft)' } else { '' }
  [pscustomobject]@{ Proporcao=$ratio; Placement=$place; Aviso=$aviso }
}

function Get-CriativoInfo {
  param([Parameter(Mandatory)][string]$Path)
  Add-Type -AssemblyName System.Drawing

  if (Test-Path $Path -PathType Container) {
    $items = Get-ChildItem -Path $Path -File | Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|webp)$' }
  } else {
    $items = Get-Item $Path
  }

  foreach ($f in $items) {
    try {
      $w=0; $h=0
      if ($f.Extension -match '(?i)\.webp$') {
        $s = Get-WebpSize -Path $f.FullName
        if (-not $s) { Write-Warning "WebP nao reconhecido: $($f.Name)"; continue }
        $w=$s.W; $h=$s.H
      } else {
        $img = [System.Drawing.Image]::FromFile($f.FullName)
        $w=$img.Width; $h=$img.Height
        $img.Dispose()
      }
      $rp = Get-RatioPlacement -W $w -H $h
      [pscustomobject]@{
        Arquivo   = $f.Name
        Dimensoes = "$w x $h px"
        Proporcao = $rp.Proporcao
        Placement = $rp.Placement
        PesoKB    = [math]::Round($f.Length/1KB,0)
        Aviso     = $rp.Aviso
      }
    } catch {
      Write-Warning "Falha ao ler $($f.Name): $_"
    }
  }
}

function Get-NotaCriativo {
  param(
    [Parameter(Mandatory)][ValidateCount(8,8)][int[]]$D,
    [ValidateSet('ENGAJAMENTO','CONVERSAO')][string]$Perfil = 'ENGAJAMENTO'
  )
  if ($Perfil -eq 'CONVERSAO') { $pesos = 20,10,15,5,10,15,15,10 } else { $pesos = 25,10,10,5,10,10,15,15 }
  $soma = ($pesos | Measure-Object -Sum).Sum
  if ($soma -ne 100) { throw "Pesos do perfil $Perfil nao somam 100 (=$soma)." }

  $acc = 0
  for ($i=0; $i -lt 8; $i++) {
    if ($D[$i] -lt 0 -or $D[$i] -gt 10) { throw "D$($i+1)=$($D[$i]) fora de 0-10." }
    $acc += $D[$i] * $pesos[$i]
  }
  # meio pra cima: 7,85 vira 7,9 (como na conta feita a mao)
  $nota = [math]::Round($acc/100, 1, [System.MidpointRounding]::AwayFromZero)

  $min = ($D | Measure-Object -Minimum).Minimum
  $max = ($D | Measure-Object -Maximum).Maximum
  if ($nota -lt $min -or $nota -gt $max) { Write-Warning "Nota $nota fora do intervalo [$min,$max]: erro de conta." }

  # veredito e travas
  $temDimAbaixo5 = (($D | Where-Object { $_ -lt 5 }).Count -gt 0)
  if ($nota -ge 7.5) { $veredito = 'SOBE' }
  elseif ($nota -ge 5.5) { $veredito = 'AJUSTA' }
  else { $veredito = 'REFAZ' }
  if ($temDimAbaixo5 -and $veredito -eq 'SOBE') { $veredito = 'AJUSTA (tem dimensao abaixo de 5: nao pode SOBE)' }
  if ($D[5] -lt 6 -and $veredito -eq 'SOBE') { $veredito = 'AJUSTA (D6 abaixo de 6: acao fraca nao SOBE)' }
  if ($D[4] -lt 6 -and $veredito -eq 'SOBE') { $veredito = 'SOBE [condicionado: D5 abaixo de 6, so se a prova estiver coberta em outra peca do lote]' }
  if ($D[2] -le 3) { $veredito = 'REFAZ (D3 ate 3: angulo errado para o publico)' }

  $partes = for ($i=0; $i -lt 8; $i++) { "$($D[$i])x$($pesos[$i])" }
  $conta = "(" + ($partes -join ' + ') + ") / 100"

  [pscustomobject]@{
    Perfil   = $Perfil
    D1=$D[0]; D2=$D[1]; D3=$D[2]; D4=$D[3]; D5=$D[4]; D6=$D[5]; D7=$D[6]; D8=$D[7]
    Conta    = $conta
    Nota     = $nota
    Veredito = $veredito
    Lembrete = 'Gate de compliance nao entra nesta conta: gate reprovado vira REFAZ mesmo com nota alta.'
  }
}

# ---------- craft objetivo ----------
function ConvertTo-LinearChannel { param([double]$c) if ($c -le 0.03928) { return $c/12.92 } else { return [math]::Pow((($c+0.055)/1.055),2.4) } }

function Get-Luminance {
  param([int]$R,[int]$G,[int]$B)
  $rl = ConvertTo-LinearChannel ($R/255.0)
  $gl = ConvertTo-LinearChannel ($G/255.0)
  $bl = ConvertTo-LinearChannel ($B/255.0)
  return (0.2126*$rl + 0.7152*$gl + 0.0722*$bl)
}

function Get-ContrastRatio {
  param(
    [Parameter(Mandatory)][string]$Fg,   # '#RRGGBB' ou 'RRGGBB'
    [Parameter(Mandatory)][string]$Bg
  )
  function Parse-Hex([string]$h) {
    $h = $h.TrimStart('#')
    if ($h.Length -ne 6) { throw "Cor invalida '$h': use #RRGGBB." }
    return @([Convert]::ToInt32($h.Substring(0,2),16), [Convert]::ToInt32($h.Substring(2,2),16), [Convert]::ToInt32($h.Substring(4,2),16))
  }
  $f = Parse-Hex $Fg; $b = Parse-Hex $Bg
  $lf = Get-Luminance -R $f[0] -G $f[1] -B $f[2]
  $lb = Get-Luminance -R $b[0] -G $b[1] -B $b[2]
  $hi = [math]::Max($lf,$lb); $lo = [math]::Min($lf,$lb)
  $ratio = [math]::Round((($hi+0.05)/($lo+0.05)),2)
  [pscustomobject]@{
    Contraste = "$ratio : 1"
    Corpo_45  = if ($ratio -ge 4.5) { 'PASSA (4.5 ou mais)' } else { 'FALHA (abaixo de 4.5): corpo ilegivel a 360px, craft com teto 5 e faixa ou placa atras do texto' }
    Titulo_3  = if ($ratio -ge 3.0) { 'PASSA (3.0 ou mais)' } else { 'FALHA (abaixo de 3.0): titulo ilegivel a 360px, craft com teto 5 e faixa ou placa atras do texto' }
  }
}

function Get-CraftInfo {
  param(
    [Parameter(Mandatory)][string]$Path,
    [int]$Sample = 160,          # largura da miniatura usada na conta (rapido)
    [int]$EdgeThreshold = 28     # diferenca de luminancia (0-255) que conta como borda
  )
  Add-Type -AssemblyName System.Drawing
  $f = Get-Item $Path
  if ($f.Extension -match '(?i)\.webp$') {
    $s = Get-WebpSize -Path $f.FullName
    if ($s) { Write-Warning "WebP: $($f.Name) = $($s.W)x$($s.H) px. A analise de pixel nao funciona em .webp no PS 5.1: converta para png/jpg ou use Get-ContrastRatio com as cores lidas na peca." }
    return
  }
  $img = [System.Drawing.Image]::FromFile($f.FullName)
  $w0=$img.Width; $h0=$img.Height
  $scale = $Sample / [double]$w0
  $sw=[int]($w0*$scale); $sh=[int]($h0*$scale)
  $bmp = New-Object System.Drawing.Bitmap $sw,$sh
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBilinear
  $g.DrawImage($img, 0, 0, $sw, $sh)
  $g.Dispose(); $img.Dispose()

  # luminancia por pixel na miniatura (lista 1D: indice = y*sw + x)
  $totalPix = $sw*$sh
  $lum = New-Object 'int[]' $totalPix
  $somaLum=0.0
  for ($y=0; $y -lt $sh; $y++) {
    $row = $y*$sw
    for ($x=0; $x -lt $sw; $x++) {
      $c = $bmp.GetPixel($x,$y)
      $L = [int](0.299*$c.R + 0.587*$c.G + 0.114*$c.B)
      $lum[$row+$x]=$L; $somaLum+=$L
    }
  }
  $edges=0
  for ($y=0; $y -lt $sh; $y++) {
    $row = $y*$sw
    for ($x=1; $x -lt $sw; $x++) {
      $diff = $lum[$row+$x] - $lum[$row+$x-1]
      if ($diff -lt 0) { $diff = -$diff }
      if ($diff -ge $EdgeThreshold) { $edges++ }
    }
  }
  $bmp.Dispose()
  $densidade = [math]::Round(100.0*$edges/$totalPix,1)
  $lumMedia = [math]::Round($somaLum/$totalPix,0)
  $alerta = if ($densidade -gt 40) { 'densidade alta (acima de 40%): a peca pode estar competindo consigo mesma (texto ou elementos demais contra o gancho). Conferir o craft.' } else { '' }

  [pscustomobject]@{
    Arquivo          = $f.Name
    DensidadeDetalhe = "$densidade %"   # proxy de bordas e detalhe; nao e leitura de texto
    LuminanciaMedia  = $lumMedia        # 0-255 (peca clara ou escura no geral)
    Alerta           = $alerta
    Nota             = 'Proxy de densidade visual, nao OCR. Para o contraste exato do texto use Get-ContrastRatio com as cores lidas na peca.'
  }
}

Write-Host "Funcoes: Get-CriativoInfo, Get-NotaCriativo, Get-ContrastRatio, Get-CraftInfo, Get-WebpSize." -ForegroundColor Cyan
