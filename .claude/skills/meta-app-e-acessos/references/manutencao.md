# Manutenção dos acessos da Meta

Primeiro passo de qualquer problema: `python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py`. Ele diz se o token vale, de que app é, quando vence e qual ativo do `.env` não responde. Só depois mexa em alguma coisa.

## Por código de erro

| Código | Subcódigo | O que costuma ser | Saída |
|---|---|---|---|
| 190 | 463 | token de 60 dias venceu | gerar token novo "Nunca" no usuário do sistema |
| 190 | 460 | senha da pessoa mudou (token de pessoa, não de sistema) | trocar por token de usuário do sistema |
| 190 | 458 | app removido | reinstalar o app no usuário do sistema |
| 190 | 467 ou sem | token revogado ou colado errado (aspas, fim de linha do Windows, espaço) | conferir o `.env`; gerar novo |
| 200 | | falta permissão **ou** o ativo não está atribuído ao usuário do sistema | `meta_acesso.py`: se a permissão está lá, é atribuição |
| 10 | | permissão não liberada ao app (Acesso Avançado, App Review); no Instagram, insight de mídia com menos de 5 visualizações | ver Análise do App; insight: esperar volume |
| 100 | | ID errado, campo que não existe na versão, ou ativo que o token não enxerga ("Unsupported get request") | conferir o ID e a atribuição; `appsecret_proof` faltando em `system_user_access_tokens` |
| 100 | 33 | campo inexistente no objeto | tirar o campo |
| 3 | | o app não tem a capacidade | somar o caso de uso no app |
| 4, 17, 613, 80004 | | limite de chamadas (app, conta, anúncio) | espaçar; ler o cabeçalho `X-Business-Use-Case-Usage` |
| 368 | | bloqueio temporário por política | parar; ver **Qualidade da conta** no portfólio |
| 3006 | | demografia do Instagram sem volume ("Not enough users") | é resposta, não defeito |
| 131042 | | WhatsApp: problema de pagamento do portfólio; o POST devolve `accepted` e a mensagem morre | método de pagamento na conta do WhatsApp |
| 131047 | | WhatsApp: texto livre fora da janela de 24h | usar modelo aprovado |
| 141006 ou 141010 | | conta do WhatsApp bloqueada por pagamento, ou negócio não verificado | pagamento ou verificação |

Os erros de criação de anúncio (2654, 1885183, 1870090, 2446501) estão na matriz da skill `meta-ads-subir-anuncio`.

## Por sintoma

**"Ontem funcionava e hoje não tem permissão"**
1. Rode `meta_acesso.py`. Token inválido: gerar novo. Válido mas ativo FALHA: alguém tirou o ativo do usuário do sistema, o parceiro removeu o acesso, ou a conta mudou de portfólio.
2. Confira no portfólio: **Usuários, Usuários do sistema, o usuário, Ativos atribuídos**.
3. Se o admin do portfólio mudou e o antigo saiu, o usuário do sistema continua. O que cai é token de PESSOA. Por isso use só token de usuário do sistema.

**"O token não mostra a permissão que eu preciso"**
- A tela de gerar token só lista o que o app tem. Some o caso de uso no app e gere um token novo.
- Token não ganha permissão depois de gerado: sempre um token novo, e troque no `.env` e em qualquer ferramenta que guarde cópia (automação, planilha, sistema).

**"A conta de anúncio sumiu ou parou"**
- Veja o `status` no script: PAGAMENTO PENDENTE, DESATIVADA, EM ANÁLISE DE RISCO. Nada disso é token: é cobrança ou política, resolvido pelo dono da conta no Gerenciador de Anúncios.

**"O app saiu do ar ou entrou em modo restrito"**
- **Análise do App, Exigências**: Verificação de Uso de Dados anual, política de privacidade fora do ar, ícone ou URL de exclusão inválidos. App que perde o prazo da verificação anual perde o acesso às permissões.

**"O webhook parou de chegar"**
- Assinatura do app ou da conta do WhatsApp trocada por outra ferramenta: confira `GET /{META_WABA_ID}/subscribed_apps` e o `override_callback_uri`.
- Instagram: o webhook vem assinado com o segredo do **app do Instagram**, não o do app principal.
- App voltou para desenvolvimento: evento de produção não entrega.

**"Gerei o token e o `appsecret_proof` falha"**
- O token é de outro app. O `meta_acesso.py` acusa quando `META_APP_ID` do `.env` difere do app do token.

## Rotina de saúde (mensal, ou antes de mexer nos anúncios)

```bash
python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py > /dev/null
echo "saída: $?"     # 0 ok · 3 ativo do .env sem acesso · 2 token morto
```

Vencimentos que não avisam:
- Token do Instagram pelo Login do Instagram: 60 dias. Renove antes.
- Verificação de Uso de Dados do app: anual, com aviso só no painel e no e-mail do admin.
- Token de 60 dias de qualquer lugar: renove com `GET /oauth/access_token?grant_type=fb_exchange_token&client_id=&client_secret=&set_token_expires_in_60_days=true&fb_exchange_token=` antes do prazo. Depois que vence, só gerando outro.

## Trocar um token (rotação ou vazamento)

1. Gerar o novo no usuário do sistema (mesmas permissões).
2. Trocar em **todos** os lugares que guardam cópia: o `.env`, a credencial de qualquer automação, qualquer sistema que o use. Procure onde mais o antigo está antes de revogar.
3. Provar com `meta_acesso.py` e uma chamada real do objetivo.
4. Revogar o antigo: no usuário do sistema, **Revogar tokens**; ou `GET /oauth/revoke?revoke_token=<antigo>&client_id=&client_secret=&access_token=<antigo>`.
5. Vazamento: revogue **primeiro**, troque depois, e anote a data em `anuncios/historico.md`.
