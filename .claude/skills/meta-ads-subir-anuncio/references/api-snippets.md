# Meta Ads: comandos de API prontos (curl)

Validados em campanha real. Substitua o que está entre `< >`. Rode no Git Bash (no Windows).

Todos assumem `GV`, `ACT` e `META_ACCESS_TOKEN` carregados do `.env` na raiz. **Nunca imprima o token.**

## 0. Carregar as credenciais

```bash
# o tr tira o fim de linha do Windows, que quebra o curl
set -a; source <(tr -d '\r' < .env); set +a
GV="${META_API_VERSION:-v26.0}"
ACT="act_${META_AD_ACCOUNT_ID#act_}"
TOKEN="$META_ACCESS_TOKEN"
```

## 1. Validar o token e descobrir a conta

```bash
# identidade
curl -s "https://graph.facebook.com/$GV/me?fields=id,name&access_token=$TOKEN"
# contas de anúncio (act_id)
curl -s "https://graph.facebook.com/$GV/me/adaccounts?fields=id,account_id,name,account_status,currency,amount_spent&access_token=$TOKEN"
# permissões do token (precisa de ads_management e pages_manage_ads)
curl -s "https://graph.facebook.com/$GV/debug_token?input_token=$TOKEN&access_token=$META_APP_ID|$META_APP_SECRET"
# páginas e Instagram (SEMPRE com -G --data-urlencode por causa das chaves {})
curl -s -G "https://graph.facebook.com/$GV/me/accounts" \
  --data-urlencode "fields=id,name,instagram_business_account{id,username}" \
  --data-urlencode "access_token=$TOKEN"
# Instagram usado nos criativos existentes (quando ele não aparece na página)
curl -s -G "https://graph.facebook.com/$GV/$ACT/adcreatives" \
  --data-urlencode "fields=id,name,object_story_spec{page_id,instagram_user_id}" \
  --data-urlencode "limit=10" --data-urlencode "access_token=$TOKEN"
# conta do WhatsApp e número (para anúncio que leva ao WhatsApp). O business_id vem de GET /$ACT?fields=business
curl -s -G "https://graph.facebook.com/$GV/<BUSINESS_ID>/owned_whatsapp_business_accounts" --data-urlencode "fields=id,name" --data-urlencode "access_token=$TOKEN"
curl -s -G "https://graph.facebook.com/$GV/<WABA_ID>/phone_numbers" --data-urlencode "fields=id,display_phone_number,verified_name,quality_rating,platform_type" --data-urlencode "access_token=$TOKEN"
```

## 2. Criativo: subir a mídia

```bash
# IMAGEM, devolve o hash
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/adimages" -F "filename=@/caminho/img.png" -F "access_token=$TOKEN"

# VÍDEO por link (a Meta baixa), devolve o video_id
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/advideos" \
  --data-urlencode "file_url@/caminho/url.txt" \
  --data-urlencode "name=[TOPO] video" --data-urlencode "access_token=$TOKEN"
# esperar o status ficar ready
curl -s -G "https://graph.facebook.com/$GV/<VIDEO_ID>" --data-urlencode "fields=status,length,published" --data-urlencode "access_token=$TOKEN"
# miniatura preferida
curl -s -G "https://graph.facebook.com/$GV/<VIDEO_ID>/thumbnails" --data-urlencode "access_token=$TOKEN"
```

**Reel do Instagram** quando o token não tem `instagram_basic`: pegue o arquivo original do vídeo (o que você postou), hospede num link que a Meta consiga baixar ou suba por arquivo com `-F "source=@video.mp4"`, e siga o fluxo acima.

## 3. Campanha (PAUSADA)

```bash
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/campaigns" \
  --data-urlencode "name=[TOPO][VIDEO] Exemplo" \
  --data-urlencode "objective=OUTCOME_AWARENESS" \
  --data-urlencode "status=PAUSED" \
  --data-urlencode "special_ad_categories=[]" \
  --data-urlencode "buying_type=AUCTION" \
  --data-urlencode "is_adset_budget_sharing_enabled=false" \
  --data-urlencode "access_token=$TOKEN"
```

## 4. Conjunto (PAUSADO)

Latitude e longitude abaixo são de exemplo. Troque pelas do seu endereço (veja o geocode no item 8).

```bash
# VÍDEO / visualização (sem promoted_object)
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/adsets" \
  --data-urlencode "name=[CJ] Pin 4km | 30+ | ThruPlay" \
  --data-urlencode "campaign_id=<CAMPANHA_ID>" \
  --data-urlencode "daily_budget=600" \
  --data-urlencode "billing_event=IMPRESSIONS" \
  --data-urlencode "optimization_goal=THRUPLAY" \
  --data-urlencode "bid_strategy=LOWEST_COST_WITHOUT_CAP" \
  --data-urlencode 'targeting={"geo_locations":{"custom_locations":[{"latitude":-23.5505,"longitude":-46.6333,"radius":4,"distance_unit":"kilometer"}]},"age_min":30,"targeting_automation":{"advantage_audience":0}}' \
  --data-urlencode "status=PAUSED" --data-urlencode "access_token=$TOKEN"

# CONVERSA NO WHATSAPP (destino WHATSAPP e promoted_object da página)
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/adsets" \
  --data-urlencode "name=[CJ] Pin 4km | 30+ | Conversas WhatsApp" \
  --data-urlencode "campaign_id=<CAMPANHA_ENGAGEMENT_ID>" \
  --data-urlencode "daily_budget=1200" \
  --data-urlencode "billing_event=IMPRESSIONS" \
  --data-urlencode "optimization_goal=CONVERSATIONS" \
  --data-urlencode "destination_type=WHATSAPP" \
  --data-urlencode 'promoted_object={"page_id":"<PAGE_ID>"}' \
  --data-urlencode "bid_strategy=LOWEST_COST_WITHOUT_CAP" \
  --data-urlencode 'targeting={"geo_locations":{"custom_locations":[{"latitude":-23.5505,"longitude":-46.6333,"radius":4,"distance_unit":"kilometer"}]},"age_min":30,"targeting_automation":{"advantage_audience":0}}' \
  --data-urlencode "status=PAUSED" --data-urlencode "access_token=$TOKEN"
```

## 5. Criativo (monte o `object_story_spec` em Python, para escapar acento e emoji)

```bash
# VÍDEO
python -c "
import json
spec={'page_id':'<PAGE>','instagram_user_id':'<IG>','video_data':{'video_id':'<VID>','image_url':'<THUMB_URI>','message':open('legenda.txt',encoding='utf-8').read(),'call_to_action':{'type':'LEARN_MORE','value':{'link':'https://instagram.com/<usuario>/'}}}}
open('spec.json','w',encoding='utf-8').write(json.dumps(spec,ensure_ascii=False))"

# IMAGEM / CONVERSA NO WHATSAPP
python -c "
import json,urllib.parse
prefill='Olá! Vim pelo anúncio e quero saber mais.'
link='https://api.whatsapp.com/send?phone=<DDI+DDD+NUMERO>&text='+urllib.parse.quote(prefill)
spec={'page_id':'<PAGE>','link_data':{'message':open('legenda.txt',encoding='utf-8').read(),'image_hash':'<HASH>','link':link,'call_to_action':{'type':'WHATSAPP_MESSAGE','value':{'app_destination':'WHATSAPP'}}}}
open('spec.json','w',encoding='utf-8').write(json.dumps(spec,ensure_ascii=False))"

curl -s -X POST "https://graph.facebook.com/$GV/$ACT/adcreatives" \
  --data-urlencode "name=[CRIATIVO] Exemplo" \
  --data-urlencode "object_story_spec@spec.json" \
  --data-urlencode "access_token=$TOKEN"
```

Dica: a mensagem pronta do WhatsApp pode levar a origem ("Vim pelo anúncio") para você saber de onde veio cada conversa.

## 6. Anúncio (PAUSADO) e trocar o criativo

```bash
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/ads" \
  --data-urlencode "name=[ANUNCIO] Exemplo" \
  --data-urlencode "adset_id=<CONJUNTO_ID>" \
  --data-urlencode 'creative={"creative_id":"<CRIATIVO_ID>"}' \
  --data-urlencode "status=PAUSED" --data-urlencode "access_token=$TOKEN"
# trocar o criativo depois
curl -s -X POST "https://graph.facebook.com/$GV/<AD_ID>" --data-urlencode 'creative={"creative_id":"<NOVO>"}' --data-urlencode "access_token=$TOKEN"
```

## 7. Prévia, ativar e mudar verba

```bash
# prévia (pegue o src do iframe)
curl -s -G "https://graph.facebook.com/$GV/<AD_ID>/previews" --data-urlencode "ad_format=MOBILE_FEED_STANDARD" --data-urlencode "access_token=$TOKEN"

# ATIVAR (só depois do OK do dono), nos 3 níveis
for X in <CAMPANHA_ID> <CONJUNTO_ID> <AD_ID>; do
  curl -s -X POST "https://graph.facebook.com/$GV/$X" --data-urlencode "status=ACTIVE" --data-urlencode "access_token=$TOKEN"; echo; done

# mudar verba (em centavos). Conjunto: /<CONJUNTO_ID>. Campanha com orçamento de campanha: /<CAMPANHA_ID>
curl -s -X POST "https://graph.facebook.com/$GV/<CONJUNTO_ID>" --data-urlencode "daily_budget=1200" --data-urlencode "access_token=$TOKEN"
```

## 8. Geocode (pin da loja, clínica ou escritório)

```bash
curl -s -H "User-Agent: meu-trafego/1.0" -G "https://nominatim.openstreetmap.org/search" \
  --data-urlencode "q=Rua Exemplo, Bairro, Cidade, Estado, Brazil" \
  --data-urlencode "format=json" --data-urlencode "limit=3"
# cidade inteira: pegue a key
curl -s -G "https://graph.facebook.com/$GV/search" --data-urlencode "type=adgeolocation" --data-urlencode "q=<NOME DA CIDADE>" --data-urlencode 'location_types=["city"]' --data-urlencode "access_token=$TOKEN"
```

## 9. Público de lista e semelhante (isto FUNCIONA pela API)

```bash
# cria o público de lista (customer file)
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/customaudiences" \
  --data-urlencode "name=[BASE] Clientes" \
  --data-urlencode "subtype=CUSTOM" \
  --data-urlencode "customer_file_source=USER_PROVIDED_ONLY" \
  --data-urlencode "description=Telefones de clientes (com hash)" \
  --data-urlencode "access_token=$TOKEN"
# adiciona pessoas: POST /<AUDIENCE_ID>/users  payload={"schema":"PHONE","data":[["<sha256>"],...]}
# semelhante a partir dele
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/customaudiences" \
  --data-urlencode "name=[SEMELHANTE 1%] Clientes BR" \
  --data-urlencode "subtype=LOOKALIKE" \
  --data-urlencode "origin_audience_id=<SEMENTE_ID>" \
  --data-urlencode 'lookalike_spec={"type":"similarity","country":"BR","ratio":0.01}' \
  --data-urlencode "access_token=$TOKEN"
```

Público de engajamento ou de vídeo **não**: dá erro 2654 ou 1885183 pela API. Crie na **tela** do Gerenciador de Anúncios.
