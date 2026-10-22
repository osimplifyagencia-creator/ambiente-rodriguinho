---
name: meta-ads-subir-anuncio
description: "Sobe anúncio no Meta (Facebook e Instagram) pela API, do token à campanha ativa, com os erros já conhecidos. Use quando: \"sobe o anúncio\", \"cria a campanha no Meta\". Não é: ler resultado de campanha (meta-ads-expert) nem pegar acesso (meta-app-e-acessos)."
---

# Meta Ads: subir anúncio (playbook de execução pela API)

Recebe um criativo (imagem, vídeo ou reel do Instagram) e um objetivo, e entrega a campanha **ativa** na sua conta de anúncios. Usa a Graph API / Marketing API direto por `curl`.

É a receita validada em produção num caso real: um vídeo de topo e um anúncio que leva a conversa para o WhatsApp (Click-to-WhatsApp), numa conta de serviço local. Todos os erros da tabela de armadilhas foram batidos nesse fluxo.

Conhecimento da plataforma (objetivos, níveis de acesso, App Review): skill `meta-ads-expert`. Acesso e token: skill `meta-app-e-acessos`.

## Credenciais (arquivo `.env` na raiz)

`META_ACCESS_TOKEN`, `META_AD_ACCOUNT_ID`, `META_PAGE_ID`, `META_PIXEL_ID` (quando o objetivo for venda no site), `META_API_VERSION` (opcional), e para conversa no WhatsApp `META_WABA_ID`. **Nunca imprima o valor de uma chave.** Confirme que o `.env` está no `.gitignore`.

---

## Regra de ouro: nunca gaste dinheiro sem o seu OK explícito

- **Construa tudo PAUSADO** (`status=PAUSED` em campanha, conjunto e anúncio).
- Gere a **prévia** e mostre para o dono do negócio.
- **Só ative** (`ACTIVE` nos 3 níveis) quando ele disser "pode ativar".
- Ativar é ação externa e gasta dinheiro real: confirme sempre, mesmo que a pessoa já tenha pedido para "subir".

---

## Versão da API e token

- `GV="${META_API_VERSION:-v26.0}"`. O erro clássico é usar versão velha. Confira a vigente no changelog da Graph API.
- O token ideal é de **usuário do sistema** (não vence). Confira os escopos com `debug_token`: precisa de `ads_management` e `pages_manage_ads`. Sem `instagram_basic` você não consegue ler nem usar posts orgânicos do Instagram (veja "Reel orgânico").
- A forma mais rápida de provar o acesso: `python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py`.

Comandos prontos de cada passo: **`references/api-snippets.md`**.

---

## 0. Contexto e estratégia: antes de montar

Decida **de onde vem o criativo e o texto**.

**Rota A: você já tem o criativo e o texto prontos.** Pule para o passo 1. Só valide 3 coisas: a **voz da sua marca**, a **conformidade** (veja "Pré-requisitos de conta" e, se for saúde, o aviso abaixo) e o **formato** (o quadrado 1:1 serve em tudo).

**Rota B: não tem criativo nem texto.** Consulte a estratégia e delegue a escrita. Nunca invente oferta, preço nem promessa:
1. **Contexto do negócio:** `empresa/PERFIL.md` (oferta, público, praça, preço, diferencial, restrições). Se não existir, pergunte o mínimo e ofereça criar.
2. **Estágio da jornada define o objetivo.** Topo (descoberta) com vídeo vai de `OUTCOME_AWARENESS`. Meio e fundo com oferta vão de conversas no WhatsApp. Recompra vai de público de clientes ou semelhante. O objetivo do passo 3 sai daqui. Veja `pre-voo-de-trafego`.
3. **Ângulo, título e texto:** skill `niveis-de-consciencia` (ângulo por nível de consciência) e `whatsapp-sales-process` (texto e ação para WhatsApp). Não escreva do zero aqui.
4. **Criativo:** gere a imagem com a identidade da sua marca (skills `carrossel` ou `conteudo-da-empresa`). **Antes de subir**, passe a peça por `analisador-criativos`.
5. Volte ao passo 1 com texto, criativo e objetivo definidos.

**Fronteira:** esta skill é a **execução (como)**. O que e por que (estratégia, oferta, ângulo) vem de você ou das skills acima. Aqui se consulta e se sobe. Nunca se inventa oferta, preço nem promessa de resultado.

**Se o seu negócio é de saúde:** o criativo precisa do registro profissional real do responsável (nunca um número de exemplo, risco de reprovar na revisão e de infração ética), sem promessa de cura ou de resultado e sem "antes e depois" enganoso. Confira a norma do seu conselho profissional.

---

## Passo a passo

### 1. Validar o token e DESCOBRIR a conta
Muitas vezes a conta não está documentada. Descubra e grave os IDs públicos em `empresa/PERFIL.md` (o `.env` guarda só os segredos):
- `GET /me` mostra a identidade do token.
- `GET /me/adaccounts` mostra o **act_id**, o status e a moeda.
- `GET /me/accounts?fields=...,instagram_business_account{...}` mostra a **página** e o Instagram.
- `GET /{business_id}/owned_whatsapp_business_accounts` mostra a **conta do WhatsApp** (para anúncio que leva ao WhatsApp).
- Se `/me/accounts` traz a página sem o Instagram, pegue o `instagram_user_id` dos **criativos já existentes**: `GET /act_X/adcreatives?fields=object_story_spec{instagram_user_id,page_id}`. O perfil usado nos anúncios recentes é o Instagram ativo.

**Armadilha do shell:** as chaves `{}` do `fields` sofrem expansão e viram lixo ("Tried accessing nonexisting field"). Use **`curl -G --data-urlencode "fields=..."`**, nunca inline na URL.

### 2. Preparar o criativo
- **Imagem:** `POST /act_X/adimages -F "filename=@arquivo.png"`. Guarde o `hash`.
- **Vídeo (arquivo ou link):** `POST /act_X/advideos` com `file_url` (a Meta baixa do link) ou `-F filename=@`. Depois consulte `GET /{video_id}?fields=status` até ficar `ready` e pegue a miniatura em `GET /{video_id}/thumbnails` (a `is_preferred`).
- **Reel orgânico do Instagram:** se o token **não tem `instagram_basic`**, a API não resolve o reel. Pegue o arquivo do vídeo (o original que você postou) e suba como vídeo novo, por arquivo ou link. Ele vira um anúncio de vídeo novo e perde as curtidas orgânicas, mas roda sem problema.

### 3. Criar a CAMPANHA (PAUSADA)
`POST /act_X/campaigns` com `objective`, `status=PAUSED`, `special_ad_categories=[]`, `buying_type=AUCTION` e **`is_adset_budget_sharing_enabled=false`** (obrigatório quando não usa orçamento de campanha).

**Escolha do objetivo (decisiva):**

| Meta do anúncio | objective | optimization_goal | destino |
|---|---|---|---|
| **Visualização de vídeo** (topo, alimentar remarketing) | `OUTCOME_AWARENESS` | `THRUPLAY` | |
| **Conversa no WhatsApp** | `OUTCOME_ENGAGEMENT` | `CONVERSATIONS` | `WHATSAPP` |
| Mensagem no Messenger ou Direct | `OUTCOME_ENGAGEMENT` | `CONVERSATIONS` | `MESSENGER` ou `INSTAGRAM_DIRECT` |
| Cliques no site | `OUTCOME_TRAFFIC` | `LINK_CLICKS` | |
| Vendas (pixel e Conversions API) | `OUTCOME_SALES` | `OFFSITE_CONVERSIONS` | |

`OUTCOME_ENGAGEMENT` com a página **não aceita `THRUPLAY`**. Vídeo e visualização é sempre `OUTCOME_AWARENESS`. O **objetivo é imutável**: errou, crie outra campanha.

Cuidado com o objetivo de "conversa": ele otimiza **volume de conversa**, não intenção de compra. Para público frio e aberto, use filtro (criativo que afasta curioso e triagem na chegada). Veja `pre-voo-de-trafego`.

### 4. Criar o CONJUNTO (PAUSADO)
`POST /act_X/adsets` com `campaign_id`, `daily_budget` em **centavos** (R$ 6 é `600`), `billing_event=IMPRESSIONS`, `optimization_goal`, `bid_strategy=LOWEST_COST_WITHOUT_CAP`, `status=PAUSED` e `targeting` (veja a seção de público). A API cobra:
- **`targeting.targeting_automation.advantage_audience`** igual a `0` (público fixo) ou `1` (Advantage). Sem isso: "sinalização de público Advantage é obrigatória".
- **`promoted_object`** quando o objetivo pede (conversa, mensagem, conversão), por exemplo `{"page_id":"..."}`. **É imutável**: para mudar, **recrie o conjunto**.
- Conversa no WhatsApp: `destination_type=WHATSAPP` e `promoted_object={"page_id":...}`. O número vem da página e da conta do WhatsApp conectadas.

### 5. Criar o CRIATIVO
`POST /act_X/adcreatives` com `name` e `object_story_spec`. Passe por `--data-urlencode "object_story_spec@arquivo.json"`, montado em Python para escapar emoji e acento. No Windows, **não use `print` de emoji** (a codificação do console quebra): escreva em arquivo UTF-8.
- **Vídeo:** `object_story_spec.video_data` = `{video_id, image_url (miniatura), message, call_to_action}`.
- **Imagem, link ou conversa no WhatsApp:** `object_story_spec.link_data` = `{message, image_hash, link, call_to_action}`.
- **O botão de ação é obrigatório:** criativo de vídeo ou imagem **exige `call_to_action` com link**, senão dá erro "website URL required". Para WhatsApp: `{"type":"WHATSAPP_MESSAGE","value":{"app_destination":"WHATSAPP"}}` e `link=https://api.whatsapp.com/send?phone=<DDI+DDD+numero>&text=<mensagem pronta, codificada>`.

### 6. Criar o ANÚNCIO (PAUSADO)
`POST /act_X/ads` com `adset_id`, `creative={"creative_id":"<id>"}` e `status=PAUSED`. Para trocar o criativo depois: `POST /{ad_id}` com `creative={"creative_id":"<novo>"}`.

### 7. Prévia, OK e ativar
- **Prévia:** `GET /{ad_id}/previews?ad_format=MOBILE_FEED_STANDARD` (ou `INSTAGRAM_STANDARD`, `INSTAGRAM_STORY`). Pegue o `src` do iframe e mostre o link.
- **Ativar (só depois do seu OK):** `status=ACTIVE` **nos 3 níveis** (campanha, conjunto e anúncio), cada um separado. `effective_status=IN_PROCESS` no anúncio é a revisão da Meta, normal. Ele entrega quando for aprovado.
- Grave os IDs em `anuncios/historico.md` (data, campanha, conjunto, anúncio, verba, objetivo).
- Depois de ativar, clique no próprio anúncio (ou abra a prévia) e confira que o destino abre certo.

---

## Público por local: pin em cima do ponto (loja, clínica, escritório)

Para concentrar verba pequena e subir a frequência, mire um **pin** com raio pequeno, em vez da cidade toda:
- **Geocodifique** o endereço pelo Nominatim (OpenStreetMap). O cabeçalho `User-Agent` é obrigatório: `curl -H "User-Agent: meu-trafego/1.0" ...`. Se o número da rua não resolver, use rua e bairro com um raio que cubra com folga.
- `targeting.geo_locations.custom_locations=[{latitude, longitude, radius, distance_unit:"kilometer"}]` (raio mínimo de 1 km). Cidade inteira: `cities:[{key, radius, distance_unit}]` (ache a `key` em `GET /search?type=adgeolocation&q=...`).
- **Escada de expansão:** comece pequeno (4 km) e abra (6, 8, 10, cidade) quando a **frequência passar de cerca de 2,5**.

## Posicionamentos

- **Automático (recomendado):** não mande `publisher_platforms`. A Meta usa todos os posicionamentos elegíveis.
- **Imagem universal:** o **quadrado 1:1** cabe em tudo (cheio no feed, centralizado nos stories). O vertical 9:16 é cortado no feed.
- **Personalização por posicionamento** (`asset_feed_spec` com `asset_customization_rules`: feed quadrado, stories vertical) **não combina com público por pin** (`custom_locations`). Dá o erro 2446501 "All non-default target rules must contain geolocation customization". Com pin, use **1 criativo universal**. Se precisar dos 2 formatos com pin, faça 2 conjuntos (divide verba e aprendizado).
- Se usar `asset_feed_spec`, a **regra padrão** precisa de `customization_spec` vazio (`{}`) e as outras cobrem o posicionamento.

---

## Pré-requisitos de conta (batem sem aviso)

1. **App em Modo Público (Ao vivo), não em Desenvolvimento.** App em desenvolvimento **bloqueia criar criativo** ("o post do criativo foi criado por um app em modo de desenvolvimento"). Para publicar: `developers.facebook.com/apps/<id>/settings/basic`, preencha a **URL da política de privacidade** (obrigatória) e a **categoria**, salve e use o interruptor de publicação. Detalhes em `meta-app-e-acessos`. Esse passo é no painel, com o seu login.
2. **Anúncio para WhatsApp:** conta do WhatsApp e número conectados. Cheque o número em `GET /{waba_id}/phone_numbers` (queremos `quality_rating: GREEN` e `platform_type: CLOUD_API`). Teste a conexão criando o conjunto com `destination_type=WHATSAPP`: se validar, está ok.
3. **Saúde e outros nichos regulados:** o criativo respeita a norma do nicho. Confira a imagem **antes** de subir.
4. **Pagamento:** conta de anúncio com forma de pagamento ativa e sem pendência (`account_status` igual a 1).

---

## Públicos e semelhantes: o que funciona pela API e o que trava

- **Público de engajamento ou de vídeo pela API = TRAVA.** O formato novo de regra dá o **erro 2654** ("nome do evento inválido") para página e Instagram. Vídeo exige um formato antigo não documentado (**erro 1885183**). **Crie na tela** do Gerenciador de Anúncios (Vídeo ou Conta do Instagram), leva 1 minuto. Eles só precisam existir para **acumular gente** (leva de 2 a 3 semanas com verba pequena).
- **O que FUNCIONA pela API:** **público de lista de clientes** (cria e sobe telefones ou e-mails com hash SHA-256) e o **semelhante** a partir dele (`subtype=LOOKALIKE`, `origin_audience_id`, `lookalike_spec={ratio, country, type}`). A base real de clientes é uma semente melhor que quem viu um vídeo.
  - **Requisito de 1 vez:** a conta precisa ter **aceito os Termos do Público Personalizado**, senão dá o **erro 1870090**. Aceite em `business.facebook.com/ads/manage/customaudiences/tos/?act=<ID>` (no painel, com o seu login).
  - **Telefone para a Meta:** normalize em E.164 (só dígitos, com o 55, sem `+`), hash SHA-256 em hexadecimal minúsculo, e suba por `POST /{audience_id}/users` com `payload={"schema":"PHONE","data":[["<sha256>"],...]}`.
- O semelhante precisa de semente com **100 pessoas ou mais** (ideal de 1.000 a 5.000, do mesmo país).

---

## Matriz de armadilhas (erro, causa, solução)

| Erro ou sintoma | Causa | Solução |
|---|---|---|
| "Tried accessing nonexisting field (...id...)" | o shell comeu as `{}` do `fields` | `curl -G --data-urlencode "fields=..."` |
| "is_adset_budget_sharing_enabled é necessário" | campanha sem orçamento de campanha | mande `is_adset_budget_sharing_enabled=false` |
| "sinalização de público Advantage é obrigatória" | conjunto sem a flag | `targeting.targeting_automation.advantage_audience=0` |
| "A meta de desempenho não está disponível" | THRUPLAY em OUTCOME_ENGAGEMENT | vídeo e visualização usam `OUTCOME_AWARENESS` |
| "É necessário conjunto com objeto promovido" | o objetivo pede `promoted_object` | `promoted_object={"page_id":...}` no conjunto |
| "objeto promovido é imutável" | tentou editar `promoted_object` | **recriar** o conjunto |
| "website URL é obrigatório" | criativo sem botão ou link | `call_to_action` com `link` |
| "post do criativo... app em modo de desenvolvimento" | app em desenvolvimento | publicar o app (política, categoria, modo público) |
| erro 2654 "nome do evento inválido" | público de engajamento pela API | criar na **tela** |
| erro 1870090 "Termos do público personalizado não aceitos" | a conta nunca aceitou os termos | aceitar 1 vez no link dos termos |
| erro 2446501 "non-default target rules must contain geolocation" | personalização por posicionamento com pin | 1 criativo universal (quadrado) |
| `UnicodeEncodeError` (Windows) | `print` de emoji no console | escrever em arquivo UTF-8, não imprimir |
| conta com pagamento pendente (`account_status` 3) | cobrança | resolver no Gerenciador de Anúncios, não é problema de token |

---

## Fluxo de decisão rápido

```
Tem criativo?
 ├─ imagem → adimages (hash)
 ├─ vídeo (arquivo) → advideos file_url → esperar ready → miniatura
 └─ reel do Instagram + token sem instagram_basic → pegar o arquivo original → advideos
Objetivo?
 ├─ visualização de vídeo → AWARENESS + THRUPLAY (sem promoted_object)
 ├─ conversa no WhatsApp → ENGAGEMENT + CONVERSATIONS + destino WHATSAPP + promoted_object da página
 └─ site → TRAFFIC + LINK_CLICKS (ou SALES com pixel)
Sempre: PAUSED → prévia → seu OK → ACTIVE nos 3 níveis → gravar IDs → conferir o destino.
```

## Quando NÃO usar e skills vizinhas

- **Estratégia** (o que subir em cada estágio, oferta, público): `pre-voo-de-trafego` e `doutrina-trafego`.
- **Ângulo, título e texto:** `niveis-de-consciencia` e `whatsapp-sales-process`.
- **Conhecimento da plataforma** (objetivos, níveis de acesso, App Review): `meta-ads-expert`.
- **Dar nota a um criativo antes de subir:** `analisador-criativos`.
- **Rastreio de conversão** (pixel, Conversions API): `meta-ads-expert`, `references/audiences-pixel-catalogo.md`.
- **Token, app e permissões:** `meta-app-e-acessos`.
- **Abrir tela do painel:** `navegador-osimplify`.

**Fluxo completo do zero:** `pre-voo-de-trafego` (terreno e prontidão), depois `niveis-de-consciencia` e `whatsapp-sales-process` (texto), depois `analisador-criativos` (nota da peça), depois **esta skill** (sobe), depois `meta-ads-expert` (rastreio e leitura), depois `doutrina-trafego` (escalar ou cortar).
