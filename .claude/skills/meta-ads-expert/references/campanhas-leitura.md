# Puxar campanhas e resultados

Todos os exemplos assumem `GV`, `ACT` e `META_ACCESS_TOKEN` carregados do `.env` (veja o `SKILL.md`).

## Listar entidades

```bash
# campanhas
curl -s -G "https://graph.facebook.com/$GV/$ACT/campaigns" \
  --data-urlencode "fields=id,name,objective,status,effective_status,daily_budget,lifetime_budget,created_time" \
  --data-urlencode "limit=100" --data-urlencode "access_token=$META_ACCESS_TOKEN"

# conjuntos de uma campanha
curl -s -G "https://graph.facebook.com/$GV/<CAMPANHA_ID>/adsets" \
  --data-urlencode "fields=id,name,status,daily_budget,optimization_goal,billing_event,targeting" \
  --data-urlencode "access_token=$META_ACCESS_TOKEN"

# anúncios de um conjunto
curl -s -G "https://graph.facebook.com/$GV/<CONJUNTO_ID>/ads" \
  --data-urlencode "fields=id,name,status,creative{id,name}" \
  --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

Filtro por status: `--data-urlencode 'effective_status=["ACTIVE"]'` (ou `["PAUSED"]`).

## Paginação

A resposta vem com `data` e `paging.cursors.after` e `paging.next`. Siga `paging.next` até acabar. O `limit` máximo costuma ser de 100 a 500, conforme o nó.

---

## Resultados (insights)

```bash
curl -s -G "https://graph.facebook.com/$GV/$ACT/insights" \
  --data-urlencode "level=campaign" \
  --data-urlencode "fields=campaign_name,spend,impressions,clicks,ctr,cpc,cpm,reach,frequency,actions,action_values,purchase_roas" \
  --data-urlencode "date_preset=last_7d" \
  --data-urlencode "limit=100" --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

- `level`: `campaign`, `adset` ou `ad`.
- Período: `date_preset=last_7d` ou `time_range={"since":"2026-05-01","until":"2026-05-29"}`.
- Quebras opcionais: `breakdowns=age,gender`, `publisher_platform`, `platform_position`, `device_platform`, `country`, `region`.

### Campos mais úteis

| Campo | O que é |
|---|---|
| `spend` | gasto (na moeda da conta) |
| `impressions` e `reach` | vezes que apareceu e pessoas únicas |
| `clicks`, `ctr`, `cpc` | cliques, taxa de clique e custo por clique |
| `cpm` | custo por mil impressões |
| `frequency` | vezes que cada pessoa viu (sinal de cansaço quando sobe) |
| `actions` e `action_values` | conversões por tipo e valor |
| `purchase_roas` | retorno sobre o investimento em compras |
| `cost_per_action_type` | custo por ação, por tipo |

**Cuidado:** `reach` e `frequency` são **deduplicados**. Nunca some o alcance de dias ou de campanhas diferentes. Os campos que podem ser somados são `spend`, `impressions`, `clicks` e as conversões.

### Períodos prontos (`date_preset`)

`today`, `yesterday`, `last_7d`, `last_14d`, `last_30d`, `this_month`, `last_month`, `maximum`.

### Quebras úteis para quem gere o próprio tráfego

`publisher_platform` (Facebook, Instagram, Audience Network), `platform_position` (feed, stories, reels), `device_platform`, `age`, `gender`, `region`. Um anúncio pode vencer no feed e morrer nos stories.

---

## Outras leituras úteis

| O que | Como |
|---|---|
| contas disponíveis | `GET /me/adaccounts?fields=id,account_id,name,account_status,currency,amount_spent` |
| prévia de um anúncio | `GET /{ad_id}/previews?ad_format=MOBILE_FEED_STANDARD` |
| erros que travam a entrega | `GET /{ad_id}?fields=effective_status,issues_info,ad_review_feedback` |
| anúncios públicos de concorrentes | Biblioteca de Anúncios (`facebook.com/ads/library`) ou `ads_archive` |

Se o servidor MCP oficial de anúncios estiver conectado, as ferramentas `ads_get_ad_entities`, `ads_insights_*` e `ads_get_opportunity_score` fazem o mesmo com paginação pronta. Opcional.

## Regra de ouro para rotina

Para evitar limite de chamadas, **grave os resultados num arquivo** (por exemplo `anuncios/dados/insights-AAAA-MM-DD.json`) em vez de bater na API a cada pergunta. Leia o arquivo para analisar e atualize 1 vez por dia.
