# Stage Patterns: Templates de estágio reutilizáveis

Estrutura testada para cada estágio do funil. Copiar, adaptar ao cliente, ajustar timing e copy.

> **Formato padrão de cada estágio:**
> ```
> ### Estágio N: [Nome]
> _[Descrição em 1 linha do que acontece]_
>
> **O que acontece:**
> - [evento concreto 1]
> - [evento concreto 2]
>
> **Follow-up automático (orquestrador):**
> - [timing]: [ação] via [canal]
>
> **Follow-up manual (pessoa):**
> - [quem] [faz o quê] em [quando]
>
> **Critério de saída:**
> - ✅ [condição positiva] → [próximo estágio]
> - ❌ [condição negativa] → [estágio alternativo]
> ```

---

## Família 1: Captação de leads (topo do pipeline comercial)

### Estágio: Novo Lead
_Lead acabou de entrar no sistema via qualquer canal de captação._

**O que acontece:**
- Lead criado automaticamente via webhook (formulário, Meta/Google Ads, WhatsApp, indicação)
- Campo "Origem" preenchido automaticamente pela URL/utm
- Responsável atribuído (round-robin ou regra de negócio)

**Follow-up automático (orquestrador):**
- 0min: Msg boas-vindas via WhatsApp ("Olá [NOME]! Recebemos seu contato...")
- 5min: Criar tarefa no CRM "Ligar/responder [NOME]"
- 30min (se não respondido): Notificar gestor comercial

**Follow-up manual:**
- Atendente responde em <5min (SLA crítico)
- Faz primeira qualificação (interesse, urgência)

**Critério de saída:**
- ✅ Lead respondeu → Qualificação
- ❌ Sem resposta em 3 dias úteis → Dormindo (reativação em D+7)

---

### Estágio: Qualificação
_Lead respondeu; atendente está coletando informações._

**O que acontece:**
- Atendente faz perguntas de qualificação (4-5 perguntas máx, UMA por vez)
- Preenche campos: serviço desejado, urgência, orçamento (se aplicável)

**Follow-up automático:**
- Se lead demora mais de 4h para responder a uma pergunta, lembrete educacional
- D+1 se inativo: mensagem suave
- D+3: segunda tentativa com oferta de informação
- D+7: última chance com CTA claro

**Follow-up manual:**
- Atendente conduz a conversa, respeita ritmo do cliente

**Critério de saída:**
- ✅ Lead qualificado (fit com ICP) → Agendado/Proposta
- ❌ Não qualificado (fora do ICP, sem budget, sem urgência) → Perdido com motivo

---

### Estágio: Agendado
_Evento agendado (consulta, demo, visita, avaliação)._

**O que acontece:**
- Data, hora e responsável confirmados
- Evento criado no calendário (Google/Cal.com)
- Campo "Data do Agendamento" preenchido

**Follow-up automático:**
- D-2: Lembrete "Sua [consulta/demo] é em [DIA] às [HORA]. Confirma? ✅"
- D-1: Segundo lembrete
- 2h antes: Lembrete final com endereço/link
- Se confirmou: status "Confirmado"; se não respondeu: ainda agendado mas marcar risco

**Follow-up manual:**
- Se cliente responde "preciso remarcar", abrir conversa e reagendar

**Critério de saída:**
- ✅ Cliente confirmou → Confirmado
- ✅ Cliente solicitou remarcação → volta para Agendado com nova data
- ❌ Sem resposta + não compareceu → No-Show (sequência de reativação)

---

### Estágio: Confirmado
_Cliente confirmou presença: alta probabilidade de comparecer._

**O que acontece:**
- Status muda para "Confirmado"
- Atendente/recepção sabe que pode esperar o cliente

**Follow-up automático:**
- 2h antes: lembrete final ("Estamos te esperando em [ENDEREÇO]")

**Critério de saída:**
- ✅ Compareceu → Comparecimento/Realizado
- ❌ Não compareceu → No-Show

---

### Estágio: Comparecimento / Evento Realizado
_Cliente passou pelo evento (consulta, demo, visita)._

**O que acontece:**
- Profissional/atendente atendeu
- Resultado registrado (prescrição, proposta, avaliação, diagnóstico)

**Follow-up automático:**
- 1h depois: Formulário de feedback
- D+1: Mensagem pós-atendimento ("Como você está se sentindo/avaliando?")
- D+3: Se não respondeu sobre próximo passo, reiterar oferta

**Follow-up manual:**
- Se o evento originou proposta (exame, retorno, pacote), oferecer agendamento na hora
- Cross-sell ativo quando aplicável

**Critério de saída:**
- ✅ Virou cliente (comprou/contratou) → Fechado-Ganho + move para pipeline de retenção
- ❌ Não virou cliente → Fechado-Perdido com motivo

---

### Estágio: Fechado-Ganho
_Conversão concluída._

**O que acontece:**
- Lead movido para pipeline de retenção/acompanhamento
- Histórico mantido no pipeline de origem como registro
- Automação de onboarding iniciada

**Follow-up automático:**
- D+7: check-in de satisfação
- D+30: pedido de avaliação (Google/site)
- D+60: verificação de próximo passo (retorno, recompra)

---

### Estágio: Fechado-Perdido
_Lead não converteu._

**O que acontece:**
- Motivo de perda obrigatório (campo select)
- Motivos possíveis: Preço / Horário / Convênio / Não Respondeu / Outra Empresa / Sem Urgência / Fora do ICP / Outro
- Análise agregada alimenta relatórios e ajustes de funil

**Follow-up automático:**
- D+90: reativação "Faz 3 meses que você entrou em contato. Ainda quer resolver [DOR]?"

**Critério de saída:**
- Se responde → volta para Novo Lead
- Se não responde → base inativa (sem follow-up ativo)

---

## Família 2: Retenção e acompanhamento

### Estágio: Cliente Ativo (após primeira compra/consulta)
_Cliente está em ciclo de uso/acompanhamento._

**O que acontece:**
- Cliente pago ou paciente em protocolo
- Status "Ativo" atribuído
- Campo "Próximo Evento Recomendado" preenchido (data)

**Follow-up automático:**
- Nutrição educacional (D+7, D+14) relacionada ao serviço
- Lembrete de próximo evento recomendado (D-7, D-3, D-1)

**Critério de saída:**
- ✅ Agendou próximo evento → Próximo Agendado
- ⏸️ Passou de N dias sem interação → Em Risco

---

### Estágio: Em Risco
_Cliente não interage há tempo suficiente para alerta (parâmetro depende do nicho)._

**O que acontece:**
- Flag "risco de churn" ativa
- Responsável notificado
- Sequência de recuperação iniciada

**Follow-up automático:**
- D+0: msg suave ("Sentimos sua falta")
- D+7: oferta de valor (desconto, conteúdo, lembrança de benefício)
- D+14: última tentativa direta

**Critério de saída:**
- ✅ Respondeu e reativou → Ativo
- ❌ Não respondeu → Inativo

---

### Estágio: Inativo
_Cliente parou de responder/usar. Potencial churn._

**O que acontece:**
- Reativação intensiva iniciada

**Follow-up automático (sequência de 60 dias):**
- D+0: "Notei que não tem voltado, tá tudo bem?"
- D+15: Oferta de reativação com benefício concreto
- D+30: Última oferta
- D+60: Mensagem de encerramento ("Estarei aqui quando precisar")

**Critério de saída:**
- ✅ Voltou → Ativo
- ❌ 60+ dias sem resposta → Cancelado

---

### Estágio: Cancelado
_Cliente arquivado. Sem comunicação ativa._

**O que acontece:**
- Cliente em base dormindo
- Sem follow-up ativo (respeita desejo de não contato)
- Pode ser reativado em campanhas sazonais muito pontuais (ex: "Faz 1 ano...")

---

## Família 3: Reativação de base dormindo

Quando você tem uma base grande de contatos frios (clientes antigos, lista de planilha, sistema velho) parada, sem trabalho.

### Estágio: Base Fria Importada
_Contatos importados de planilha, sistema antigo, lista._

**Pré-requisito:** consentimento (LGPD) verificado.

**Follow-up automático (campanha de ativação):**
- Semana 1: msg identificadora ("Você se lembra da gente?")
- Semana 2: conteúdo de valor (dica, novidade)
- Semana 3: oferta de reengajamento
- Semana 4: última chance ou corte definitivo

**Critério de saída:**
- ✅ Respondeu positivo → Novo Lead (volta ao topo do funil)
- ✅ Pediu descadastro → Descadastrado (respeitar)
- ❌ Não respondeu 4 semanas → Dormente (sem follow-up por 6 meses)

---

## Família 4: Funis B2B específicos

### Estágio: SQL (Sales Qualified Lead)
_Lead passou pela qualificação de fit (porte, segmento, dor), pronto para abordagem comercial._

**Critério de entrada:** score mínimo de qualificação (budget, autoridade, necessidade, timing).

**Follow-up:**
- Vendedor entra em contato em <2h (SLA B2B)
- Objetivo: marcar demo ou descoberta

**Critério de saída:**
- ✅ Demo agendada → Demo Agendada
- ❌ Sem budget/timing → Nutrição de longo prazo

---

### Estágio: Demo Realizada
_Prospect viu o produto/serviço em ação._

**Follow-up automático:**
- 1h depois: resumo da demo + material de apoio
- D+1: follow-up humano com próximo passo sugerido
- D+3: se sem resposta, reitera valor
- D+7: caso de uso relevante
- D+14: última tentativa antes de pausa

**Critério de saída:**
- ✅ Avançou para proposta → Proposta
- ❌ Disse que não vai avançar → Fechado-Perdido
- ⏸️ Precisa de mais tempo → Nutrição

---

### Estágio: Proposta / Negociação
_Proposta formal enviada._

**Follow-up automático:**
- D+3: "Teve chance de olhar a proposta?"
- D+7: reiteração do valor + esclarecimento de dúvidas
- D+14: última tentativa com oferta de conversa

**Campos críticos:** valor da proposta, desconto aplicado, condição de pagamento, objeção principal.

**Critério de saída:**
- ✅ Assinou → Fechado-Ganho (move para onboarding)
- ❌ Recusou → Fechado-Perdido com motivo

---

## Dicas universais ao montar estágios

1. **Nunca crie estágio sem ação clara.** Se "o que acontece" está vago, o estágio não existe na prática: vira lixo de dashboard.
2. **Critério de saída é objetivo ou não existe.** "Cliente demonstrou interesse" não é critério. "Cliente respondeu 'sim, quero' à pergunta X" é.
3. **Nomeie em português do cliente.** "MQL" e "SQL" internamente OK; "Qualificação" no funil visível ao cliente final.
4. **Máximo 7 estágios por pipeline.** Além disso, confunde e desanima equipe. Se precisa de mais, divida em 2 pipelines.
5. **Todo estágio transita em ≤N dias.** Defina um SLA por estágio. Lead parado >SLA vira alerta para o responsável.
