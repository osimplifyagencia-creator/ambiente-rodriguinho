---
name: arquiteto-de-funis
description: "Desenha o funil de vendas, pós-venda, remarketing e a ligação entre as etapas, para qualquer CRM ou planilha. Use quando: \"monta meu funil\", \"o que fazer depois da venda\". Não é: script de mensagem (whatsapp-sales-process) nem auditoria do que já existe (raio-x-comercial)."
---

# Arquiteto de Funis

Arquiteto do sistema de receita da sua empresa. Recebe o contexto do negócio e entrega a estrutura completa: captação, pós-venda, automações, tags, campos, pontuação e passagem entre robô e pessoa. Tudo pronto para implementar em qualquer CRM, ferramenta de automação ou até planilha. Inclui funil de pós-venda de verdade (Bowtie), tags, pontuação, handoff e embasamento em frameworks.

## Princípio norteador

Um sistema de receita só vale se existir na prática. Cada estágio (de captação **ou** de pós-venda) deve responder a cinco perguntas:

- **O que acontece** (evento real, não abstração)
- **Quem executa** (recepção, comercial, sistema, assistente automático, o próprio cliente)
- **Como transita** (critério de saída objetivo)
- **Follow-up automático** (ferramenta) e **manual** (pessoa)
- **Campo ou tag de CRM atualizado** (para métrica, não enfeite)

Se um estágio não responde a todas, ele é decorativo: remova.

## Princípio de neutralidade de ferramenta

O sistema é uma **estrutura lógica**, não uma implementação numa ferramenta específica. Toda entrega funciona em qualquer CRM e em qualquer ferramenta de automação.

- Gatilhos são **eventos lógicos** ("lead criado", "estágio mudou para Agendado"), não nomes de botão de uma ferramenta.
- Ações são **intenções** ("enviar WhatsApp de boas-vindas", "criar tarefa com prazo de 5 min").
- Ao exemplificar implementação, dê **dois caminhos** ou pseudocódigo.
- Se você já informou qual ferramenta usa, adapte o vocabulário dos exemplos. Se não, mantenha neutro e ofereça no fim: "Posso adaptar para HubSpot, Pipedrive, RD Station ou planilha: qual você usa?"
- Nunca force uma ferramenta. A estrutura é transferível.

---

## Passo 0: escolher o framework (sempre)

Antes de escrever qualquer funil, decida a base metodológica. **Leia `references/frameworks.md`** (seção "Como escolher"). Combinação padrão:

- **Marketing:** See-Think-Do-Care (intenção).
- **Captação:** Funil em Y se houver anúncio (inbound) e prospecção ativa (outbound); senão, linear.
- **Comercial:** Lifecycle Stages mais qualificação (BANT para serviço local de ciclo curto; CHAMP ou GPCTBA para venda consultiva; MEDDIC ou MEDDPICC para B2B de ticket alto).
- **Pós-venda:** Bowtie (lado direito do laço) mais plays de sucesso do cliente.
- **Diagnóstico:** AARRR como raio-x ("onde esse negócio vaza?"). A inspeção completa é da skill `raio-x-comercial`.
- **Mensagem por estágio:** os 5 níveis de consciência de Eugene Schwartz (skill `niveis-de-consciencia`). Cada estágio do funil corresponde a um estado mental do lead. Topo (Novo e Em Conversa) = inconsciente ou consciente do problema; meio (Qualificado e Proposta) = consciente da solução ou do produto; fundo (Negociação e Fechamento) = totalmente consciente. Isso governa **o que** cada mensagem automática diz, e é o que a `whatsapp-sales-process` consome para escrever o texto.

Deixe explícito na entrega qual framework embasa cada decisão.

---

## 3 modos de operação

Detecte pelo tipo de input.

### Modo A: contexto colado
Você cola informação sobre o negócio. Extraia automaticamente: nicho, ticket, serviços, volume de leads, canais, ferramentas atuais, se tem robô ou assistente automático, recorrência, objetivo principal. Depois pergunte SÓ o que faltar.

### Modo B: entrevista
Você pede "monta meu funil" sem contexto. Rode as perguntas em **3 blocos compactos** (não uma a uma):

- **Bloco 1, negócio:** nicho, serviços, ticket médio, ciclo de venda, recorrência (venda única ou recorrente?), capacidade versus meta.
- **Bloco 2, funil atual:** origem dos leads, volume por mês, conversão atual, principal gargalo, o que já existe de processo e de pós-venda.
- **Bloco 3, ferramentas e intenção:** CRM, ferramenta de automação, WhatsApp, **tem assistente automático (robô)?**, equipe comercial ou só você e a recepção, objetivo número 1 (mais leads, converter melhor, reter, reativar, vender mais para quem já comprou, reduzir falta).

### Modo C: ler o perfil
Leia `empresa/PERFIL.md` e extraia tudo que já estiver lá (o que vende, para quem, canais, equipe, ferramentas). Pergunte só o que faltar. Este é o modo padrão quando o perfil já está preenchido.

---

## Inputs mínimos obrigatórios

| Input | Por quê | Se faltar |
|---|---|---|
| Nicho | Define jornada e gatilhos (`references/niche-playbooks.md`) | Perguntar |
| Serviços ou produtos | Define portas de entrada e venda adicional | Perguntar |
| Ticket médio | Define agressividade do follow-up e ciclo de nutrição | Perguntar |
| **Recorrência (venda única ou recorrente)** | Define se o funil de pós-venda é obrigatório | Perguntar |
| Ciclo de venda (dias) | Define o tempo dos D+N | Estimar pelo nicho e avisar |
| Canais de captação | Define o topo do funil e se usa funil em Y | Perguntar |
| **Tem robô ou assistente automático?** | Define se o handoff é obrigatório | Perguntar |
| Objetivo número 1 | Define qual funil priorizar | Perguntar |

Secundários (extraia sem bloquear): volume por mês, conversão atual, ferramentas, tamanho da base.

**Regra do placeholder:** dado não confirmado entra como `[INSERIR: CAMPO]`. NUNCA invente número.

---

## Entregáveis

Gere em `vendas/funil/` (ou onde você indicar). **Não gere tudo sempre**: gere o que o objetivo e o tipo de negócio pedem.

### Núcleo (quase sempre)

**1. `funil-vendas.md`: pipeline de captação (independe do CRM)**
1. Visão geral: tabela de pipelines, objetivo, público, ciclo.
2. Para cada pipeline: objetivo e estágios em sequência (o que acontece, follow-up automático, follow-up manual, critério de saída).
3. Matriz de transições (diagrama em texto).
4. Notas estratégicas: porta de entrada versus venda adicional, LTV, lembretes do nicho.
5. Métricas: situação atual versus meta (`[INSERIR]` se não souber).

Leia `references/stage-patterns.md` (Famílias 1, 3 e 4). Topo em Y quando houver inbound e outbound (veja `frameworks.md`).

**2. `funil-posvenda.md`: retenção, expansão e perda** *(obrigatório se o serviço é recorrente)*
Estágios: Onboarding, Ativação ou primeiro valor, Adoção ou recorrência, Expansão, Indicação, mais a trilha de risco (Em Risco, Inativo, Recuperação, Perdido). Inclua as plays de sucesso do cliente e a nota de saúde.
Leia `references/post-sales-playbooks.md`.

**3. `automacoes.md`: mapa de automações (neutro)**
Tabela: `Evento (gatilho lógico) | Ação | Quando | Canal | Responsável`. Para cada automação crítica, **pseudocódigo neutro** mais nota da ferramenta, se informada. Inclua os gatilhos de **handoff** como automações.
Leia `references/automation-library.md`. Se você não tem ferramenta de automação, a mesma tabela vira rotina manual: tarefa recorrente, lembrete no celular ou planilha com data de retorno.

**4. `tags-e-campos.md`: tags, campos e pontuação**
Tabela de tags (por categoria, com nomenclatura), tabela de campos por pipeline, modelo de pontuação de lead, de encaixe e de saúde do cliente, e a separação entre Lifecycle Stage e Lead Status.
Leia `references/tags-and-fields.md`.

**5. `handoff.md`: protocolo robô para pessoa** *(obrigatório se há robô ou assistente automático)*
Gatilhos de escalonamento, resumo de contexto que acompanha, prazo de resposta, roteamento, devolução e erros comuns.
Leia `references/handoff-protocol.md`.

### Sob demanda (quando o objetivo pede)

**6. `funil-marketing.md`:** topo, meio e fundo via See-Think-Do-Care: canais e ângulos por intenção, iscas, jornada do lead (ponto de contato, canal, tempo, ação) e indicadores (custo por lead, taxa de clique, de lead para oportunidade, retorno).

**7. `scripts-por-etapa.md`:** scripts de WhatsApp ou ligação por estágio crítico (abertura, qualificação, apresentação, fechamento, follow-up D+1, D+3 e D+7, as 5 objeções mais comuns). Tom humano, UMA pergunta por vez, no máximo 5 linhas por mensagem. **Se o pedido for um processo completo de WhatsApp, PARE e use `whatsapp-sales-process`; se for reunião de venda, `call-de-vendas`.**

---

## Regras inegociáveis

### Sempre
- **Embasar em framework.** Toda escolha de estágio ou de tempo referencia a lógica de `frameworks.md`. Nada de achismo.
- **Pós-venda quando há recorrência.** Se o serviço é recorrente e você só entregou captação, entregou metade. Bowtie não é opcional.
- **Handoff quando há robô.** Sem protocolo de passagem, o robô segura demais ou passa sem contexto. Veja `handoff-protocol.md`.
- **Tom humano.** Atendente, não vendedor agressivo. Os scripts soam como pessoa.
- **Uma pergunta por vez** nos scripts de WhatsApp.
- **Tempo explícito.** Sempre `D+0`, `D-2`, `2h antes`. Nunca "depois de um tempo".
- **Critério de saída objetivo.** "Cliente confirmou" é objetivo; "demonstrou interesse" NÃO é.
- **Follow-up até a última chance.** Cada funil tem estágio "Perdido" ou "Cancelado" com reativação agendada (captação em D+90; retenção em D+60).
- **Venda adicional como estágio ou ação explícita.** A margem real mora em vender de novo para quem já comprou; não deixe só na intenção.
- **Camadas de metadado separadas.** Tag, estágio, lifecycle stage, lead status e campo são coisas diferentes. Veja `tags-and-fields.md`.
- **Estágio carrega nível de consciência.** Anote a que nível de consciência do lead cada estágio corresponde (skill `niveis-de-consciencia`): orienta a mensagem automática e evita "vender" cedo demais. Considere um campo ou tag `nivel_consciencia` quando a mensagem depender disso (por exemplo, nutrição de base fria).
- **Português claro nos estágios visíveis.** "Novo Lead", "Qualificação", "Agendado". Guarde MQL e SQL para o `funil-marketing`.
- **Consistência com a ferramenta que você usa.** Adapte o vocabulário se informado; senão, neutro e pergunte.

### Nunca
- Inventar número (use `[INSERIR: CAMPO]`).
- Copiar estágios de um nicho para outro sem adaptar ciclo e gatilhos.
- Propor automação que exija sistema que você não tem.
- Criar estágio sem critério de saída (gera lead preso e mata a métrica).
- Criar tag ou campo sem um "para quê" (vira lixo no relatório).
- Usar tag como se fosse estágio (estágio é exclusivo; tag é cumulativa).
- Gerar script com mais de 5 linhas por mensagem de WhatsApp.
- Criar estágios decorativos ("Interesse manifestado", "Em análise") sem ação clara.
- Usar emoji em excesso (no máximo 1 ou 2 por mensagem).
- Mandar mensagem a quem não deu consentimento para receber (LGPD), especialmente em base importada.

---

## Adaptação por nicho

Consulte `references/niche-playbooks.md` para ciclo típico, estágios comuns, indicadores, tom e gatilhos éticos. Nichos cobertos: saúde, estética, fitness, software para empresas, jurídico e contábil, educação, varejo e móveis, alimentação e delivery, atendimento em domicílio (quem decide não é quem usa) e imobiliária. Nicho fora da lista: pergunte 3 coisas (ciclo típico, quem decide a compra, serviço recorrente ou venda única).

---

## Fluxo de execução

1. **Detectar o modo** (A, B ou C) e coletar os inputs.
2. **Validar os inputs mínimos.** Faltou algo? Pergunte em bloco, sem paralisar.
3. **Passo 0: escolher o framework** (`references/frameworks.md`).
4. **Carregar o nicho** (`references/niche-playbooks.md`).
5. **Gerar `funil-vendas.md`** (a espinha dorsal).
6. **Gerar `funil-posvenda.md`** se for recorrente.
7. **Derivar os demais** (automações, tags e campos, handoff e, sob demanda, marketing e scripts). Cada um referencia os estágios já definidos.
8. **Entregar a lista de arquivos** e propor o próximo passo: montar a ferramenta com o que foi desenhado, ou passar o script de cada etapa para `whatsapp-sales-process`.

---

## Fronteira com outras skills

| Pedido | Skill |
|---|---|
| "Cria o funil, o pós-venda, o pipeline ou a jornada" | **arquiteto-de-funis** |
| "Estrutura as tags e os campos do CRM" | **arquiteto-de-funis** |
| "Monta a passagem do robô para a pessoa" | **arquiteto-de-funis** |
| "Processo comercial e cadência de WhatsApp" | **whatsapp-sales-process** |
| "Só o script de resposta a uma conversa" | **copiloto-whatsapp** |
| "Preparar ou revisar uma reunião de venda" | **call-de-vendas** |
| "Onde o que eu já tenho está vazando?" | **raio-x-comercial** |
| "Qual ângulo ou mensagem por estágio? Em que nível o lead está?" | **niveis-de-consciencia** (doutrina), depois **whatsapp-sales-process** (texto) |
| "Preço, desconto, objeção de preço" | **escada-negociacao** |
| "Caixa, margem, quanto posso gastar para captar" | **doutrina-financas** |

Se o pedido cabe em duas skills, execute a que cobre MAIS do escopo e cite a outra no fim.

---

## Referências internas

- `references/frameworks.md`: fundamentos (Bowtie, AARRR, See-Think-Do-Care, Lifecycle Stages, Funil em Y, qualificação) e onde aprender mais.
- `references/niche-playbooks.md`: padrões de funil por nicho.
- `references/stage-patterns.md`: modelos de estágio (captação).
- `references/post-sales-playbooks.md`: estágios e plays de pós-venda (Bowtie).
- `references/automation-library.md`: automações por objetivo (neutras).
- `references/handoff-protocol.md`: passagem de bastão robô para pessoa.
- `references/tags-and-fields.md`: tags, campos, pontuação, lifecycle stage versus lead status.
