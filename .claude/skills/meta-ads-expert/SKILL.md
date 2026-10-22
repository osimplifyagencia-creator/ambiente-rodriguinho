---
name: meta-ads-expert
description: "Marketing API e Graph API do Meta: ler campanhas, públicos, pixel e resultados, e montar uma rotina de gestão de tráfego com travas. Use quando: \"como estão meus anúncios\", \"puxa os números do Meta\". Não é: subir anúncio (meta-ads-subir-anuncio) nem pegar acesso (meta-app-e-acessos)."
---

# Meta Ads Expert

Guia prático da Marketing API e da Graph API do Meta (Facebook e Instagram) para o Claude Code: ler contas, campanhas e resultados, mexer em públicos e pixel, e montar uma rotina de gestão de tráfego com travas de segurança.

Fonte: `developers.facebook.com` (Marketing API e Graph API). O canal de execução é a API direta por `curl`. Se o servidor MCP oficial de anúncios do Meta estiver conectado (ferramentas `ads_*`), ele serve como atalho, mas nada aqui depende dele.

## Credenciais (arquivo `.env` na raiz)

Variáveis que esta skill usa. **Nunca escreva o valor no chat nem em arquivo que vai para o git.**

| Variável | O que é |
|---|---|
| `META_ACCESS_TOKEN` | token do usuário do sistema (segredo) |
| `META_AD_ACCOUNT_ID` | conta de anúncio, com ou sem `act_` |
| `META_PAGE_ID` | página do Facebook |
| `META_PIXEL_ID` | pixel (dataset) |
| `META_APP_ID` e `META_APP_SECRET` | app (o segredo é segredo) |
| `META_API_VERSION` | opcional, ex.: `v26.0` |

Não tem token ou ele não funciona? Use a skill `meta-app-e-acessos`. Ela tem um conferidor que diz o que falta.

Carregar o `.env` no Git Bash (o `tr` tira o fim de linha do Windows, que quebra o `curl`):

```bash
set -a; source <(tr -d '\r' < .env); set +a
GV="${META_API_VERSION:-v26.0}"
ACT="act_${META_AD_ACCOUNT_ID#act_}"
curl -s -G "https://graph.facebook.com/$GV/$ACT/campaigns" \
  --data-urlencode "fields=id,name,objective,status,daily_budget" \
  --data-urlencode "limit=50" --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

Sempre use `curl -G --data-urlencode` quando o `fields` tiver chaves `{}`. Sem isso o shell estraga o pedido.

## Antes de tudo: níveis de acesso do app

A capacidade depende do nível de acesso do app, não só do código.

| Nível | Como obtém | O que permite |
|---|---|---|
| **Desenvolvimento** | automático ao criar o app | testa nas suas contas. **Anúncio NÃO entrega para público real.** |
| **Básico** | automático após criar o app | entrega real, com limite de chamadas |
| **Padrão** | exige **App Review** (a Meta avalia o uso) | acesso pleno, instalar o app em usuário do sistema |

Gestão de tráfego na sua própria conta, com você como administrador do app, normalmente funciona com o acesso que o app já tem. O app precisa estar **publicado** (modo "Ao vivo"). Detalhes em `meta-app-e-acessos`.

Permissões-chave: `ads_management` (criar, editar, ler), `ads_read` (só leitura), `business_management` (itens do Business Manager), `pages_*` (páginas).

## Hierarquia

```
Conta de anúncio (act_{id})
  └─ Campanha     → define o OBJETIVO e as categorias especiais
       └─ Conjunto → público, verba, meta de otimização, agenda
            └─ Anúncio → liga um criativo (o que a pessoa vê)
```

Crie sempre nessa ordem: campanha, conjunto, anúncio. Cada nível devolve um `id` que vira o pai do próximo.

## Regras do HTTP

**Base:** `https://graph.facebook.com/v{XX.0}/{nó}`. A versão faz parte da URL. Fixe uma versão e confira o changelog antes de trocar (`developers.facebook.com/docs/graph-api/changelog`). Versões antigas morrem depois de uns 2 anos.

**Autenticação:** `access_token` no pedido ou `Authorization: Bearer`. Em chamada de servidor, mande também `appsecret_proof` (HMAC-SHA256 do token com o segredo do app).

Dois detalhes que rejeitam o pedido:
1. **Dinheiro é em CENTAVOS da moeda da conta.** `daily_budget: 5000` é R$ 50,00. Errar isso é gastar 100 vezes mais.
2. **`special_ad_categories` é obrigatório na criação de campanha, mesmo vazio** (`[]`). Categorias restritas: `HOUSING`, `EMPLOYMENT`, `CREDIT`, `ISSUES_ELECTIONS_POLITICS`.

## Fluxo canônico

```
1. listar contas        → /me/adaccounts
2. ler campanhas        → /act_X/campaigns, /adsets, /ads
3. ler resultados       → /act_X/insights
4. criar (tudo PAUSED)  → campanha, conjunto, criativo, anúncio  (skill meta-ads-subir-anuncio)
5. conferir a prévia    → /{ad_id}/previews
6. ativar ou ajustar    → ação que gasta dinheiro: só com o seu OK
```

Ação de escrita (criar, editar, ativar, mexer em público) mexe em dinheiro e em produção. Leitura é livre. As travas estão em `references/agente-trafego.md`.

## Índice de references

| Arquivo | Leia quando precisar de... |
|---|---|
| `references/graph-api-fundamentos.md` | Graph API, versão, tipos de token, `appsecret_proof`, limites de chamadas |
| `references/campanhas-leitura.md` | **ler** campanhas, conjuntos, anúncios e resultados (campos, quebras, períodos) |
| `references/campanhas-criacao.md` | **criar** campanha, conjunto e anúncio: objetivos, público, verba, criativo |
| `references/audiences-pixel-catalogo.md` | públicos personalizados, semelhantes, pixel, Conversions API, catálogo |
| `references/agente-trafego.md` | rotina de gestão de tráfego: ciclo de decisão, travas, regras de partida |

Criar o app e gerar o token está na skill `meta-app-e-acessos`.

## Ângulo do criativo: níveis de consciência

A API entrega o anúncio. O que faz o anúncio converter é o **ângulo**, e ele depende de dois eixos de Eugene Schwartz (skill `niveis-de-consciencia`). Antes de escrever o texto do criativo ou definir o público, decida:

| Público | Nível típico | Ângulo do criativo |
|---|---|---|
| **Frio** (interesses amplos, semelhante, Advantage+ aberto) | Inconsciente ou consciente do problema | abra com a **dor** ou uma identificação. Nunca com oferta ou preço |
| **Médio** (engajou, visitou o site) | Consciente da solução ou do produto | **mecanismo** e prova: "por que este e não os outros" |
| **Remarketing** (carrinho, lead, viu preço) | Totalmente consciente | **oferta direta**, escassez real, ação. Texto curto |

Erro clássico: rodar criativo de oferta e preço para público frio (gasta caro e não converte). O inverso também erra: criativo "educativo" no remarketing (lento, a pessoa já está pronta).

Sofisticação do mercado: se a Biblioteca de Anúncios mostra todos os concorrentes prometendo a mesma coisa, o mercado está saturado. Não prometa mais alto. Lidere com mecanismo único ou identidade. A Biblioteca de Anúncios fica em `facebook.com/ads/library` (pelo navegador, skill `navegador-osimplify`) ou pelo endpoint `ads_archive` da Graph API.

Mapa para o funil de mídia: topo é público frio e baixa consciência, meio é solução e produto, fundo e remarketing é totalmente consciente.

## Os 4 usos mais comuns

1. **Puxar campanhas e resultados:** `references/campanhas-leitura.md`.
2. **Criar campanhas:** `references/campanhas-criacao.md` e a skill `meta-ads-subir-anuncio`. Para entregar de verdade, o app não pode estar só em Desenvolvimento.
3. **Criar o app:** o app em si é criado no **painel** (não existe API pública para isso). O que se automatiza é usuário do sistema e token. Veja `meta-app-e-acessos`.
4. **Gestão de tráfego com rotina própria:** viável, desde que com travas. Veja `references/agente-trafego.md`.
