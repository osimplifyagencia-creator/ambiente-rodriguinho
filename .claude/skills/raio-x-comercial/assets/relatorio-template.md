# Raio-X Comercial: {{Empresa}}
**Rodada:** {{0 = baseline | N = reinspeção}} · **Data:** {{DD/MM/AAAA}} · **Nicho:** {{nicho}} · **Auditor:** {{quem}}

---

## 1. Veredito em uma página

> **A restrição é: {{estação}}.** {{Uma frase dizendo o que trava e quanto custa.}}

| Bloco | Estrutura | Vazamento | Leitura |
|---|---|---|---|
| 0 · Vitrine | {{n}}✅ {{n}}🟡 {{n}}❌ | {{%}} | {{frase curta}} |
| 1 · Porta de entrada | | | |
| 2 · Atendimento | | | |
| 3 · Avanço | | | |
| 4 · Pós-venda | | | |
| T · Motor de gestão | | | |

**Dinheiro parado identificado:** {{X leads recuperáveis × ticket = R$ Y}}

---

## 2. O funil real: onde vaza

| Etapa | Entraram | Avançaram | Conversão | Vazamento | R$ estimado |
|---|---|---|---|---|---|
| {{etapa}} | {{n}} | {{n}} | {{%}} | {{n}} | {{R$}} |

> Marcar 🔴 a etapa com maior vazamento absoluto e a mais precoce que está quebrada. Se forem diferentes, **começar pela mais precoce**.

---

## 3. Cruzamento estrutura × vazamento

| Quadrante | Estações | O que fazer |
|---|---|---|
| 🔴🔴 Estrutura ruim + vaza muito | | Construir a peça E cobrar o uso. Prioridade máxima |
| 🔴 Estrutura OK + vaza muito | | **Problema de execução**: treino e cobrança, não construção |
| 🟡 Estrutura ruim + vaza pouco | | Consertar antes de escalar volume |
| ✅ Estrutura OK + vaza pouco | | Candidato a ESCALAR |

---

## 4. Resultado do gabarito

*(Uma tabela por bloco. Só listar ❌ 🟡 ❔; os ✅ vão resumidos no fim.)*

### Bloco {{N}} · {{Nome}}

| ID | Ponto | Veredito | Evidência | Correção | Dono | Prazo |
|---|---|---|---|---|---|---|
| {{ID}} | {{ponto}} | 🟡 | {{o que foi visto}} | {{ação concreta}} | {{quem}} | {{data}} |

**Passaram (✅):** {{IDs}}
**Não se aplica (⬜):** {{IDs + motivo}}

---

## 5. Plano de correção priorizado

Ordenado por **impacto ÷ esforço**, respeitando a regra "conserte o mais cedo primeiro".

| # | Ação | Bloco | Dono | Prazo | Número que deve mudar |
|---|---|---|---|---|---|
| 1 | | | | | |

> Máximo de 5 ações simultâneas. Lista de 40 itens paralisa você e o time.

---

## 6. Dependências de terceiros *(o que depende de outra pessoa e não veio)*

O que você precisa e ainda não tem. **Sempre preencha**: se estiver vazio, escreva "nada pendente".

| O que | Pedido em | Status | Impacto de não ter |
|---|---|---|---|
| {{acesso/dado/ação}} | {{data}} | {{pendente/entregue}} | {{o que trava}} |

---

## 7. Comparativo com a rodada anterior *(rodada ≥1)*

| Métrica | Rodada anterior | Agora | Δ |
|---|---|---|---|
| Pontos ✅ | | | |
| Pontos ❌ | | | |
| Vazamento da restrição | | | |
| {{KPI principal}} | | | |

**Moveu:** {{o que melhorou e por quê}}
**Não moveu:** {{o que ficou e por quê, se foi dependência de terceiro, marcar}}

---

## 8. Validação do método *(fechamento de um ciclo de correções)*

| ID | Corrigi? | Número mexeu? | Veredito |
|---|---|---|---|
| {{ID}} | Sim | Sim: {{qual}} | Provou |
| {{ID}} | Sim | Não | Não provou → sai do gabarito |
| {{ID}} | Sim | Não deu pra isolar | Inconclusivo |
