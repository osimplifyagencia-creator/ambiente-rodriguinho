# Post-Sales Playbooks: Funil de pós-venda, retenção e expansão

A direita do laço (Bowtie). Onde mora o LTV. Estrutura testada de estágios, plays de Customer Success, health score e métricas: agnóstica de ferramenta.

> **Como usar:** todo negócio com serviço ou produto recorrente **precisa** de funil de pós-venda. Leia `frameworks.md` (seção Bowtie) antes. Monte o `vendas/funil/funil-posvenda.md` a partir dos estágios abaixo + as plays relevantes. Adapte o ciclo ao nicho (ver `niche-playbooks.md`).

## Índice
1. Princípio: pós-venda é a equação certa
2. Estágios do funil de pós-venda
3. As 10 plays de Customer Success
4. Health score (saúde do cliente)
5. Métricas de pós-venda
6. Notas por nicho

---

## 1. Princípio: pós-venda é a equação certa

"Fechado-ganho" é o **meio** da jornada, não o fim. Em negócio recorrente:
- Adquirir cliente novo custa de 5 a 7x mais que reter um existente.
- A margem real está em **recompra + expansão**, não na primeira venda (a porta de entrada às vezes é até no prejuízo).
- +5% de retenção pode significar +25-95% de lucro (Bain).

Portanto: se o seu negócio tem recompra ou serviço recorrente e você só estruturou a captação, fez metade do trabalho. O funil de pós-venda é **obrigatório** nesses casos.

**Diferença vs. funil de captação:**
| | Captação | Pós-venda |
|---|---|---|
| Objetivo | Converter desconhecido em cliente | Reter, fazer usar, expandir, transformar em promotor |
| Gatilho de entrada | Lead criado | Fechado-ganho / primeira compra |
| Métrica-mãe | Taxa de conversão, CAC | NRR, LTV, churn, recompra |
| Tom | Consultivo, atrai | Cuidado, acompanha, aprofunda |

---

## 2. Estágios do funil de pós-venda

Formato igual ao `stage-patterns.md`. Adapte timing e copy ao nicho.

### Estágio: Onboarding / Boas-vindas pós-fechamento
_Cliente acabou de comprar/contratar. Janela crítica de primeira impressão._

**O que acontece:**
- Handoff de comercial → pós-venda (ou recepção): ver `handoff-protocol.md`
- Cliente movido para o pipeline de retenção
- Campo "Data de Início" e "Próximo Evento Recomendado" preenchidos

**Follow-up automático:**
- 0-4h: mensagem de boas-vindas + o que esperar (reduz ansiedade e cancelamento precoce)
- D+1: orientação prática (como usar / como se preparar para o primeiro retorno)
- D+3: checagem ("ficou alguma dúvida?")

**Critério de saída:**
- ✅ Cliente completou o primeiro marco (1ª sessão feita, produto configurado, 1º uso) → Ativação
- ⏸️ Sem ação no prazo do nicho → Em Risco (onboarding travado)

---

### Estágio: Ativação / Primeiro Valor
_Cliente teve a primeira experiência concreta de valor (o "momento aha")._

**O que acontece:**
- Primeiro resultado entregue (consulta feita, primeira aula, primeiro mês de uso, primeira entrega)
- Registro do time-to-value (quanto tempo levou)

**Follow-up automático:**
- +1h após o evento: pedido de feedback curto (1 palavra / nota)
- D+1: reforço do valor + próximo passo
- Surfar imediatamente o **próximo marco de valor** para manter o ritmo

**Critério de saída:**
- ✅ Engajou e marcou/usou de novo → Adoção/Recorrência
- ❌ NPS/feedback baixo → play de resgate (intervir antes de virar churn)

---

### Estágio: Adoção / Recorrência (Cliente Ativo)
_Cliente em ciclo de uso/acompanhamento recorrente._

**O que acontece:**
- Cliente em protocolo, plano ativo, uso regular
- Status "Ativo"; "Próximo Evento Recomendado" sempre preenchido

**Follow-up automático:**
- Nutrição educacional ligada ao serviço (D+7, D+14)
- Lembrete do próximo evento recomendado (D-7, D-3, D-1): gatilho por intervalo do protocolo (ex.: estética 28d, retorno médico conforme indicação)

**Critério de saída:**
- ✅ Agendou/usou próximo evento → permanece Ativo (loop saudável)
- ✅ Oportunidade de upsell detectada → Expansão
- ⏸️ Passou de N dias sem interação → Em Risco

---

### Estágio: Expansão (Cross-sell / Upsell)
_Oportunidade de aumentar o valor do cliente._

**O que acontece:**
- Gatilho: marco de sucesso atingido, ou perfil + histórico indicam serviço complementar
- A expansão se apresenta como **solução para um problema que o cliente já expressou** (não como empurro de venda)

**Follow-up automático:**
- Sugestão personalizada (regra ou IA: ver `automation-library.md`, Padrão 5)
- Criar tarefa "Cross-sell sugerido: {serviço}" para o responsável
- Registrar evento "cross_sell_suggested"

**Critério de saída:**
- ✅ Aceitou → nova venda registrada, volta para Adoção com escopo ampliado
- ❌ Recusou → permanece Ativo (tentar de novo em janela futura, sem insistir)

---

### Estágio: Advocacy / Indicação
_Cliente satisfeito e leal: fonte de novos leads._

**O que acontece:**
- Cliente com 2+ ciclos completos e NPS alto (≥9)
- Vira candidato a review, indicação, depoimento, case

**Follow-up automático:**
- Após NPS ≥9: esperar 2h, pedir review no canal que importa (Google, loja de app): ver `automation-library.md`, Padrão 8
- Programa de indicação (benefício por indicar)

**Critério de saída:**
- ✅ Indicou → lead novo entra no topo do funil de captação (com tag "Origem: Indicação")
- ✅ Deixou review → tag "Promotor"

---

### Estágios de risco (paralelos, podem disparar de Adoção/Ativação)

### Estágio: Em Risco
_Cliente parou de interagir tempo suficiente para alerta (parâmetro depende do nicho)._

**Follow-up automático:**
- D+0: mensagem suave ("senti sua falta")
- D+7: oferta de valor (benefício concreto, não desconto agressivo)
- D+14: última tentativa direta

**Critério de saída:**
- ✅ Reativou → Ativo
- ❌ Sem resposta → Inativo

### Estágio: Inativo → Recuperação → Churn
_Sequência de 60 dias antes de arquivar (ver `stage-patterns.md`, Família 2)._
- D+0 / D+15 / D+30 / D+60 escalonando de suave a encerramento respeitoso.
- ✅ Voltou → Ativo. ❌ 60+ dias sem resposta → Cancelado (base dormindo, sem follow-up ativo; respeita LGPD).

---

## 3. As 10 plays de Customer Success

Cada play = **gatilho → ações padronizadas → responsável → métrica de sucesso**. Adapte de SaaS para serviço local trocando "uso do produto" por "frequência de visita/sessão".

1. **Handoff comercial → pós-venda.** Gatilho: fechado-ganho. Passa contexto completo (ver `handoff-protocol.md`). Sem isso, o cliente repete tudo e a relação começa fria.
2. **Kickoff / boas-vindas.** Gatilho: início do contrato. Mensagem de boas-vindas em <4h, alinhamento de expectativa, primeiro marco definido.
3. **Primeiro valor (first value milestone).** Gatilho: cliente completa o primeiro fluxo/uso/sessão. Parabenizar, registrar time-to-value, surfar o próximo marco.
4. **Resumo executivo recorrente.** Gatilho: ciclo mensal. Mensagem curta ao decisor: o que foi entregue, o que vem, 1 resultado concreto. 10 min de trabalho, impacto grande em renovação.
5. **Alerta de baixo engajamento.** Gatilho: uso/frequência cai abaixo da linha de base por 2 períodos, ou health score cruza limiar. Abordagem proativa com pergunta específica ("qual resultado você ainda quer atingir?"), nunca "passando pra ver".
6. **Check-in / QBR (revisão periódica).** Gatilho: trimestral (ou mensal para ciclo curto). Revisa valor entregue, uso, progresso vs. meta. Realinha e abre espaço para expansão.
7. **Identificação de expansão.** Gatilho: marco de sucesso atingido. Mapeia o próximo desafio do cliente como gancho de upsell.
8. **Conversa de expansão.** Estrutura: abrir com o que o cliente conquistou (palavras dele) → identificar o próximo desafio que ele expressou → apresentar a expansão como solução.
9. **Preparação de renovação.** Gatilho: 90 dias antes (contrato anual) / 30 dias (mensal). Reforça valor acumulado antes da conversa de renovação.
10. **Resgate de churn / perda de campeão.** Gatilho: pedido de cancelamento, ou saída do contato-chave. Entender o motivo real, oferecer caminho, documentar o motivo de perda.

---

## 4. Health score (saúde do cliente)

Métrica preditiva que estima a probabilidade de renovação, expansão ou churn: **60-90 dias antes** de acontecer. Transforma sinais dispersos numa visão única para priorizar quem precisa de atenção.

**Como montar (comece simples):**
- Escolha **3-5 sinais** que predizem churn. Comece com o que dá pra medir hoje.
- Atribua peso a cada sinal pela correlação com o resultado (o sinal mais preditivo pesa mais). Refine os pesos ao longo de 2-3 trimestres.

**Sinais por tipo de negócio:**
| Negócio | Sinais de saúde |
|---|---|
| Clínica / estética / fitness | frequência de visita vs. esperada, dias desde a última visita, comparecimento, recompra no prazo do protocolo |
| SaaS | frequência de login, profundidade de uso de features, tickets de suporte/sentimento, proximidade de renovação |
| Contábil / jurídico (recorrente) | pontualidade de pagamento, reclamações, resposta a check-ins |

**Faixas de ação:** Verde (saudável → nutrir, abrir expansão) / Amarelo (atenção → play 5) / Vermelho (risco → play 10, watchlist de renovação).

**Regra:** sinais isolados perdem valor. O health score combina-os num número que dispara play automaticamente. Vira **campo personalizado** + **tag** de risco. Ver `tags-and-fields.md`.

---

## 5. Métricas de pós-venda

| Métrica | O que mede | Meta de referência |
|---|---|---|
| **NRR** | receita retida + expandida da base (líq. de churn) | >100% (base cresce sozinha) |
| **Churn** | % de clientes ou de receita perdidos no período | quanto menor melhor; fitness/SaaS vigiar de perto |
| **Taxa de recompra** | % que recompra em 30/60/90d | varia por nicho (estética alta, saúde 40%+ em 60d) |
| **LTV** | valor total ao longo da relação | sempre > 3x CAC |
| **NPS / CSAT** | satisfação e propensão a indicar | NPS ≥9 dispara play de advocacy |
| **Taxa de expansão** | % da base que faz cross-sell/upsell | onde mora a margem |
| **Time-to-value** | tempo até o primeiro valor | quanto menor, menor o churn precoce |

Toda métrica precisa de um **evento logado** alimentando o dashboard (ver `automation-library.md`, schema de eventos). Para acompanhar os números, use uma planilha simples em `gestao/` ou o relatório do próprio CRM.

---

## 6. Notas por nicho

- **Saúde:** pós-venda = funil de retorno (retorno agendado → confirmado → realizado). Margem em exames, procedimentos, retornos. NPS pós-consulta dispara review.
- **Estética:** recorrência é o jogo todo. Gatilho de recompra por intervalo do protocolo (ex.: 28d). Cliente bom = 1x/mês.
- **Fitness:** churn é o vilão; aluno cancela em 3-6 meses se não engajar. Alerta "em risco" quando falta 7+ dias seguidos. Onboarding dos 30 primeiros dias é decisivo.
- **SaaS:** funil de expansão clássico (onboarding → adoção/feature adoption → upsell). NRR é a estrela.
- **Contábil/jurídico recorrente:** retenção via cuidado premium (alertas de obrigação como serviço). Risco = atraso de pagamento ou reclamação.
- **Alimentação/delivery:** não há funil de venda tradicional, só recompra e fidelização. Cupom pós-1ª compra, nudge de recompra D+7/14/21.
- **Imobiliária / móveis planejados / one-shot:** pós-venda é mais sobre indicação e NPS do que recompra. Foco em advocacy.

Quando o nicho não estiver claro, perguntar: o serviço é recorrente? Se sim, funil de pós-venda obrigatório. Se one-shot, focar advocacy/indicação.
