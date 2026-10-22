# Públicos, pixel e catálogo

## Públicos personalizados (Custom Audiences)

```bash
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/customaudiences" \
  --data-urlencode "name=Compradores 90 dias" \
  --data-urlencode "subtype=CUSTOM" \
  --data-urlencode "customer_file_source=USER_PROVIDED_ONLY" \
  --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

- **Lista de clientes:** a base entra por contato (e-mail ou telefone), com **hash SHA-256**, texto normalizado (minúsculas, sem espaços). Telefone: só dígitos, com o código do país (55), sem o `+`.
- Subir os contatos: `POST /{audience_id}/users` com `payload={"schema":"PHONE","data":[["<sha256>"],...]}`.
- Tipos: lista de clientes, visitantes do site (via pixel), engajamento, app.
- Pela primeira vez na conta, aceite os **Termos do Público Personalizado** (a API devolve o erro 1870090 se faltar). O link é `business.facebook.com/ads/manage/customaudiences/tos/?act=<ID>`.
- Público de **engajamento ou de vídeo** costuma dar erro pela API (2654, 1885183). Crie no Gerenciador de Anúncios, leva 1 minuto.

## Público semelhante (lookalike)

Crie a partir de um público-semente:

```bash
curl -s -X POST "https://graph.facebook.com/$GV/$ACT/customaudiences" \
  --data-urlencode "name=Semelhante 1% BR | Compradores" \
  --data-urlencode "subtype=LOOKALIKE" \
  --data-urlencode "origin_audience_id=<SEMENTE_ID>" \
  --data-urlencode 'lookalike_spec={"type":"similarity","country":"BR","ratio":0.01}' \
  --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

`ratio` vai de 0.01 a 0.10 (1% a 10%). Menor é mais parecido. A semente precisa ter **pelo menos 100 pessoas** do mesmo país (ideal de 1.000 a 5.000). A base real de clientes é uma semente melhor que quem só viu um vídeo.

---

## Pixel (dataset) e Conversions API

- **Pixel:** registra os eventos do site no navegador.
- **Conversions API (CAPI):** manda os eventos **do servidor**, sem depender do navegador (que bloqueia cookies). É essencial para `OUTCOME_SALES` confiável.

```bash
curl -s -X POST "https://graph.facebook.com/$GV/$META_PIXEL_ID/events" \
  --data-urlencode "access_token=$META_CAPI_TOKEN" \
  --data-urlencode 'data=[{"event_name":"Purchase","event_time":1717000000,"action_source":"website","event_id":"pedido-123","user_data":{"em":["<sha256_email>"],"ph":["<sha256_telefone>"]},"custom_data":{"currency":"BRL","value":199.90}}]'
```

- Variável `META_CAPI_TOKEN` (segredo): vem do Gerenciador de Eventos, em Configurações do dataset. Também funciona com o token do usuário do sistema.
- **`event_id` igual** no pixel e na CAPI evita contar duas vezes (deduplicação).
- Venda: ligue o pixel no conjunto com `promoted_object: {"pixel_id": "...", "custom_event_type": "PURCHASE"}`.
- Antes de culpar a campanha, confira o rastreio: o pixel dispara? O evento certo chega? O `event_id` repete? Use "Testar eventos" no Gerenciador de Eventos.
- Clique no anúncio traz o `fbclid`. Guarde-o junto com o `utm_*` no primeiro contato (formulário ou WhatsApp) para ligar a venda à origem depois. O dado que não foi guardado hoje não volta amanhã.

---

## Catálogo e anúncios dinâmicos (Advantage+ catálogo)

- **Catálogo:** base de produtos para anúncios dinâmicos.
- **Anúncio dinâmico (DPA):** mostra os produtos do catálogo a quem demonstrou interesse. Precisa de catálogo e de pixel ou CAPI com `ViewContent`, `AddToCart` e `Purchase`. Liga o `product_set_id` no conjunto.
- Quando não entrega, olhe primeiro o diagnóstico do catálogo. Erro de feed (imagem, preço, disponibilidade) derruba produto sem avisar.

## Inteligência de concorrência

Biblioteca de Anúncios (`facebook.com/ads/library`): veja os criativos e as ofertas que os concorrentes têm no ar. Há quanto tempo um anúncio roda é pista de que ele funciona. Ela mostra os anúncios, **não** o resultado deles.
