# Permissões da Meta por objetivo

Conferido na doc oficial (Graph API v26.0). Peça **só o que o objetivo usa**. Cada permissão a mais é pergunta a mais no App Review e risco a mais se o token vazar.

## Nível de acesso: Padrão x Avançado

- **Acesso Padrão** (o que todo app tem): vale para os ativos de quem tem papel no app ou no portfólio dono do app. Para operar a **sua** empresa, quase sempre basta.
- **Acesso Avançado**: para ativo de quem NÃO tem papel no app (a pessoa loga no seu app com a conta dela). Exige **App Review** e **Verificação do negócio**. O app precisa estar **Publicado**. Só importa se você constrói um produto para terceiros.
- Usuário do sistema por portfólio: com Acesso Padrão ao Gerenciamento de Anúncios, **1** usuário do sistema + 1 administrador. Com Avançado, **10** + 1. Pedido em Painel de Apps > Análise do App > Permissões e recursos > "Acesso Padrão ao Gerenciamento de Anúncios" > Solicitar Advanced Access.

## Anúncios (Marketing API)

| Objetivo | Permissões |
|---|---|
| Ler campanha, gasto, insights | `ads_read` |
| Criar, editar, pausar | `ads_management` (inclui leitura) |
| Listar o portfólio, atribuir ativo, criar usuário do sistema | `business_management` |
| Público, pixel, dataset, Conversions API | `ads_management` (mais `business_management` para dataset do portfólio) |
| Catálogo | `catalog_management` |
| Lead de formulário instantâneo | `leads_retrieval` + `pages_show_list` + `pages_read_engagement` + `pages_manage_metadata` (webhook `leadgen`); a página precisa dar acesso de lead ao app ou ao usuário em Ferramentas de Lead |
| Anúncio que usa a página | `pages_show_list`, `pages_read_engagement` |

## Instagram

Duas montagens. **Use a com Login do Facebook**, porque tudo passa pelo portfólio e pelo usuário do sistema (token que não vence).

| | Login do Facebook para Empresas | Login do Instagram |
|---|---|---|
| Conta | profissional **ligada a uma página** | profissional, sem página |
| Host | `graph.facebook.com` | `graph.instagram.com` |
| Token | de usuário, de página ou de usuário do sistema | de usuário do Instagram, 60 dias, renovável |
| Básico | `instagram_basic`, `pages_show_list`, `pages_read_engagement` | `instagram_business_basic` |
| Publicar | `instagram_content_publish` | `instagram_business_content_publish` |
| Comentários | `instagram_manage_comments` | `instagram_business_manage_comments` |
| Direct | `instagram_manage_messages` (mais `pages_manage_metadata` para o webhook) | `instagram_business_manage_messages` |
| Métricas | `instagram_manage_insights` | `instagram_business_manage_insights` |

Só na montagem com Facebook: busca por hashtag, marcação de produto e anúncio de parceria. Demografia só sai para seguidores e com volume ("Not enough users", erro 3006).

Sem `instagram_basic` você não consegue ler nem usar post orgânico do Instagram como anúncio (veja `meta-ads-subir-anuncio`).

## WhatsApp (Cloud API)

| Objetivo | Permissões |
|---|---|
| Conta, números, modelos, webhook | `whatsapp_business_management` |
| Mandar e receber mensagem | `whatsapp_business_messaging` |
| Listar o portfólio e atribuir a conta do WhatsApp | `business_management` |

O token do usuário do sistema precisa ter a conta do WhatsApp **atribuída** a ele (Contas do WhatsApp > Atribuir pessoas). Ser "Tech Provider" (outras empresas conectam o número delas pelo Embedded Signup) é coisa de quem constrói produto para terceiros e não faz parte deste roteiro.

## Página do Facebook

| Objetivo | Permissões |
|---|---|
| Listar páginas | `pages_show_list` |
| Ler posts, comentários, métricas | `pages_read_engagement`, `read_insights` |
| Responder comentário, publicar | `pages_manage_engagement`, `pages_manage_posts` |
| Webhook da página (mensagem, lead, comentário) | `pages_manage_metadata` |
| Messenger | `pages_messaging` |

## Tarefas no ativo (o que a pessoa ou o usuário do sistema pode fazer)

Atribuir ativo pede escolher as tarefas. Conta de anúncio: `MANAGE` (tudo), `ADVERTISE` (criar e editar anúncio), `ANALYZE` (só relatório). Página: `MANAGE`, `CREATE_CONTENT`, `MODERATE`, `ADVERTISE`, `ANALYZE`, `MESSAGING`. Para automação que cria anúncio, `ADVERTISE` + `ANALYZE` basta. `MANAGE` só quando precisa mexer em pagamento ou pessoas.
