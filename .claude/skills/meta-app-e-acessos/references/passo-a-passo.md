# Passo a passo no painel da Meta

Nomes de tela em português do Brasil. A Meta troca rótulo com frequência: onde estiver **[confirmar na tela]**, o fluxo vale e só o nome do botão pode ter mudado. Conduza pelo Navegador Osimplify (`bsk`, skill `navegador-osimplify`) com você logado. Senha, passkey e código do celular são seus.

## 1. Portfólio empresarial (Business Manager)

- `business.facebook.com/settings`: confirme no topo que é o portfólio certo. O ID está em **Informações da empresa** (vai para `META_BM_ID`).
- **Pessoas**: precisa haver pelo menos uma pessoa de verdade com controle total. Sem isso o usuário do sistema fica órfão quando alguém sai.
- **Central de Segurança, Verificação da empresa**: CNPJ e comprovante de endereço; de 2 a 10 dias úteis. Exigida para Acesso Avançado e para tirar o WhatsApp do limite inicial.
- Se uma agência ou parceiro vai operar para você: no SEU portfólio, **Usuários, Parceiros, Adicionar, Conceder acesso de parceiro** com o ID do portfólio dele, e você escolhe os ativos.

## 2. Criar o app

1. `developers.facebook.com/apps` e **Criar app**.
2. **Detalhes**: nome (por exemplo `<Sua empresa> - Integrações`) e o seu e-mail de contato.
3. **Casos de uso** (marque só os do objetivo; dá para somar depois) [confirmar na tela]:
   - Anúncios: "Criar e gerenciar anúncios com a API de Marketing".
   - Instagram: "Gerenciar mensagens e conteúdo no Instagram" (montagem com Login do Facebook).
   - WhatsApp: "Conectar-se com clientes pelo WhatsApp".
   - Página, Messenger, lead: "Gerenciar tudo na sua Página".
   - Conversions API: não precisa de app. O token sai do Gerenciador de Eventos.
4. **Empresa**: escolha o portfólio dono. Sem isso o usuário do sistema desse portfólio não consegue instalar o app.
5. **Configurações do app, Básico**: anote o **ID do app** e a **Chave secreta do app** (vão para `META_APP_ID` e `META_APP_SECRET`). Preencha ícone 1024x1024, **URL da Política de Privacidade**, **URL de exclusão de dados** (ou instruções) e categoria. Sem esses campos o app não publica.
6. **Configurações avançadas**: ligue **Exigir prova da chave secreta do app** (`appsecret_proof`) em app de produção. O `meta_acesso.py` manda a prova sozinho quando o `.env` tem o segredo.
7. **Publicar** (chave "Desenvolvimento para Ao vivo" no topo). Em desenvolvimento só quem tem papel no app usa, criativo de anúncio trava e webhook não entrega evento de produção.

## 3. Usuário do sistema

1. `business.facebook.com/settings`, **Usuários, Usuários do sistema, Adicionar**.
2. Nome `integracoes`, papel **Administrador** (o "Funcionário" não gera token com `business_management` para todos os ativos) [confirmar na tela].
3. Limite: com Acesso Padrão ao Gerenciamento de Anúncios, **1** usuário do sistema + 1 administrador por portfólio. Se já existe um, **reaproveite**.
4. Anote o ID (`META_SYSTEM_USER_ID`).

## 4. Atribuir ativos ao usuário do sistema

No usuário do sistema, **Atribuir ativos** (ou, pelo ativo: **Contas, Contas de anúncios / Páginas / Contas do Instagram / Contas do WhatsApp / Apps, o ativo, Atribuir pessoas**):

| Ativo | Tarefas mínimas |
|---|---|
| App | Gerenciar app (sem isso o token não é gerado nele) |
| Conta de anúncio | Gerenciar campanhas (`ADVERTISE`) + Ver desempenho (`ANALYZE`) |
| Página | Conteúdo, Mensagens, Anúncios, Insights, conforme o objetivo; leads: Leads |
| Conta do Instagram | Conteúdo, Mensagens, Insights |
| Conta do WhatsApp | Controle total para mexer em modelo e número; "Mensagens" se só envia |

Pela API (token de admin do portfólio, com `appsecret_proof`):

```bash
# instalar o app no usuário do sistema
curl -s -X POST "https://graph.facebook.com/v26.0/$SYSTEM_USER_ID/applications" \
  -d business_app=$APP_ID -d access_token=$ADMIN_TOKEN -d appsecret_proof=$PROOF
# atribuir conta de anúncio
curl -s -X POST "https://graph.facebook.com/v26.0/act_$AD_ACCOUNT_ID/assigned_users" \
  -d user=$SYSTEM_USER_ID -d 'tasks=["ADVERTISE","ANALYZE"]' -d business=$BM_ID \
  -d access_token=$ADMIN_TOKEN -d appsecret_proof=$PROOF
# atribuir conta do WhatsApp
curl -s -X POST "https://graph.facebook.com/v26.0/$WABA_ID/assigned_users" \
  -d user=$SYSTEM_USER_ID -d 'tasks=["MANAGE"]' -d access_token=$ADMIN_TOKEN -d appsecret_proof=$PROOF
```

`PROOF` é o HMAC-SHA256 do token com a chave secreta do app, em hexadecimal. Exemplo em Python, sem imprimir nada:

```python
import hmac, hashlib
proof = hmac.new(segredo.encode(), token.encode(), hashlib.sha256).hexdigest()
```

O `POST /{portfolio}/system_user_access_tokens` sem `appsecret_proof` volta erro 100 (medido).

## 5. Gerar o token

1. No usuário do sistema, **Gerar token**.
2. Escolha o **app** (o do portfólio, o mesmo do `META_APP_ID`).
3. **Validade: Nunca.** "60 dias" exige renovar antes de vencer, senão o token morre e só um novo resolve.
4. Marque só as permissões do objetivo ([permissoes.md](permissoes.md)). A tela só mostra o que o app tem liberado: permissão que não aparece quer dizer que falta o caso de uso no app.
5. Copie **na hora** direto para o `.env` (`META_ACCESS_TOKEN`). A Meta não mostra de novo.

Pela API: `POST /{SYSTEM_USER_ID}/access_tokens` com `business_app`, `scope` (lista separada por vírgula), `appsecret_proof` e `access_token` de admin. Sem `set_token_expires_in_60_days` sai "Nunca". O endpoint antigo `/ads_access_token` não funciona mais.

## 6. Instagram

- A conta tem de ser **profissional** (Empresa ou Criador) e **ligada a uma página** do Facebook (no Instagram: Configurações, Central de Contas; ou na página: Configurações, Contas vinculadas).
- Página e conta do Instagram dentro do portfólio (**Contas, Contas do Instagram, Adicionar**).
- O `META_IG_USER_ID` (17841...) sai de `GET /{META_PAGE_ID}?fields=instagram_business_account`.

## 7. WhatsApp

- Número seu: **Contas, Contas do WhatsApp** no portfólio, adicionando o número e confirmando o código que chega por SMS ou ligação.
- Registrar o número na Cloud API pede PIN de 6 dígitos (duas etapas). Guarde no `.env`, nunca no chat.
- Webhook: o callback é por conta do WhatsApp. Se outra ferramenta (automação, CRM) também assina o mesmo app, ela pode **sequestrar o callback** e a sua entrada de mensagens para de chegar. Confira com `GET /{META_WABA_ID}/subscribed_apps`.

## 8. Pixel e Conversions API

- O pixel (dataset) nasce em **Gerenciador de Eventos, Conectar dados**. O ID vai para `META_PIXEL_ID`.
- Token da Conversions API: **Gerenciador de Eventos, o dataset, Configurações, Conversions API, Gerar token de acesso**. Vai para `META_CAPI_TOKEN`. O token do usuário do sistema também funciona.
- Verifique o seu domínio em **Configurações da empresa, Segurança da marca, Domínios**. Ajuda a configurar os eventos de conversão do site.
- Teste em **Testar eventos**. O uso fica em `meta-ads-expert`, `references/audiences-pixel-catalogo.md`.

## 9. App Review (só no caso C)

- **Análise do App, Permissões e recursos**: pedir Acesso Avançado de cada permissão usada com ativo de terceiro. Cada uma pede descrição de uso e **vídeo** mostrando a jornada (conectar, conceder, usar).
- Pré-requisitos: verificação da empresa, app publicado, política de privacidade no ar.
- "Não pode enviar com envio anterior em análise" costuma ser rascunho incompleto, não envio preso.
