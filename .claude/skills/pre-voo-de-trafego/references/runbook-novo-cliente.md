# Runbook: da estrutura à primeira campanha

O passo a passo operacional do pré-voo para a sua empresa, qualquer nicho. Segue de cima para baixo. Cada fase diz quem faz (você, o Claude ou outra skill) e qual é o critério de pronto.

**A lei do runbook.** O pré-voo é DONO do entendimento e do veredito. Ele **passa o bastão** para as skills que executam. E o gate é DURO: **não se gasta o primeiro real sem os itens críticos fechados.**

**Por que ele existe.** Uma loja de perfume importado subiu anúncio de conversa **sem pré-voo** e ouviu "leads sem interesse". Causa medida: objetivo "conversa" otimiza VOLUME, não intenção. Público amplo a frio. Criativo estático que não filtrava. Zero triagem na porta. Instagram morto. Numa semana, o público de revendedores trouxe quase metade das conversas com um quarto da verba, a menos da metade do custo por conversa. O público amplo da região queimou três quartos da verba com consumidor final.

---

## Mentalidade

- **Nunca invente número.** Preço, margem, volume, CAC, CPL: o que você não tem é `[A CONFIRMAR com o dono]`. Sem dado, o veredito **não pode ser READY**.
- **Uma voz por peça. Prova pelo MECANISMO**, não pela promessa saturada.
- **O terreno vem antes do anúncio.** A pressa de "subir logo" é exatamente o que quebra campanha.
- **Cada fase tem critério de pronto.** Não passe de fase com item crítico aberto. Anote como pendência e trave.

---

## FASE 0: Estrutura e acessos

**Objetivo:** existir uma casa para o trabalho antes de qualquer campanha. Arquivos no lugar e acessos funcionando.

**Faça:**
1. Confira ou crie `empresa/PERFIL.md` (nome, segmento, cidade, oferta, ticket, canais). Os IDs públicos vão aqui. **Segredos nunca.**
2. Confira ou crie o `.env` na raiz com as variáveis do Meta (e do Google, se for usar). Confirme que ele está no `.gitignore`. Veja `meta-app-e-acessos`.
3. Registre os **acessos de tráfego**: portfólio e conta de anúncio, administrador da página do Facebook e do Instagram, WhatsApp Business, dono do pixel.
4. Rode `python .claude/skills/meta-app-e-acessos/scripts/meta_acesso.py` e leia o que falha.
5. Crie `anuncios/historico.md` para a linha do tempo.

**Critério de pronto:** `PERFIL.md` criado e é a fonte da verdade · `.env` fora do git · **acesso confirmado pelo script** à conta de anúncio, página, Instagram e WhatsApp. Sem acesso o tráfego não sobe.

---

## FASE 1: Entrevista e diagnóstico

**Objetivo:** parar de chutar. Extrair os **dados concretos** do negócio e cravar a hipótese de gargalo. Se você tem 10 dias, gaste 8 perguntando.

**Faça:** a entrevista abaixo, em blocos, **adaptada ao nicho** (clínica fala de agenda e comparecimento, loja fala de ticket e giro, software fala de assinatura e cancelamento). **Persiga número em toda resposta vaga** ("vende bem" é quantos por mês? qual o ticket? quantos % fecham?). Marque cada dado como `[confirmado]`, `[estimado]` ou `[faltando]`.

| Bloco | Perguntas essenciais |
|---|---|
| **Identidade** | O que vende, para quem, onde, desde quando, quem atende. |
| **Economia** | Faturamento médio por mês · ticket médio · margem aproximada · custo para atender uma venda. |
| **Conversão** | Quantos contatos por mês e de onde vêm · quantos viram venda · tempo entre o primeiro contato e a compra · onde as pessoas somem. |
| **Meta** | Quanto quer vender em 90 dias e em 12 meses · verba mensal para anúncios · quanto aceita pagar por lead e por venda. |

Os quatro blocos são **obrigatórios**. Sem eles não há diagnóstico honesto.

Salve em `anuncios/pre-voo/dossie-negocio.md` e feche com a **hipótese de gargalo** (leitura inicial dos números). Se o pedido for olhar a operação inteira, use `raio-x-comercial`.

**Critério de pronto:** dossiê salvo com os 4 blocos · hipótese de gargalo escrita · lista de `[A CONFIRMAR]` explícita.

---

## FASE 2: Pré-voo (os 7 pilares)

**Objetivo:** o coração da skill. Entender o terreno pelos **7 pilares**, com a **jornada como espinha**.

| # | Pilar | O que fecha aqui |
|---|---|---|
| 1 | **Negócio e oferta** | O que realmente se vende, ticket, margem, conta básica. |
| 2 | **Público (ICP) e subperfis** | Quem compra, os recortes, onde vive, o que já sabe. |
| 3 | **Jornada x consciência (a espinha)** | As escadas degrau a degrau, com nível de consciência por estágio. |
| 4 | **Mensagem e ângulo por estágio** | O que dizer em cada degrau. |
| 5 | **Prova e diferenciação** | Provar pelo **mecanismo**. |
| 6 | **Canal, objetivo e filtro na porta** | Objetivo certo do Meta mais o filtro que qualifica. |
| 7 | **Rastreio, KPI e veredito** | O que medir, a régua, o veredito. |

**Faça:**
1. Preencha os pilares 1 e 2 direto do dossiê da fase 1.
2. **Desenhe a jornada (pilar 3)** pelo método de `metodo-jornada.md`. Se o público é frio e inconsciente, a copy começa na DOR, nunca na oferta.
3. Derive a mensagem e o ângulo (pilar 4) de cada degrau com `niveis-de-consciencia`.
4. Empacote prova e diferenciação (pilar 5): qual o **mecanismo** que prova a promessa.
5. Defina canal, objetivo e filtro na porta (pilar 6): decisão aqui, construção na fase 3.
6. Defina rastreio, KPI e régua (pilar 7): decisão aqui, montagem na fase 3.
7. Pesquise o mercado (obrigatório): Biblioteca de Anúncios do Meta para ler a sofisticação e o que os concorrentes prometem.
8. Salve em `anuncios/pre-voo/pre-voo-AAAA-MM-DD.md`.

**O que precisa do dono:** qual subperfil é o alvo prioritário · qual a prova real disponível · o que ele considera um lead bom e um lead ruim (isso vira o critério do filtro).

**Critério de pronto:** **jornada mapeada degrau a degrau com consciência por estágio** (item crítico) · ângulo por estágio · mecanismo de prova · objetivo e conceito de filtro decididos · KPI e régua escritos · dossiê salvo.

---

## FASE 3: Lastro. Preparar os ativos ANTES de subir

**Objetivo:** nunca jogar tráfego num destino morto ou sem filtro. Antes do primeiro real, o destino tem que estar **vivo, rastreado e com porteiro**.

**Os 4 lastros (todos obrigatórios):**
1. **Filtro na porta (o porteiro).** Mensagem de triagem que **auto-seleciona** quem chega e separa o comprador do curioso já na primeira troca. Quem constrói: `whatsapp-sales-process`.
2. **Página ou perfil de destino VIVO.** Se o clique cai no Instagram, no WhatsApp ou no site, ele tem histórico e está apresentável. Instagram morto é tráfego caindo no vazio. Perfil com posts, bio e prova social. WhatsApp Business com saudação e horário. Se tiver ponto físico, a ficha do Google também: `google-meu-negocio`.
3. **Rastreio, pixel e evento montados.** Pixel instalado, evento certo disparando (lead, conversa ou compra, conforme o objetivo). Quem monta: `meta-ads-expert`. Sem rastreio você não sabe qual público ou criativo qualifica.
4. **Prova empacotada.** O material do pilar 5 pronto para virar criativo. Quem avalia a peça: `analisador-criativos`.

**Se o funil no seu controle de leads ainda não existe:** `arquiteto-de-funis`.

**Critério de pronto:** filtro ativo e testado (2 ou 3 cenários: comprador, curioso, objeção) · destino vivo e apresentável · pixel disparando o evento certo (testado) · prova empacotada. **Qualquer um aberto = não passa para o gate.**

---

## FASE 4: Plano de mídia

**Objetivo:** transformar o pré-voo num plano de campanha executável: canal, **objetivo CERTO**, público, divisão de verba e criativo que **filtra**.

**Faça:**
1. **Canal e objetivo.** Escolha o objetivo do Meta que otimiza **intenção**, não volume vazio. "Conversa" otimiza volume de conversa. Se o KPI é venda, o objetivo puxa quem compra, e o filtro faz o resto.
2. **Público por subperfil.** Topo, meio e fundo segundo a jornada: frio é interesse amplo, médio é semelhante ou quem engajou, remarketing é totalmente consciente. **Case o público com o ângulo.** Oferta ou preço em público frio queima caro.
3. **Divisão de verba com teste separado por subperfil.** Nunca uma verba única cega. Só se descobre o vencedor porque se mediu separado.
4. **Criativo que filtra.** Brief que **auto-seleciona** o público certo (fala a língua do comprador, mostra o mecanismo, repele o curioso). Não um estático genérico.
5. **Consolide** o plano no dossiê (objetivo, públicos, divisão, criativos, KPI e régua da fase 2).

**O que precisa do dono:** verba mensal e verba de teste · aprovação do conceito de criativo · subperfis a testar.

**Critério de pronto:** objetivo coerente com o KPI · públicos por subperfil com verba separada · brief de criativo que filtra aprovado · divisão de verba escrita · tudo com número real (verba `[confirmada]`, não estimada).

---

## FASE 5: GATE (o veredito)

**Objetivo:** decidir com dureza se pode gastar o primeiro real. O gate **libera ou barra.** Rubrica completa em `gate-readiness.md`.

| Veredito | Quando |
|---|---|
| **READY** | Todos os itens críticos fechados e com dado real. Pode subir. |
| **READY-COM-RESSALVAS** | Sobe com verba de teste limitada e ressalva explícita, com plano de fechar a ressalva na primeira semana. |
| **NÃO-READY** | Falta item crítico. **Barrado.** Volta para a fase que tem o buraco. |

**Checklist crítico (todos precisam estar ok para READY):**
- [ ] **Jornada mapeada** degrau a degrau com consciência por estágio (fase 2).
- [ ] **Objetivo de campanha certo**: otimiza intenção, não volume vazio (fase 4).
- [ ] **Filtro na porta definido e testado** (fase 3).
- [ ] **Rastreio montado**: pixel e evento disparando (fase 3).
- [ ] **Destino vivo** (fase 3). Instagram morto é NÃO-READY.
- [ ] **Pendências de dado que travam precisão fechadas**: nada crítico em `[A CONFIRMAR]`, verba é número real.
- [ ] **Público testado por subperfil com verba separada** (fase 4).

**Regra dura:** com qualquer item crítico aberto, o máximo é **NÃO-READY** ou **READY-COM-RESSALVAS** com verba de teste travada. **Nunca READY.** Sem dado não há READY.

**Critério de pronto:** veredito escrito no dossiê com a justificativa item a item, e o **seu OK explícito** para gastar verba.

---

## FASE 6: Subir a primeira campanha e o loop de leitura

**Objetivo:** subir o primeiro anúncio com verba de teste, medir o que importa na primeira semana e entrar no loop de leitura. Nada de "subir e torcer".

**Faça:**
1. **Construa tudo PAUSADO** (campanha, conjunto, criativo, anúncio) com `meta-ads-subir-anuncio`. Confira a prévia antes de ativar. Lembre: orçamento em **centavos** (`5000` é R$ 50,00; errar é gastar 100 vezes) e `special_ad_categories` obrigatório, mesmo vazio.
2. **Verba de teste, não verba cheia.** Subperfis em conjuntos separados.
3. **Confira o modo do app.** Em Desenvolvimento o anúncio "funciona" mas não entrega. Veja `meta-app-e-acessos`.
4. **Ative** só depois do READY e do seu OK.
5. **Meça na primeira semana (a régua):** custo por conversa ou lead **por subperfil**, taxa de lead qualificado (o filtro está barrando curioso?), CPL x o alvo do dossiê, e para onde a verba está indo. Compare público a público, não olhe só o agregado.
6. **Loop de leitura:** corte o subperfil caro, escale o barato e qualificado, ajuste criativo e ângulo se o filtro estiver deixando passar curioso. Decisão de escala e corte: `doutrina-trafego`. Registre tudo em `anuncios/historico.md`.

**Critério de pronto:** campanha ativa com verba de teste · eventos chegando · primeira leitura da régua agendada (fim da semana 1) com corte e escala definidos por subperfil.

---

## Tabela-resumo

| Fase | Entregável | Quem faz | Critério de pronto |
|---|---|---|---|
| **0, Estrutura** | `PERFIL.md`, `.env`, acessos | você e `meta-app-e-acessos` | acesso confirmado pelo script |
| **1, Entrevista** | Dossiê do negócio | você e o Claude | 4 blocos, hipótese de gargalo, lista de `[A CONFIRMAR]` |
| **2, Pré-voo** | Dossiê dos 7 pilares | esta skill e `niveis-de-consciencia` | jornada com consciência, ângulo, mecanismo, objetivo, filtro, KPI |
| **3, Lastro** | Filtro, destino vivo, pixel, prova | `whatsapp-sales-process`, `meta-ads-expert`, `analisador-criativos` | filtro testado, destino vivo, pixel disparando |
| **4, Plano de mídia** | Objetivo, públicos, divisão, criativo | esta skill e `analisador-criativos` | objetivo certo, verba separada, criativo que filtra |
| **5, Gate** | Veredito | esta skill | checklist crítico ok e o seu OK |
| **6, Subir** | Campanha ativa e régua da semana 1 | `meta-ads-subir-anuncio`, `doutrina-trafego` | verba de teste, eventos chegando, leitura agendada |

---

## Erros clássicos a evitar

1. **Subir sem pré-voo.** "Vamos subir logo para testar" é o pecado original.
2. **Objetivo que otimiza volume, não intenção.** Escolha o objetivo pelo KPI real, não pelo número mais fácil de inflar.
3. **Público amplo e frio com criativo de oferta.** Público frio é inconsciente: a copy começa na dor, não no preço.
4. **Zero filtro na porta.** Sem porteiro, todo curioso vira "lead".
5. **Destino morto.** Perfil, página e WhatsApp têm que estar vivos ANTES do clique.
6. **Verba única cega, sem medir por subperfil.** Verba agregada esconde o vencedor.
7. **Inventar número para "fechar" o plano.** CAC, margem ou verba chutados dão um READY falso.
8. **Ignorar o modo do app.** Campanha com app em Desenvolvimento não entrega.

## Os 3 não-negociáveis antes de gastar o primeiro real

1. **Jornada mapeada e objetivo de campanha certo.** Você sabe qual subperfil, em que nível de consciência, com qual ângulo, e o objetivo puxa intenção, não volume vazio.
2. **Filtro na porta ativo e destino vivo.** Existe um porteiro que qualifica quem chega, e o lugar onde o clique cai está vivo, rastreado e apresentável.
3. **Rastreio montado e veredito READY com dado real.** Pixel disparando, verba e CAC-alvo `[confirmados]`, e o gate emitiu **READY** com o seu OK explícito.
