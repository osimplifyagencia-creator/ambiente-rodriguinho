# Criar campanha (campanha, conjunto, criativo, anúncio)

Crie sempre nesta ordem. Cada passo devolve um `id` que é o pai do próximo. **Crie tudo em `PAUSED`** e só ative depois de revisar, com o seu OK.

Lembre: dinheiro em **CENTAVOS**, e `special_ad_categories` **obrigatório, mesmo vazio**.

O passo a passo completo, com os erros já conhecidos e os comandos prontos, está na skill **`meta-ads-subir-anuncio`**. Este arquivo é o mapa dos campos.

## 1. Campanha: `POST /act_{id}/campaigns`

```json
{
  "name": "Tráfego | Maio",
  "objective": "OUTCOME_TRAFFIC",
  "status": "PAUSED",
  "special_ad_categories": [],
  "daily_budget": 5000
}
```

Campos: `name`, `objective` (obrigatório), `status` (use PAUSED), `special_ad_categories` (obrigatório). Opcionais: `daily_budget` ou `lifetime_budget` (no nível da campanha vira **orçamento da campanha**, o CBO), `bid_strategy`, `spend_cap`, `buying_type`.

### Objetivos (ODAX)

| Objetivo | Para |
|---|---|
| `OUTCOME_AWARENESS` | alcance, reconhecimento, visualização de vídeo |
| `OUTCOME_TRAFFIC` | cliques, visitas ao site |
| `OUTCOME_ENGAGEMENT` | engajamento, mensagens, vídeo |
| `OUTCOME_LEADS` | leads (formulário, mensagens, ligações) |
| `OUTCOME_SALES` | vendas (precisa de pixel e Conversions API) |
| `OUTCOME_APP_PROMOTION` | instalação de app |

Os objetivos antigos (`LINK_CLICKS`, `CONVERSIONS`) aparecem em código velho. Use os de cima.

## 2. Conjunto: `POST /act_{id}/adsets`

```json
{
  "name": "Conjunto | BR 25-45",
  "campaign_id": "<CAMPANHA_ID>",
  "status": "PAUSED",
  "daily_budget": 3000,
  "billing_event": "IMPRESSIONS",
  "optimization_goal": "LINK_CLICKS",
  "bid_strategy": "LOWEST_COST_WITHOUT_CAP",
  "targeting": {
    "geo_locations": { "countries": ["BR"] },
    "age_min": 25,
    "age_max": 45,
    "targeting_automation": { "advantage_audience": 0 }
  },
  "start_time": "2026-06-01T00:00:00-0300"
}
```

- `optimization_goal` precisa **casar** com o objetivo. Exemplos: `OUTCOME_TRAFFIC` com `LINK_CLICKS` ou `LANDING_PAGE_VIEWS`; `OUTCOME_SALES` com `OFFSITE_CONVERSIONS`. Combinação errada dá erro.
- `billing_event` costuma ser `IMPRESSIONS`.
- Se a campanha tem orçamento de campanha (CBO), **não** mande verba no conjunto.
- `lifetime_budget` exige `start_time` e `end_time`.
- Para venda ou lead no site, aponte `promoted_object` (pixel e evento) no conjunto.
- Posicionamentos: sem `publisher_platforms`, a Meta usa todos os elegíveis (recomendado).

## 3. Criativo: `POST /act_{id}/adcreatives`

```json
{
  "name": "Criativo | Imagem 1",
  "object_story_spec": {
    "page_id": "<PAGE_ID>",
    "link_data": {
      "message": "Texto do anúncio",
      "link": "https://seusite.com.br/?utm_source=facebook&utm_medium=paid",
      "image_hash": "<IMAGE_HASH>",
      "call_to_action": { "type": "LEARN_MORE", "value": { "link": "https://seusite.com.br" } }
    }
  }
}
```

Imagem: suba antes em `POST /act_{id}/adimages` e guarde o `hash`. Vídeo: `POST /act_{id}/advideos`.

## 4. Anúncio: `POST /act_{id}/ads`

```json
{
  "name": "Anúncio | Imagem 1 v1",
  "adset_id": "<CONJUNTO_ID>",
  "creative": { "creative_id": "<CRIATIVO_ID>" },
  "status": "PAUSED"
}
```

## Erros comuns

- Faltou `special_ad_categories`: pedido rejeitado. Mande `[]`.
- Verba "errada por 100 vezes": você esqueceu que é em centavos.
- `optimization_goal` incompatível com o `objective`.
- Venda sem `promoted_object` ou pixel: não otimiza.
- Anúncio não entrega: o app está só em Desenvolvimento, a conta tem pagamento pendente ou o anúncio está em revisão.
- Para ver o motivo: `GET /{ad_id}?fields=effective_status,issues_info`.
