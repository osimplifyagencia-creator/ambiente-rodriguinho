# Funil, prazos, etiquetas e números

Funil de referência para vendas por WhatsApp, ligado aos **3 níveis de follow-up** da skill (seção 5 da SKILL.md). Vale para qualquer CRM e também para uma planilha com uma coluna de etapa. Troque os nomes das etapas pelos que a sua empresa já usa. Para desenhar o funil completo (inclusive pós-venda), use `arquiteto-de-funis`.

---

## Etapas, prazo máximo e nível de follow-up

| # | Etapa | Prazo máximo | Nível de follow-up ativo | Etiqueta |
|---|---|---|---|---|
| 1 | Contato novo | 5 min (primeira resposta) | | `origem:[fonte]` |
| 2 | Em qualificação | 24h | **N1** se parar de responder | `qualificando` |
| 3 | Qualificado | 24h | **N2** se sumir | `qualificado`, `ticket:[faixa]` |
| 4 | Pitch enviado | 48h | **N2** | `pitch_enviado` |
| 5 | Em negociação | 72h | **N3** | `negociando`, `objecao:[tipo]` |
| 6 | Aguardando pagamento | 48h | **N3** | `link_enviado` |
| 7 | Ganho | | | `cliente` |
| 8 | Perdido: sem orçamento | | reativação D+60 | `perdido:orcamento` |
| 9 | Perdido: sem fit | | | `perdido:fit` |
| 10 | Perdido: sem resposta | | reativação D+60 | `perdido:sem_resposta` |
| 11 | Reativação | | retorno (nível 6) | `reativacao` |

> **Regra do nível:** o nível de follow-up vem da etapa. A pessoa avança, o nível muda e a cadência reinicia. Ela responde, sai da cadência.

Sem CRM? Faça uma planilha com as colunas: nome, telefone, origem, etapa, nível (frio, morno, quente), data do último contato, próximo toque (data), motivo de perda. A planilha funciona desde que alguém olhe a coluna "próximo toque" todo dia.

---

## O que automatizar e o que fazer à mão

O princípio da empresa: **automação é a última camada.** Só automatize o que você já rodou à mão algumas vezes sem precisar corrigir. Antes disso, uma tarefa na agenda ou no CRM resolve.

| Tipo | Como começar | Quando automatizar |
|---|---|---|
| Conversa, qualificação, resposta rápida | Respostas rápidas do app WhatsApp Business ou do CRM | Depois de ter o texto estável |
| Mover de etapa | À mão, ao fim de cada conversa | Quando o critério de saída da etapa for objetivo |
| Follow-up por tempo | Lembrete de tarefa com data | Quando a cadência estiver provada |
| Tarefa de ligação | Tarefa no CRM ou lembrete na agenda | Gatilho "entrou em negociação" |
| Pedido de parar (PARAR ou SAIR) | Marque a pessoa como "bloqueado" e pare tudo | Sempre que houver automação, essa regra é a primeira |

Se o seu CRM tem gatilhos, o mais útil para follow-up é o de **inatividade** ("X horas depois da última mensagem da pessoa"). Atenção: alguns planos de CRM limitam gatilho por etiqueta ou por campo. Confira antes de desenhar o fluxo.

### Mapa de eventos (evento, quem executa, ação)

| Evento | Ação |
|---|---|
| Contato chega (primeira mensagem) | Boas-vindas e registro da origem |
| Qualificou na conversa | Mover de etapa, gravar campos, classificar o nível |
| Sem resposta depois do prazo | Primeiro toque do follow-up (nível pela etapa) |
| Pessoa responde | Pausar a cadência e avisar quem atende |
| Entra em "Aguardando pagamento" | Lembrete de pagamento (seção 6 da SKILL.md) |
| N3 com ticket alto | Criar tarefa de ligação (prazo de 2h, roteiro na descrição) |
| Falta ao compromisso | Tarefa de ligação de recuperação (prazo de 30 min) |
| Cadência esgotada | Tarefa de ligação antes de marcar como perdido, se a pessoa valer |
| Ganho | Passar para o pós-venda e gravar o valor fechado |
| Perdido | Gravar o motivo e agendar reativação (D+60) |
| PARAR ou SAIR | Marcar como "bloqueado" e pausar **todas** as automações (LGPD) |

---

## Etiquetas padrão

- **Origem:** `origem:ads`, `origem:indicacao`, `origem:organico`
- **Ticket:** `ticket:baixo`, `ticket:medio`, `ticket:alto`
- **Estado:** `qualificando`, `qualificado`, `pitch_enviado`, `negociando`, `link_enviado`
- **Objeção:** `objecao:preco`, `objecao:tempo`, `objecao:decisor`, `objecao:confianca`
- **Controle:** `confirmou`, `no_show`, `reativacao`, `bloqueado`, `cliente`

Classificação de nível (frio, morno, quente): um campo de seleção simples. N1 é frio, N2 é morno, N3 é quente (e "gelado" para quem nunca interagiu). Quem classifica é você ou a regra de sinais da seção 5.8 da SKILL.md. Etiqueta é opcional, para filtrar rápido.

Etiqueta serve a um propósito: segmentar, filtrar ou disparar algo. Etiqueta que ninguém usa, apague.

---

## Números e painel (módulo 13)

### Indicadores e fórmulas

| Indicador | Fórmula | Ponto de partida (seção 8.1 da SKILL.md) |
|---|---|---|
| Resposta ao primeiro contato | quem respondeu dividido por quem entrou | 50 a 75% |
| Qualificação | qualificados dividido por quem respondeu | 40 a 60% |
| Qualificado para pitch | pitch enviados dividido por qualificados | 60 a 80% |
| Fechamento | ganhos dividido por pitch enviados | 20 a 40% |
| Ganho do follow-up | (ganhos com follow-up menos ganhos sem) dividido por ganhos sem | +10 a +25% |
| Falta ao compromisso | quem faltou dividido por agendados | 15 a 30% |
| Primeira resposta | tempo médio até a primeira mensagem | menos de 5 min |
| Ciclo médio | dias entre contato novo e ganho | varia por arquétipo |

### Como medir
- Funil: conte quantos estão em cada etapa e quantos passaram de uma etapa para a seguinte no período (no CRM, ou contando linhas da planilha).
- Primeira resposta: data e hora da entrada contra a primeira mensagem sua.
- Ganho do follow-up: compare um grupo com cadência ativa contra um grupo sem cadência, por um período curto, antes de generalizar.

> **Compare igual com igual.** Não compare taxa de fechamento entre arquétipos diferentes: impulso fecha muito e perde muito, consultivo fecha pouco e vale muito.

Onde guardar: o painel mensal em `gestao/painel-comercial.md` e os números do processo no próprio `vendas/processo-whatsapp.md`.
