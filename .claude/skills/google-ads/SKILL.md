---
name: google-ads
description: "Campanha no Google Ads para negócio local e serviços: Pesquisa e Performance Max, conversão, verba pequena, palavras e relatório. Use quando: \"sobe Google Ads\", \"campanha no Google\", \"quero aparecer na pesquisa\". Não é: Meta (meta-ads-subir-anuncio) nem perfil no Google (google-meu-negocio)."
---

# Google Ads: subir e otimizar campanha de intenção

Quem procura no Google já sabe o que quer. Por isso esta skill trata a busca como **fundo de funil**: a pessoa digitou o problema. A conta só precisa estar na frente dela, com a medição ligada e alguém do outro lado atendendo.

> **Como ler os avisos.** `[a confirmar]` marca orientação geral da plataforma que ainda não foi testada na sua conta. Na primeira campanha, anote o que a tela fez de diferente e troque o marcador pelo que você mediu (veja "Primeira vez" no fim). Lição marcada como "medido" saiu de contas reais e vale como alerta, não como número seu.

## Quando usar e quando não usar

Use para: subir campanha de Pesquisa ou Performance Max (PMax) para serviço local ou loja, ligar a medição de conversão (WhatsApp, formulário, ligação), escolher verba e lance com orçamento pequeno, escrever os anúncios responsivos, montar a lista de negativas, ajustar o local por raio, rodar os 14 primeiros dias e o relatório semanal.

Não use para:
- Meta, Facebook e Instagram: `meta-ads-subir-anuncio`.
- Entender o negócio e liberar o tráfego antes de gastar: `pre-voo-de-trafego` (o gate READY vale igual aqui).
- Doutrina de mídia (escalar ou cortar): `doutrina-trafego`.
- Ângulo e copy de anúncio: `niveis-de-consciencia`.
- Auditar a peça: `analisador-criativos`.
- Perfil da empresa no Google (mapa, avaliações): `google-meu-negocio`.

**Regra de ouro:** construa **pausado**, mostre, e só ative com o **seu OK explícito**. Ativar gasta dinheiro real.

Plano e registros desta skill ficam em `anuncios/google-ads/` e a linha do tempo em `anuncios/historico.md`.

---

## Fase 0: o PORTÃO de acessos (bloqueia tudo)

**Cadastro preenchido não é acesso funcionando.** Junte a lista inteira de uma vez e **prove cada item usando**, antes de construir qualquer coisa.

| Acesso | Como PROVAR (usando) |
|---|---|
| Conta Google Ads (Customer ID `NNN-NNN-NNNN`) com acesso administrativo | abrir a conta, ler o Customer ID no topo e **criar um rascunho de campanha sem publicar** |
| Forma de pagamento ativa e sem pendência | tela de Faturamento mostra método ativo e conta sem suspensão |
| Site e Google Tag Manager (GTM), ou quem publica o site | **ler a versão publicada do container** (pela tela do GTM) e ver as tags de verdade |
| GA4 da propriedade certa | abrir a propriedade, ver o `G-...` e conferir que o evento existe no DebugView |
| Perfil da Empresa no Google (se tiver ponto físico) | perfil verificado e vinculável na conta de anúncios |
| WhatsApp ou telefone de destino e quem atende | mandar uma mensagem pelo link e **ver chegar no aparelho e no seu controle de leads** |
| Só se for usar API: developer token e acesso OAuth | veja a nota abaixo |

**O developer token tem fila.** A aprovação costuma levar de alguns dias úteis a semanas `[a confirmar]`. Peça cedo. **Campanha não depende de API:** criar e otimizar pela interface não exige credencial nenhuma. A API só serve para puxar métrica e gerir por código.

Se for usar API, as variáveis ficam no `.env` da raiz. Os IDs públicos podem ir para `empresa/PERFIL.md`. Os segredos ficam só no `.env`.

| Variável | O que é | Segredo? |
|---|---|---|
| `GOOGLE_ADS_CUSTOMER_ID` | ID da conta, só dígitos | não |
| `GOOGLE_ADS_LOGIN_CUSTOMER_ID` | ID da conta administradora (MCC), se usar | não |
| `GOOGLE_ADS_DEVELOPER_TOKEN` | token de desenvolvedor | sim |
| `GOOGLE_OAUTH_CLIENT_ID` | cliente OAuth | não |
| `GOOGLE_OAUTH_CLIENT_SECRET` | segredo do cliente OAuth | sim |
| `GOOGLE_OAUTH_REFRESH_TOKEN` | token de renovação | sim |
| `GA4_MEASUREMENT_ID` | `G-...` do GA4 | não |
| `GA4_API_SECRET` | segredo do Measurement Protocol | sim |

Nunca escreva o valor de um segredo no chat nem em arquivo que vá para o git.

**Pronto quando:** cada linha da tabela foi usada uma vez, a prova está anotada em `anuncios/historico.md` e os IDs públicos estão em `empresa/PERFIL.md`.

---

## Fase 1: terreno e decisão (o que se compra na busca)

1. **Puxe o que já existe** antes de perguntar: `empresa/PERFIL.md`, `anuncios/historico.md` e o pré-voo, se houver (`anuncios/pre-voo/`).
2. **Liste de 10 a 30 termos com intenção de compra**, na voz de quem procura: serviço mais cidade, serviço mais "perto de mim", sua marca, dor específica. Termo de curiosidade ("o que é", "como fazer", "grátis") não entra: vira negativa (`references/limites-e-copy.md`).
3. **Escolha o tipo de campanha:**
   - **Pesquisa** para quase todo negócio local. É onde a intenção mora e onde você enxerga termo por termo.
   - **Performance Max** só depois que a Pesquisa já converte e existe volume de conversão, porque a PMax decide sozinha onde aparecer e **não mostra o termo**. Se entrar, entre com uma campanha de **marca própria na Pesquisa** ligada e a marca negativada na PMax, senão a PMax colhe quem já ia clicar de graça e leva o crédito `[a confirmar]`.
4. **Verba e alvo escritos:** orçamento diário, custo por lead (CPL) alvo e o teto de custo por venda que o ticket aguenta. Sem CPL-alvo não existe decisão de escalar ou cortar, só opinião.

**Pronto quando:** existe em `anuncios/google-ads/plano.md` a lista de termos, a cidade e o raio, o orçamento diário, o CPL-alvo e a escolha Pesquisa ou PMax com uma linha de justificativa.

---

## Fase 2: medição ANTES do primeiro real gasto

Esta é a fase que mais dói quando se pula. Três lições medidas em contas reais:

- **Clínica com milhares de conversas:** nenhuma tinha `utm_source`, `gclid` ou `fbclid` guardado. Sem isso não dá para saber qual canal traz quem paga, nem calcular o custo por cliente. **O dado perdido não retroage.**
- **Site de saúde com container de tags publicado:** a documentação dizia que a tag do Google Ads estava lá. Lendo a versão publicada do container, ela estava **ausente**. Só a leitura do container decide.
- **Operação de venda de alto ticket:** o Google Ads era o canal que mais vendia e **o único pago sem uma linha de custo no sistema**. Sem custo do canal, a decisão de verba é chute.

### Os quatro caminhos de conversão (escolha e declare qual)

| Caminho | Como | Quando usar |
|---|---|---|
| **A. Evento-chave do GA4 importado** | evento no `dataLayer`, depois GA4, marcar como evento-chave, vincular o GA4 ao Google Ads e importar em Conversões | o mais simples, se o site já dispara eventos como `whatsapp_click` ou `generate_lead` |
| **B. Ação de conversão nativa** | criar a ação no Google Ads (gera ID e rótulo), tag de conversão no GTM acionada pelo MESMO evento, publicar a versão | quando você quer o dado dentro do Google Ads sem depender do GA4 |
| **C. Ligação** | ativo de chamada com encaminhamento e duração mínima, mais o clique em telefone do site | negócio que fecha por telefone |
| **D. Conversão offline por `gclid`** | guardar o `gclid` no primeiro toque, levar ao controle de leads, subir a venda por `uploadClickConversions` | quando a venda fecha fora do site (o caso da maioria dos serviços) |

**A e B na mesma ação, as duas como primárias, contam a mesma coisa duas vezes** e envenenam o lance automático `[a confirmar]`. Escolha **uma por ação** e confira a coluna de origem na tela de Conversões.

**Sobre o caminho D:** o método é `customers/{CUSTOMER_ID}:uploadClickConversions` da API do Google Ads. A versão da API muda: confira a vigente na documentação antes de usar. Exige developer token (fila da Fase 0). Do lado do controle de leads, guarde `gclid`, `utm_*` e `fbclid` em campos próprios desde o primeiro contato. Se a sua planilha ou CRM já traz esses campos, não crie duplicado.

### A URL que carrega a origem

Em Configurações da conta, Acompanhamento, Modelo de URL final:

```
{lpurl}?utm_source=google&utm_medium=cpc&utm_campaign={campaignid}&utm_content={adgroupid}&ad_id={creative}&utm_term={keyword}
```

Confira na documentação do Google se as macros continuam valendo `[a confirmar]`. Com a marcação automática (auto-tagging) ligada, o `gclid` vem sozinho e identifica o **clique**. Quem liga ao **custo** é o identificador do anúncio. **Teste em um anúncio e clique nele antes de aplicar na conta toda.**

**Pronto quando:** uma conversão de **teste** feita por você aparece na coluna de conversões da conta (pode demorar algumas horas), você sabe dizer qual caminho a contou, e o lead do teste apareceu no seu controle de leads com o `gclid` preenchido.

---

## Fase 3: estrutura da conta e nomenclatura

- **Uma campanha por objetivo ou serviço**, poucos grupos de anúncio, cada grupo com **um tema de palavra** (o grupo existe para que o anúncio possa repetir a palavra que a pessoa digitou).
- **Rede só Pesquisa:** desligue a Rede de Display e considere desligar Parceiros de Pesquisa no começo, senão o clique barato entra e suja o aprendizado `[a confirmar]`.
- **Local por raio** em cima do endereço, na mesma lógica do pin do Meta: comece apertado e abra quando faltar volume.
- **Idioma** português e **horário** colado no horário em que alguém responde. Anúncio que gera lead às 23h para quem só responde às 9h vira lead frio.
- **Nomenclatura** (proposta, ainda não validada na sua conta):

```
CAMPANHA:  [EMPRESA] | GADS | [SEARCH ou PMAX] | [FUNIL] | [OFERTA] | [AAAA-MM]
GRUPO:     [TEMA-DA-PALAVRA] | [CORRESPONDENCIA] | [GEO]
ANUNCIO:   RSA | [ANGULO] | vNN
```

Exemplo: `MINHA-EMPRESA | GADS | SEARCH | BOF | Servico-Principal | 2026-11`. Sem acento, sem emoji, ` | ` separa dimensão e `-` liga palavra.

**Pronto quando:** campanha, grupos e anúncios nomeados no padrão, e Customer ID e nomes anotados em `empresa/PERFIL.md`.

---

## Fase 4: palavras, correspondência e negativas

- **Comece em exata e frase.** Ampla só depois que a conta tem conversão e há verba para pagar o aprendizado. Com orçamento pequeno, ampla queima o dia em termo que não vende `[a confirmar]`.
- **Negativas antes do primeiro clique.** A lista inicial está em `references/limites-e-copy.md`.
- **O relatório de termos de pesquisa é a leitura obrigatória da semana.** É o único lugar que mostra o que a pessoa realmente digitou. O que não vende vira negativa. O que vende e ainda não existe como palavra vira palavra nova.
- **Marca própria:** campanha separada, verba pequena, correspondência exata. Barata, e defende o seu nome.

**Pronto quando:** a campanha está **pausada** com grupos, palavras, negativas, raio, rede e orçamento definidos, e nada foi publicado ainda.

---

## Fase 5: lance e verba para orçamento pequeno

| Momento | Lance | Por quê |
|---|---|---|
| Conta nova, zero conversão medida | **Maximizar cliques com limite de CPC** | lance automático sem conversão para aprender chuta caro `[a confirmar]` |
| Conversão já chegando e estável | **Maximizar conversões** | a partir daqui o robô tem o que otimizar |
| Volume alto e CPL estável | **CPA-alvo** | exige histórico; com pouco volume, oscila |

Regras práticas `[a confirmar]`: o orçamento diário é média, e o Google pode gastar mais num dia e compensar em outro. Não mexa em lance e palavra no mesmo dia (uma variável por vez). Não deixe recomendação automática se aplicar sozinha: desligue a aplicação automática de sugestões.

**Pronto quando:** a estratégia de lance está escolhida com uma linha dizendo por quê, e o teto de gasto do mês está escrito.

---

## Fase 6: anúncios (RSA) e destino

Limites de caractere, quantidade de títulos e descrições, ativos (sitelink, frase de destaque, chamada) e as regras de escrita estão em **`references/limites-e-copy.md`**. O essencial:

- **O anúncio repete a palavra do grupo** no título. É o que sustenta a relevância e derruba o CPC.
- **Destino específico**, nunca a home quando existir página do serviço. Recomendação medida: "página de destino específica por categoria, nunca a home".
- **Se o seu negócio é de saúde:** registro profissional real do responsável, nenhuma promessa de cura, nenhum claim clínico. Some a isso a política do Google para saúde, que restringe remarketing com esse tipo de dado `[a confirmar]`.
- **A copy vem de `niveis-de-consciencia`**, na sua voz. Esta skill executa, não inventa oferta, preço nem claim.

**Pronto quando:** cada grupo tem 2 anúncios dentro dos limites, sem claim proibido, apontando para o destino certo, e você abriu o link uma vez.

---

## Fase 7: publicar com OK e os primeiros 14 dias

1. **Mostre antes:** campanha pausada, estrutura, palavras, anúncios, orçamento diário e o que vai ser medido. Peça o **seu OK por escrito**.
2. **Ative e clique no próprio anúncio uma vez:** prova que a URL leva ao lugar certo, que o parâmetro chegou e que a conversão de teste registra.
3. **Rotina dos 14 dias** (não mexa todo dia, mexa nestes pontos):

| Dia | O que fazer | O que NÃO fazer |
|---|---|---|
| 1 | conferir entrega, gasto do dia e se o lead chegou no seu controle | mexer em lance |
| 3 | ler termos de pesquisa, negativar o lixo | trocar a estratégia de lance |
| 7 | primeira leitura de custo por conversão x CPL-alvo; pausar grupo sem clique e sem impressão | subir verba por empolgação |
| 10 | ler termos de novo; testar 1 título novo por grupo | mudar duas coisas juntas |
| 14 | decisão por campanha: escalar, manter ou cortar, com o número escrito | decidir pelo número da plataforma sem olhar o controle de leads |

**Pronto quando:** duas leituras de termos feitas com negativas aplicadas, uma conversão real confirmada nos dois lados (painel e controle de leads), e a decisão do dia 14 registrada em `anuncios/historico.md`.

---

## Fase 8: relatório semanal (o número que vale é o do seu controle de leads)

Uma tabela por campanha, sempre com as duas colunas lado a lado:

| Da plataforma | Do seu controle de leads |
|---|---|
| gasto, impressões, cliques, CTR, CPC médio, conversões, custo por conversão | leads criados com origem Google, leads com `gclid` preenchido, vendas ganhas, ticket |

Três regras de leitura, medidas em contas reais:

1. **Sem custo do canal, não existe decisão de verba.** Numa operação real, o Google Ads convertia lead em venda cerca de dez vezes melhor que o Meta, e o Meta custava quase o valor do ticket por venda. O Google, que vendia melhor, era o único canal sem linha de custo no sistema. Quem olhava só o Meta cortava o canal errado.
2. **A janela muda a conclusão.** No mesmo caso, o campo "origem do lead" estava preenchido em pouco mais de um terço da base inteira e em quase todos os leads do mês corrente. Conversão por origem calculada na base velha é ruído. Recorte a janela em que a origem é confiável e **diga qual janela usou**.
3. **Parâmetro que não foi colado hoje não volta amanhã.** Numa conta, o gasto de milhares de reais ficou ligado a menos de 1% dos leads, porque a origem nunca foi guardada.

Registre uma linha em `anuncios/historico.md` e salve o relatório em `anuncios/google-ads/relatorio-AAAA-MM-DD.md`.

---

## Armadilhas (sintoma, causa, o que fazer)

| Sintoma | Causa provável | O que fazer | Procedência |
|---|---|---|---|
| Painel mostra conversão, o controle de leads não mostra lead | a tag conta clique em botão, não conversa iniciada | comparar contagem com o controle na mesma janela; contar "uma" por lead | `[a confirmar]` |
| Conversão contada em dobro | evento do GA4 importado E tag nativa na mesma ação, as duas primárias | escolher um caminho por ação | `[a confirmar]` |
| Gasta e não vem lead | correspondência ampla mais termo de curiosidade | exata ou frase, relatório de termos toda semana, negativas | `[a confirmar]` |
| Anúncio aparece fora da cidade | ajuste de local incluindo quem apenas demonstra interesse na região | escolher "presença" e conferir na tela, porque o padrão muda | `[a confirmar]` |
| Marca própria fica cara depois da PMax | PMax colhendo busca de marca | Pesquisa de marca ligada e marca negativada na PMax, comparando antes e depois | `[a confirmar]` |
| Clique barato demais e nenhum lead | Rede de Display ou Parceiros ligados na campanha de Pesquisa | desligar e reler | `[a confirmar]` |
| Não dá para calcular o custo por cliente do canal | `gclid` e UTM nunca guardados | ligar a captura antes de gastar; o dado perdido não retroage | medido numa clínica |
| Tag "está configurada" e não existe | a documentação dizia que sim, o container dizia que não | ler a versão publicada do container antes de afirmar | medido num site de saúde |
| Campo de `gclid` criado em duplicado | o seu CRM já traz o campo nativo | conferir os campos nativos antes de criar | medido numa loja |
| Canal que mais vende sem custo no painel | conta não sincronizada com o relatório de custo | ligar a sincronia antes de decidir verba | medido numa operação de alto ticket |
| Conta suspensa e campanha parada sem aviso | faturamento com pendência | conferir Faturamento no portão (Fase 0) | `[a confirmar]` |

---

## Fluxo de decisão rápido

```
Tem acesso PROVADO pelo uso?  não: Fase 0, e nada é construído
                              sim ↓
A conversão está medida e provada com um teste?  não: Fase 2 antes de gastar
                                                 sim ↓
Serviço local → Pesquisa, exata e frase, raio apertado, negativas antes
Já converte com volume → avaliar PMax, com marca própria protegida
Sempre: pausado → mostrar → seu OK por escrito → ativar → clicar no próprio anúncio
Toda semana: termos de pesquisa → negativas → custo por conversão x controle de leads → decidir
```

---

## Passos curtos para o dia (`plano-do-dia`)

Se você quer quebrar "Subir Google Ads" em passos, a skill `plano-do-dia` aceita esta sequência. O primeiro cabe em 15 minutos:

```
1. Pedir e provar os acessos do Google Ads (Fase 0)            15 min
2. Escrever termos, raio, verba e CPL-alvo (Fase 1)            60 min
3. Ligar e provar a conversão com um teste (Fase 2)           120 min
4. Montar campanha pausada com negativas (Fases 3, 4, 5)      120 min
5. Escrever os anúncios (Fase 6)                               60 min
6. Publicar com OK e provar o primeiro clique (Fase 7)         30 min
7. Primeiro relatório semanal (Fase 8)                         60 min
```

Combine com `analisador-criativos` quando houver peça visual e com `pre-voo-de-trafego` quando a estratégia ainda não está fechada.

---

## Primeira vez (é o que transforma esta skill em medida)

Na primeira campanha de verdade, registre em `anuncios/historico.md` o que **aconteceu**, não o que era esperado:

1. Qual conta (Customer ID), de quem é e quem paga.
2. O que cada acesso exigiu na prática e qual deles travou. Se pediu developer token, quantos dias o Google levou.
3. Qual caminho de conversão foi escolhido e o que ele contou a mais e a menos contra o seu controle de leads.
4. Os termos que trouxeram lead e os que queimaram verba, com número.
5. CPL real x CPL-alvo e o que foi decidido no dia 14.
6. Tudo que a tela fez diferente do que está escrito aqui (o padrão do Google muda sem avisar).

Depois, troque nesta skill cada `[a confirmar]` que virou fato por "medido na minha conta em `<data>`". Sem o registro que prova, o marcador continua como está.

## Frases-âncora

- "Quem pesquisa já decidiu comprar. O anúncio só precisa estar na frente e ser atendido."
- "Sem medição provada por um teste, campanha no ar é doação com relatório."
- "O parâmetro que não foi colado hoje não volta amanhã."
- "O número do painel é do painel. A venda é do seu controle de leads."
- "A janela muda a conclusão: origem em base velha é ruído."
- "O que você não mediu fica marcado como a confirmar, mesmo que o Google jure o contrário."
