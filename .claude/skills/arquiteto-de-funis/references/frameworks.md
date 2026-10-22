# Frameworks: Fundamentos de arquitetura de funil

Base metodológica para desenhar funis de **vendas** e **pós-venda** com lógica testada, não achismo. Cada framework resolve um problema diferente: a competência está em escolher o certo e combinar.

> **Como usar:** leia "Como escolher o framework" primeiro. Carregue só a seção do framework que o caso pede. Frameworks são lentes, não dogmas: adapte ao nicho, ticket e ciclo do cliente. Quando montar o funil, deixe explícito qual framework está embasando cada decisão (isso vira argumento de venda na entrega ao cliente).

## Índice
1. Como escolher o framework
2. Bowtie / Revenue Architecture: ciclo de vida completo + pós-venda
3. AARRR (Pirate Metrics): métricas de crescimento
4. See-Think-Do-Care: intenção no funil de marketing
5. Lifecycle Stages: taxonomia de estágios de CRM
6. Funil de Vendas em Y: inbound + outbound integrados
7. Frameworks de qualificação: BANT, MEDDIC/MEDDPICC, CHAMP, GPCTBA/C&I, SPIN
8. AIDA: base clássica (e por que está datada)
9. Onde aprender mais: fontes canônicas

---

## 1. Como escolher o framework

Não existe framework universal. Escolha pela combinação **objetivo × ticket × ciclo × recorrência**.

| Situação do cliente | Framework base | Por quê |
|---|---|---|
| Negócio recorrente (clínica, academia, estética, SaaS, contábil) | **Bowtie** | "Venda fechada" é o meio do jogo, não o fim. O LTV mora na direita do laço. |
| Produto/app digital, foco em ativação e retenção por uso | **AARRR** | Lente de métricas por etapa do ciclo; acha o gargalo mais apertado. |
| Estruturar marketing/conteúdo por intenção | **See-Think-Do-Care** | Segmenta por intenção real, não por demografia. Substitui o AIDA. |
| Padronizar estágios e relatórios no CRM | **Lifecycle Stages** | Taxonomia macro de jornada + separação estágio vs. atividade. |
| Captação com inbound **e** outbound rodando juntos | **Funil em Y** | Integra as duas fontes num só CRM e migra leads entre fluxos sem desperdício. |
| Qualificar lead antes de gastar tempo comercial | **BANT / MEDDIC / CHAMP / GPCTBA** | Define o que precisa ser verdade para o lead virar oportunidade. |

**Regra de combinação (o caso comum):**
- **Marketing** → See-Think-Do-Care para mapear conteúdo e canais por intenção.
- **Captação** → Funil em Y se houver inbound + outbound; senão funil linear.
- **Comercial** → estágios via Lifecycle Stages + qualificação (BANT para serviço local de ciclo curto; MEDDIC/CHAMP para B2B/ticket alto).
- **Pós-venda** → Bowtie (direita do laço) + plays de Customer Success (ver `post-sales-playbooks.md`).
- **Métrica de saúde do todo** → AARRR como dashboard mental (onde o negócio está vazando?).

---

## 2. Bowtie / Revenue Architecture (Winning by Design)

Criado por Jacco van der Kooij (Winning by Design), a partir de trabalho com mais de mil empresas de receita recorrente. É **o framework de referência quando existe pós-venda**.

**A ideia central:** o funil tradicional termina no "fechado-ganho". O Bowtie mostra que isso é só o **meio** da jornada: o ponto de "compromisso mútuo" (mutual commit). A receita de verdade, em negócio recorrente, vem do que acontece **depois**.

**Formato:** dois triângulos espelhados formando um laço (gravata-borboleta):

```
   ESQUERDA (aquisição)              meio              DIREITA (impacto recorrente)
Awareness → Education → Selection → COMMIT → Onboarding → Adoption → Expansion (Advocacy)
 (atração)  (educação)  (seleção)  (fechou)  (ativação)   (uso/recompra)  (upsell + indicação)
```

**Por que importa:**
- Quase todo cliente nosso é recorrente (clínica vive de retorno, estética de recompra, academia de mensalidade, contábil de honorário, SaaS de assinatura). Estruturar só a esquerda do laço é resolver a equação errada.
- A direita do laço vira o **funil de pós-venda** (entregável próprio). Ver `post-sales-playbooks.md`.

**Métricas-chave da direita do laço:**
- **NRR (Net Revenue Retention):** receita retida + expandida da base, líquida de churn. >100% = a base cresce sozinha.
- **LTV / CLV:** valor total do cliente ao longo da relação. Em serviço recorrente, é a métrica que justifica o CAC.
- **Churn:** taxa de perda. O vilão de fitness, estética e SaaS.
- **Taxa de expansão (cross-sell/upsell):** margem real costuma estar aqui, não na porta de entrada.

---

## 3. AARRR: Pirate Metrics (Dave McClure)

Criado por Dave McClure (500 Startups, ~2007). É uma **lente de métricas** que quebra o ciclo do cliente em cinco estágios, cada um com um punhado de indicadores. Funciona em B2C, B2B, produto digital e e-commerce: desde que cada estágio seja definido concretamente para o negócio.

| Estágio | Pergunta | Exemplos de métrica |
|---|---|---|
| **Acquisition** | Como o lead chega? | CPL, CAC, CTR, tráfego por canal |
| **Activation** | Ele teve a primeira experiência de valor? | % que completa ação-chave, time-to-value |
| **Retention** | Ele volta? | recompra 30/60/90d, frequência, churn |
| **Referral** | Ele indica? | NPS, taxa de indicação, viralidade |
| **Revenue** | Ele paga (e paga mais)? | ticket médio, ARPU, expansão |

**Princípio operacional:** não tente otimizar tudo. **Conserte primeiro o gargalo mais apertado**: quase sempre é ativação ou retenção precoce, não aquisição. Comprar mais tráfego para um funil que vaza na ativação é jogar dinheiro fora.

**Uso:** AARRR é o "raio-x" para diagnóstico. Antes de propor automações, pergunte: onde o seu negócio está vazando? (A inspeção completa está na skill `raio-x-comercial`.) Se a conversão lead→agendamento está em 5% (benchmark saúde é 15-25%), o problema é ativação, não aquisição: e a automação certa é resposta em <5min, não mais anúncio.

---

## 4. See-Think-Do-Care (Avinash Kaushik, Google, 2013)

Substituto moderno do AIDA. Segmenta o público por **intenção real** (comportamento), não por demografia. Pensado para marketing multicanal.

| Estágio | Quem é | Intenção comercial | Conteúdo certo |
|---|---|---|---|
| **See** | Maior público qualificável | Nenhuma | Topo: alcance, marca, conteúdo amplo |
| **Think** | Quem está considerando | Começando | Meio: educação, comparativos, autoridade |
| **Do** | Quem está pronto pra comprar | Alta | Fundo: oferta, prova, CTA direto |
| **Care** | Quem já comprou (2+ vezes) | Cliente | Relacionamento, suporte, recompra |

**Por que supera o AIDA:** o AIDA é linear, unidirecional e ignora o pós-compra. O STDC trata a jornada como ciclo e dá ao "Care" (cliente existente) o mesmo peso: alinhado com a lógica do Bowtie. Pesquisa clássica (Bain) mostra que +5% de retenção pode significar +25-95% de lucro.

**Uso:** é a espinha do `funil-marketing.md`. Mapeie canal e ângulo de copy por estágio de intenção. Não use a mesma mensagem para See e Do.

---

## 5. Lifecycle Stages (modelo HubSpot, aplicável a qualquer CRM)

Taxonomia macro da jornada, usada para padronizar estágios e relatórios. Estágios padrão: **Subscriber → Lead → MQL → SQL → Opportunity → Customer → Evangelist** (+ "Other" para contatos não-vendáveis).

**A distinção que quase todo mundo erra (e que vale ouro):**
- **Lifecycle Stage = marco macro.** Muda raramente e sempre avança (Lead vira Customer, não volta). Atravessa marketing, vendas e pós-venda.
- **Lead Status = atividade micro/tática** dentro de um estágio (ex.: "Tentando contato", "Sem resposta", "Negociando"). É o dia a dia do vendedor, vive dentro do SQL.
- **Nunca misture os dois.** Estágio é onde o lead está na jornada; status é o que o vendedor fez hoje.

**Boas práticas comprovadas:**
- "Customer" **não** é o fim. Adicione estágios de pós-venda ("Pronto pra Upsell", "Em Risco de Churn"): em recorrente, expansão + renovação podem ser 40%+ da receita.
- Benchmark de saúde do funil: **SQL → Opportunity ~20%.** Abaixo disso, a definição de SQL está frouxa: aperte Autoridade ou Timing.
- **Contatos não-vendáveis** (fornecedor, imprensa, concorrente, parceiro) vão para "Other" + uma **tag** secundária. Isso impede que poluam a métrica do funil.
- **Auditoria 30-60-90** no primeiro ano: dias 1-30 higiene de dados, 31-60 revisão de definições e limiares, 61-90 auditoria de automações. A higiene de dados decai continuamente.

**Uso:** o Lifecycle Stage informa a nomenclatura macro; no funil que a equipe vê, traduza para português claro ("Novo Lead", "Qualificação", "Agendado") e guarde MQL/SQL para o `funil-marketing`. Ver `tags-and-fields.md` para estágio vs. tag vs. campo.

---

## 6. Funil de Vendas em Y (RD Station / Reev / mercado BR)

Evolução do funil tradicional, popularizada no Brasil. Tem **duas entradas** de leads (formato de Y): um braço inbound, um braço outbound, convergindo num funil comercial único.

**O diferencial não é só somar volume: é integrar:**
- Lead inbound que não engaja na nutrição → migra para outbound (abordagem ativa).
- Lead outbound sem timing de compra → entra em nutrição inbound até amadurecer.
- Resultado: **menos desperdício de base** ("oportunidades escondidas") e gestão num só CRM.

**Pré-requisitos para funcionar:**
- **SLA formal entre marketing e vendas:** volume, qualidade e tempo de resposta acordados.
- **ICP claro** e lead scoring para decidir maturidade.
- Reuniões de alinhamento e dashboards compartilhados.

**Funciona em B2C?** Sim, em nichos de ticket médio/alto e venda consultiva: saúde, educação, finanças, serviços personalizados, imobiliário. Para quem roda anúncio (inbound) **e** prospecção/indicação (outbound), o Y é o modelo de captação correto.

**Uso:** quando você tem as duas fontes, o `funil-vendas.md` deve ter o topo em Y (dois braços de origem → convergência em "Qualificação"). Marque a origem com **campo** "Origem" + **tag** de canal.

---

## 7. Frameworks de qualificação

Definem **o que precisa ser verdade** para um lead virar oportunidade. Princípio universal: **o rigor da aplicação importa mais que a escolha do framework**: um time que aplica BANT com evidência real bate um time que usa MEDDPICC como checklist. E: **aumente o nível de exigência conforme o custo da interação sobe** (SDR usa qualificação leve; vendedor sênior/AE usa qualificação profunda antes de "botar a bota no chão").

| Framework | Sigla | Quando usar |
|---|---|---|
| **BANT** | Budget, Authority, Need, Timing | Ciclo curto, ticket baixo, 1-2 decisores. Triagem rápida de SDR. Origem IBM. |
| **MEDDIC** | Metrics, Economic buyer, Decision criteria, Decision process, Identify pain, Champion | Mid-market, 3-5 stakeholders, ciclo <90d. Qualifica se vale estar no deal e se está ganhando. |
| **MEDDPICC** | MEDDIC + Paper process + Competition | Enterprise complexo, 5+ stakeholders, compra formal/procurement. |
| **CHAMP** | Challenges, Authority, Money, Prioritization | Venda consultiva que começa pelo problema do cliente (não pelo budget). |
| **GPCTBA/C&I** | Goals, Plans, Challenges, Timeline, Budget, Authority / Consequences, Implications | Framework da HubSpot. Inbound consultivo: parte das metas do cliente e volta. |
| **SPIN** | Situation, Problem, Implication, Need-payoff | Técnica de **descoberta** por perguntas (Neil Rackham). Combina com MEDDIC (SPIN descobre, MEDDIC qualifica). |

Variações de nicho: **ANUM** (outbound, acha o decisor primeiro), **NEAT**, **FAINT**, **SPICED** (mid-market SaaS, foca impacto e evento crítico).

**Uso:**
- Serviço local de ciclo curto (estética, alimentação, varejo rápido) → **BANT leve** ou só Need + Timing.
- Saúde, contábil, educação, imobiliário, móveis planejados → **CHAMP** ou **GPCTBA** (consultivo).
- SaaS B2B → **MEDDIC** (mid) ou **MEDDPICC** (enterprise).
- Os campos de qualificação viram **campos personalizados** no CRM e alimentam o **lead score**. Ver `tags-and-fields.md`.

---

## 8. AIDA: base clássica (e por que está datada)

**A**ttention → **I**nterest → **D**esire → **A**ction. Datado de ~1898-1911. É a raiz histórica de todo funil.

**Por que conhecer:** é o vocabulário comum de quem nunca estudou funil moderno; serve de ponte didática com cliente leigo.

**Por que não usar como base:** é linear, unidirecional ("megafone" pré-internet), ignora completamente o pós-venda e parte de silos de marketing. Para qualquer cliente recorrente, o AIDA leva a subinvestir na direita do laço. Prefira See-Think-Do-Care (intenção) + Bowtie (ciclo completo).

---

## 9. Onde aprender mais: fontes canônicas

Curadoria das melhores fontes para aprofundar arquitetura de funil, neste estilo. Priorize as marcadas com ★.

### Livros (os definitivos)
- ★ **Predictable Revenue**: Aaron Ross & Marylou Tyler. Especialização de papéis (SDR/closer), cold outbound previsível. Versão BR: "Receita Previsível".
- ★ **Revenue Architecture / The SaaS Sales Method**: Jacco van der Kooij (Winning by Design). Origem do Bowtie.
- ★ **SPIN Selling**: Neil Rackham. A pesquisa por trás de venda consultiva.
- **The Sales Acceleration Formula**: Mark Roberge (ex-HubSpot). Funil orientado a dados.
- **Gap Selling**: Keenan. Vender o gap entre estado atual e desejado.
- **Hacking Growth**: Sean Ellis & Morgan Brown. Growth + AARRR na prática.
- **Lean Analytics**: Croll & Yoskovitz. Métricas que importam por estágio.
- **Obviously Awesome**: April Dunford. Posicionamento (afeta topo de funil).
- **Never Lose a Customer Again**: Joey Coleman. Onboarding e primeiros 100 dias (pós-venda).
- **Customer Success**: Nick Mehta / Gainsight. A bíblia de CS.

### Comunidades, cursos e blogs (internacional)
- ★ **Winning by Design** (winningbydesign.com / Revenue Academy): Bowtie, RevOps, modelos de receita.
- ★ **HubSpot Academy**: gratuito, excelente para lifecycle stages, inbound, CRM.
- **Reforge**: growth, retenção, PLG (avançado, pago).
- **Pavilion**: comunidade de RevOps e líderes de receita.
- **Sales Hacker / GTMnow**: táticas de vendas B2B atuais.
- **Lenny's Newsletter**: growth, PLG, retenção.
- **Gainsight / Planhat (blogs)**: Customer Success, health score, NRR.
- **Amplitude / Mixpanel (blogs)**: ativação e retenção por dados.
- **CXL**: conversão e experimentação (CRO).
- **Demand Curve**: growth marketing.
- ★ **Occam's Razor (kaushik.net)**: Avinash Kaushik, origem do See-Think-Do-Care e analytics.

### Brasil (ler para tom, ciclo e mercado local)
- ★ **RD Station** (blog + RD University + RD Summit): inbound, funil em Y, automação.
- ★ **Reev (reev.co)**: outbound, cadência, funil em Y.
- ★ **Meetime**: pré-vendas/Inside Sales, podcast "Casts for Closers".
- **Outbound Marketing / Ramper**: prospecção e cadência.
- **Growth Machine / Thiago Reis**: vendas consultivas BR.
- **Resultados Digitais / Sales Hackers Brasil**: conteúdo de funil e processo.

### Para o atendimento por WhatsApp
Não há fonte acadêmica canônica única para funil em WhatsApp; combine os princípios acima com conversational commerce. Os frameworks de qualificação (BANT/CHAMP) e o Bowtie se aplicam diretamente: a diferença é o canal (assíncrono, 1:1, alta intimidade), não a lógica. Ver `niche-playbooks.md` para tom por nicho e `handoff-protocol.md` para a passagem IA→humano.
