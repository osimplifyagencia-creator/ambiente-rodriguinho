# Revisão da call e placar

Como transformar uma transcrição em correção. Vale para a revisão da sua própria call e para o Claude revisando a call de outra pessoa do time.

O placar mede **condução**, não resultado. Call que vendeu com condução ruim é dinheiro na mesa que ninguém viu. Call que não vendeu com condução boa é estatística, e o próximo sim já está pago.

---

## Antes de julgar qualquer coisa

1. **De que lado você estava?** Se você estava comprando (ouvindo a proposta de um fornecedor), o papel é `compramos`: não preencha dados de venda, porque isso levaria você para a próxima call com o problema errado na cabeça. O que se extrai é a técnica do outro lado, com o trecho.
2. **A transcrição erra número.** "Quatro mil e quinhentos" vira "45 mil". Todo número citado na revisão carrega o trecho literal de onde saiu. Número sem trecho não entra.
3. **Transcrição automática corta fala sobreposta.** Silêncio no texto não prova silêncio na sala. Onde o placar depender de pausa (a âncora), diga "não dá para medir pela transcrição" em vez de chutar.

---

## A linha do tempo (faça primeiro, leva 5 minutos)

Marque o minuto aproximado de cada marco. É o que revela inversão de ordem, o defeito mais comum e mais caro.

| Marco | Minuto | Esperado |
|---|---|---|
| Combinado feito | | até o 3 |
| Primeira pergunta de situação | | até o 5 |
| Primeira pergunta de implicação | | 10 a 18 |
| O primeiro número dito por ELE | | até o 20 |
| Devolutiva ("deixa eu ver se entendi") | | 20 a 25 |
| A conta em voz alta | | 25 a 30 |
| Primeira tela mostrada | | depois da conta |
| Pergunta de âncora | | antes do preço |
| Preço dito | | depois da âncora |
| Próximo passo com data | | antes de desligar |

Marco ausente vale zero no placar. Marco fora de ordem vale no máximo 1.

---

## O placar (12 itens, 0 a 2 cada, máximo 24)

`0` não aconteceu · `1` aconteceu pela metade ou fora de hora · `2` aconteceu como manda a regra.

| # | Item | O que dá 2 |
|---|---|---|
| 1 | Abertura e agenda | Ele soube em 1 minuto como a conversa ia ser, e concordou |
| 2 | O combinado | Pedido de não verdadeiro e fechar no final, e ele respondeu "combinado" |
| 3 | Proporção de pergunta e afirmação nos primeiros 20 min | A maior parte do tempo é ele falando |
| 4 | Situação sem desperdício | Nenhuma pergunta sobre algo que já estava na preparação |
| 5 | Problema nas palavras dele | A frase literal da dor aparece na transcrição |
| 6 | Implicação até o bolso | Quantas vezes, quanto vale cada uma, há quanto tempo |
| 7 | Devolutiva | Diagnóstico repetido e confirmado por ele |
| 8 | A conta do problema | Feita em voz alta, com os números dele, antes de qualquer preço |
| 9 | Pitch colado na dor | Cada parte mostrada volta na conta; nenhuma funcionalidade solta |
| 10 | Âncora | Pergunta feita e resposta dele registrada, antes do preço |
| 11 | Objeções | Uma pergunta antes de defender, tipo certo, escada sem pular degrau, concessão com contrapartida |
| 12 | Próximo passo | Ação concreta ainda na sala, ou dia e horário exatos |

**Régua sugerida (ponto de partida, recalibre depois das 10 primeiras calls revisadas):** 20 ou mais, call padrão. 14 a 19, call com furo. Abaixo de 14, a call foi improviso.

**Zero em qualquer um destes três é reprova, independente da soma:** item 8 (conta antes do preço), item 10 (âncora) e item 12 (próximo passo).

---

## Formato da devolutiva

Três blocos, nesta ordem, e curtos. Começar pelo erro faz a pessoa parar de ler.

```
O QUE SEGUROU A CALL
- 2 ou 3 coisas, com o trecho literal ao lado

O QUE CUSTOU
- no máximo 3, cada uma com o minuto e o trecho
- e o que teria acontecido se fosse diferente

A ÚNICA COISA A MUDAR NA PRÓXIMA
- uma, com a frase pronta para usar

PLACAR: 18/24  (itens com 0: nenhum · itens com 1: 3, 7, 10)
```

**Uma correção por revisão.** Cinco correções viram zero correção. A segunda mais grave espera a próxima call.

---

## O que a revisão devolve para a empresa

- Correção de **pessoa:** fica na devolutiva e no treino.
- Correção de **processo** (a regra que faltava, não a pessoa que errou): vira linha na seção "A regra padrão" da skill `call-de-vendas`.
- Correção de **etapa do funil:** muda a definição da etapa no seu funil (`arquiteto-de-funis`).
- Objeção nova que ninguém tinha visto: entra nas objeções do `whatsapp-sales-process`, que é a lista única.

Guarde a revisão na pasta da call: `vendas/calls/AAAA-MM-DD-nome/revisao.md`.
