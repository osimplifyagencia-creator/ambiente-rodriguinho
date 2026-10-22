# Tags & Fields: Tags, campos personalizados e taxonomia de CRM

Como estruturar os metadados do CRM sem virar bagunça. A diferença entre tag, campo, estágio, lifecycle stage e lead status: e quando usar cada um.

> **Como usar:** gere o `vendas/funil/tags-e-campos.md` a partir daqui. Regra-mãe: **cada tag/campo precisa de um "pra quê"** (alimenta métrica, automação ou segmentação). O que não serve pra nada não entra: vira lixo de dashboard.

## Índice
1. As cinco camadas de metadado (e quando usar cada uma)
2. Taxonomia de tags
3. Campos personalizados por pipeline
4. Scoring: lead score, fit score, health score
5. Lifecycle Stage vs. Lead Status
6. Higiene e governança
7. Notas por CRM

---

## 1. As cinco camadas de metadado

Cinco coisas diferentes que costumam ser confundidas. Usar a camada errada é a fonte nº1 de CRM bagunçado.

| Camada | O que é | Muda quando | Exemplo |
|---|---|---|---|
| **Estágio (pipeline)** | Onde o lead está no funil específico | Avança/regride no processo | "Agendado", "Proposta" |
| **Lifecycle Stage** | Marco macro da jornada (atravessa todos os funis) | Raramente, sempre avança | Lead → Customer |
| **Lead Status** | Atividade tática do vendedor dentro de um estágio | No dia a dia | "Tentando contato", "Sem resposta" |
| **Campo personalizado** | Atributo estruturado do lead/contato | Quando o dado muda | "Orçamento: [VALOR]", "Serviço: Botox" |
| **Tag** | Marcador booleano/categórico, leve e múltiplo | Quando o marcador se aplica/sai | "Promotor", "Origem: Indicação", "Em atendimento humano" |

**Regra de decisão:**
- É **um lugar na jornada** que o lead ocupa por vez? → Estágio.
- É **um marco macro** que vale em qualquer funil? → Lifecycle Stage.
- É **o que o vendedor está fazendo agora** dentro do estágio? → Lead Status.
- É **um valor** que você vai filtrar, calcular ou usar em automação? → Campo.
- É **um rótulo** que pode coexistir com outros e liga/desliga? → Tag.

> Tag **não** substitui estágio. Se você está usando tags pra marcar onde o lead está no funil, está faltando estrutura de estágio. Estágio é exclusivo (um por vez); tag é cumulativa (várias ao mesmo tempo).

---

## 2. Taxonomia de tags

Tags servem para **segmentar, filtrar e disparar automação** sem inflar os estágios. Organize por categoria com prefixo para não virar sopa de letrinhas.

**Convenção de nomenclatura:** `categoria: valor` (ex.: `origem: indicação`). Prefixo facilita filtrar e evita duplicata.

| Categoria | Tags de exemplo | Pra quê |
|---|---|---|
| **Origem** | `origem: meta-ads`, `origem: google`, `origem: indicação`, `origem: orgânico` | Atribuir CPL/conversão por canal; alimentar funil em Y |
| **Comportamento** | `clicou-proposta`, `abriu-orçamento`, `respondeu-pesquisa`, `no-show` | Disparar follow-up contextual; lead scoring |
| **Segmento** | `segmento: premium`, `segmento: convênio`, `b2b`, `b2c` | Roteamento e oferta segmentada |
| **Ciclo de vida** | `cliente-novo`, `recorrente`, `inativo`, `ex-cliente` | Definir cadência e tom |
| **Campanha** | `campanha: black-friday`, `campanha: verão-2026` | Medir ROI por campanha; reativação sazonal |
| **Qualidade/risco** | `alto-fit`, `baixo-fit`, `risco-churn`, `promotor` | Priorização e plays de pós-venda |
| **Estado operacional** | `em-atendimento-humano`, `aguardando-doc`, `opt-out` | Pausar/ativar automação; respeitar LGPD |

**Tags críticas para o stack com agente de IA:**
- `em-atendimento-humano` → pausa follow-ups automáticos (ver `handoff-protocol.md`).
- `opt-out` / `sem-consentimento` → bloqueia qualquer campanha (LGPD).
- `risco-churn` → entra na watchlist e dispara play de retenção.

---

## 3. Campos personalizados por pipeline

Campos guardam **valores estruturados** que alimentam métrica e automação. Tabela por pipeline.

### Funil de captação (vendas)
| Campo | Tipo | Obrigatório em | Opções/formato | Quem preenche |
|---|---|---|---|---|
| Origem | select | Novo Lead | Meta / Google / Indicação / Orgânico / Outbound | Automação (UTM) |
| Serviço de Interesse | select | Qualificação | (lista do cliente) | Atendente/IA |
| Orçamento Declarado | número/faixa | Qualificação | R$ | Atendente/IA |
| Urgência | select | Qualificação | Imediata / 30d / 90d / Sem prazo | Atendente/IA |
| Lead Score | número | (auto) | 0-100 | Automação |
| Data de Criação | data | Novo Lead | auto | Sistema |
| Data de Agendamento | data | Agendado |: | Atendente/IA |
| Compareceu? | bool | Comparecimento | Sim/Não | Recepção |
| Motivo de Não-Conversão | select | Fechado-Perdido | Preço / Horário / Convênio / Sem resposta / Outra empresa / Sem urgência / Fora do ICP / Outro | Atendente |

### Funil de pós-venda
| Campo | Tipo | Obrigatório em | Opções/formato | Quem preenche |
|---|---|---|---|---|
| Data de Início | data | Onboarding |: | Sistema |
| Próximo Evento Recomendado | data | Adoção |: | Profissional/IA |
| Health Score | número | (auto) | 0-100 | Automação |
| Última Interação | data | (auto) |: | Sistema |
| Cross-sell Realizado? | bool | Expansão | Sim/Não | Atendente |
| Plano/Pacote Ativo | select | Adoção | (lista) | Atendente |
| NPS | número | pós-evento | 0-10 | Cliente |
| Motivo de Churn | select | Cancelado | Preço / Resultado / Mudança / Concorrente / Outro | Atendente |

**Regra:** campo que não alimenta métrica, automação ou relatório **não entra**. "Pra enfeite" é dívida técnica de CRM.

---

## 4. Scoring: lead score, fit score, health score

Três scores diferentes, em momentos diferentes do funil:

**Lead Score (no topo/qualificação): propensão a comprar.**
```
SCORE = 0
SE origem de alta conversão (ex.: indicação)   → +30
SE respondeu rápido / engajou                   → +20
SE orçamento ≥ ticket mínimo                    → +20
SE urgência declarada                           → +20
SE serviço de alta margem                       → +10
≥70 alto fit (comercial direto) | 40-69 médio (nutrir) | <40 baixo (nutrição longa)
```

**Fit Score (B2B): aderência ao ICP.** Usa os campos da qualificação (BANT/MEDDIC: ver `frameworks.md`): porte, segmento, autoridade, budget, timing.

**Health Score (pós-venda): risco de churn.** Combina sinais de uso/frequência/sentimento (ver `post-sales-playbooks.md`, seção 4).

Cada score é um **campo numérico** + dispara **tag** ao cruzar limiar (`alto-fit`, `risco-churn`). O score que não dispara ação é só número bonito.

---

## 5. Lifecycle Stage vs. Lead Status

A distinção que organiza relatório de funil (modelo HubSpot, aplicável a qualquer CRM):

- **Lifecycle Stage** = marco macro, **avança e raramente volta**. Subscriber → Lead → MQL → SQL → Opportunity → Customer → Evangelist. Atravessa marketing, vendas e pós-venda. Serve para medir vazamento entre fases macro e atribuir receita.
- **Lead Status** = atividade tática **dentro** de um estágio (vive no SQL): "Tentando contato", "Conectado", "Negociando", "Sem resposta". É o dia a dia do vendedor.

**Não conflar:** Lifecycle Stage responde "onde o lead está na jornada"; Lead Status responde "o que o vendedor fez hoje". Misturar quebra os relatórios.

**Tradução pro funil visível ao cliente:** use português claro nos estágios do pipeline ("Novo Lead", "Qualificação", "Agendado"); guarde MQL/SQL para o relatório de marketing. "Customer" não é o fim: adicione estágios de pós-venda.

---

## 6. Higiene e governança

- **Cada campo/tag tem dono e um "pra quê".** Sem isso, não cria.
- **Tag não vira estágio** e estágio não vira tag. Camadas separadas.
- **Contatos não-vendáveis** (fornecedor, parceiro, imprensa) → lifecycle "Other" + tag de tipo, pra não poluir a métrica do funil.
- **Auditoria 30-60-90** no 1º ano (depois semestral): higiene → definições/limiares → automações. Dado de CRM decai sozinho.
- **Máximo de tags úteis:** se ninguém filtra por uma tag há meses, arquive. Sopa de tags é tão ruim quanto não ter.
- **LGPD:** campo `opt_in`/tag `opt-out` obrigatórios para quem recebe campanha no Brasil.

---

## 7. Notas por CRM

A estrutura é transferível; o vocabulário muda. Adapte só se você já usa uma dessas ferramentas.

- **HubSpot:** Lifecycle Stage e Lead Status são propriedades nativas (use-as como são). Tags ≈ propriedades de checkbox/dropdown ou listas.
- **Pipedrive:** estágios por pipeline + campos customizados + labels (≈ tags). Sem lifecycle stage nativo: modelar via campo.
- **RD Station CRM:** estágios + campos + tags; integra com marketing para lead scoring nativo.
- **Planilha/Notion:** colunas viram campos; uma coluna "tags" multivalorada; estágio = coluna de status. Funciona bem para começar; a forma importa mais que a ferramenta.

Se você ainda não escolheu a ferramenta, entregue neutro e ofereça: "posso adaptar tags e campos para HubSpot, Pipedrive, RD Station ou planilha: qual você usa?"
