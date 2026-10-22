# Graph API: fundamentos

## Estrutura

A Marketing API é um conjunto de endereços da **Graph API**. Tudo é nó (objeto), edge (relação) e campo (propriedade).

```
https://graph.facebook.com/v{XX.0}/{id-do-nó}?fields=campo1,campo2&access_token={token}
```

- **Nó:** um objeto (`act_{id}`, um id de campanha, um id de conjunto).
- **Edge:** uma coleção dentro de um nó (`act_{id}/campaigns`, `{campaign_id}/adsets`).
- **Campos:** o que ler ou escrever. Peça sempre `?fields=` explícito. Sem isso vem o mínimo.

## Versão da API

A versão faz parte da URL (`/v26.0/...`). A Meta lança versões novas umas duas vezes por ano e cada uma tem suporte por cerca de 2 anos. **Fixe uma versão** (variável `META_API_VERSION` no `.env`) e confira o changelog antes de trocar: `developers.facebook.com/docs/graph-api/changelog`. Deprecação relevante já anunciada: campanhas legadas de Advantage Shopping e de App migram para **Advantage+**.

---

## Tipos de token

| Token | Para quê | Validade |
|---|---|---|
| **De usuário** | ações em nome de uma pessoa logada | curto (1 a 2 horas) ou longo (cerca de 60 dias) |
| **De página** | agir como a página | deriva do token de usuário |
| **De usuário do sistema** | **automação de servidor** (o ideal para rotina) | 60 dias ou sem vencimento |
| **De app** | operações do app | não serve para dados de usuário |

Para automação que não pode quebrar, use o **token de usuário do sistema**. Ele não depende de uma pessoa logada. Como gerar: skill `meta-app-e-acessos`.

**`appsecret_proof`** (recomendado em chamada de servidor): assine o token com o segredo do app.

```
appsecret_proof = HMAC_SHA256(access_token, app_secret)
```

Mande como parâmetro `appsecret_proof` junto com `access_token`. Se o app tiver ligada a opção "Exigir prova da chave secreta", o pedido sem ela é recusado.

---

## Níveis de acesso

- **Desenvolvimento:** testa nas suas contas, anúncio não entrega.
- **Básico:** entrega real, com limites. Vem sozinho com o app.
- **Padrão:** acesso pleno, exige **App Review**.

## App Review (o que costuma travar)

Para o nível Padrão, a Meta avalia a finalidade do app, como você usa cada permissão pedida e um fluxo funcionando. Prepare: vídeo de demonstração, descrição clara do uso de `ads_management` e `business_management`, política de privacidade no ar. Para gerir **a sua própria conta**, muitas vezes nem é preciso: confira em `meta-app-e-acessos`.

## Permissões mais usadas

- `ads_read`: só leitura de anúncios e resultados
- `ads_management`: criar, editar e pausar campanhas, conjuntos e anúncios
- `business_management`: itens do Business Manager
- `pages_show_list`, `pages_read_engagement`, `pages_manage_ads`: páginas
- `catalog_management`: catálogo de produtos

## Limites de chamadas

A Marketing API limita por app e por conta de anúncio (uma pontuação que sobe com o volume e cai com o tempo). Em lote, espace os pedidos e leia o cabeçalho `X-Business-Use-Case-Usage`. Estourou: apareceu erro de limite. Espere e tente de novo com intervalo crescente.
