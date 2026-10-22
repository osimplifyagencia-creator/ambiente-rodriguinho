---
name: call-de-vendas
description: "Call de vendas ao vivo: preparação, roteiro falado, SPIN, conta do problema antes do preço, objeções, próximo passo e revisão pela transcrição. Use quando: \"prepara minha call\", \"tenho reunião de venda\". Não é: venda por mensagem (whatsapp-sales-process, copiloto-whatsapp)."
---

# Call de vendas

A call síncrona da sua empresa: vídeo ou telefone, com gente conduzindo. Esta skill cobre o que acontece **antes** (preparação), **durante** (roteiro falado) e **depois** (registro e revisão).

**Dados da empresa:** o que você vende, ticket, cliente ideal, diferenciais e o jeito de falar da marca vêm de `empresa/PERFIL.md`. Leia antes de preparar qualquer call.

**Onde salvar:** uma pasta por call, `vendas/calls/AAAA-MM-DD-nome-do-cliente/`, com `preparacao.md`, `depois-da-call.md` e, se houver, `transcricao.md` e `revisao.md`. Dado pessoal do prospect (telefone, documento) não vai para outros arquivos.

## As duas regras de ouro (e elas brigam entre si se você trocar a ordem)

1. **A conta do problema vem SEMPRE antes do preço.** Antes de falar valor, faça em voz alta, com os números do próprio cliente, a conta do que o problema custa para ele por mês. É a regra que sustenta todo o resto.
2. **Nunca entre sem número decidido.** Não é "sempre diga um número". É decidir o número e o **piso** a frio, **antes da sala**. Lição medida: quando o preço nasce depois da reunião, andando, ele cai rápido (já se viu queda de 25% em poucos minutos, numa sala sem o cliente para reagir, só porque faltava um piso decidido).

## Quando usar, e quando não

| Situação | Skill |
|---|---|
| Preparar, conduzir ou revisar uma call de venda | **esta** |
| Vender por mensagem, cadência de follow-up, objeção escrita | `whatsapp-sales-process` |
| Responder uma conversa agora | `copiloto-whatsapp` |
| Quanto cobrar, modelo de preço, escada de concessão | `escada-negociacao` |
| Os princípios de vender (o porquê) | `doutrina-vendas` |
| Auditar a operação comercial inteira (não uma call) | `raio-x-comercial` |
| Etapas do funil de onde essa call faz parte | `arquiteto-de-funis` |

---

## Antes da call (20 minutos)

Não precisa ser em cima da hora: o ideal é meia hora antes. Ordem:

1. **Leia o que você já sabe do prospect.** Notas da conversa, histórico em `vendas/` e o que veio da indicação. Se não há nada, pergunte ao dono 3 coisas: quem é, como chegou e o que ele já disse que incomoda.
2. **Escreva a hipótese da dor em uma frase**, no vocabulário dele, e marque como **hipótese**. Ela existe para ser **derrubada** pela pergunta, não confirmada. Chutar número na frente do cliente mata a credibilidade.
3. **Decida o número e o piso, a frio.**
   - preço desta call
   - piso ("até onde eu desço e nem um real abaixo")
   - entregáveis na mesma frase do preço
   - a **pergunta de âncora** ("quanto isso valeria por mês pra você?")
   O piso nasce igual ao preço e só baixa com motivo escrito. Tabela de preço é referência, não preço final.
4. **Tenha a forma de pagamento pronta** (link, Pix, contrato). Gerar na frente do cliente esfria o fechamento.
5. **Leve a etapa do funil em que ele está** (veja `arquiteto-de-funis`) e as objeções prováveis, já classificadas por tipo (seção "Objeções").
6. **Abra a demonstração** (material, proposta, exemplo) numa aba, sem mostrar ainda.

**Pronto quando:** a hipótese da dor está escrita, número e piso decididos, forma de pagamento na mão, material aberto, e você consegue dizer em **uma frase** qual é o **objetivo único** desta call.

Peça ao Claude: "prepara a call com o [nome]" e ele monta o `preparacao.md` com: quem é, hipótese da dor, perguntas SPIN para ele, conta do problema (com campos em branco para os números que ele vai dizer), oferta com número e piso, âncora, objeções prováveis com a pergunta de cada uma, e o objetivo único.

---

## O roteiro falado

Base de **50 minutos**. As falas prontas estão em [`references/roteiro-da-call.md`](references/roteiro-da-call.md).

| Min | Bloco | O que acontece | Trava |
|---|---|---|---|
| 0-3 | **Abertura e agenda** | Nome, uma coisa genuína e o mapa da conversa em 3 passos. Depois **o combinado**: "me dá um não de verdade se não fizer sentido, e se fizer a gente fecha no final" | Sem o combinado, o fechamento no fim parece puxado |
| 3-20 | **SPIN falado** | S (só o que você não descobriu antes) · P (ele descreve o problema com as palavras dele) · I (leva o custo até o bolso: quantas vezes, quanto vale cada uma, há quanto tempo) · N (ele diz o valor de resolver) | 80% da call é pergunta. Nenhuma tela aberta ainda |
| 20-25 | **Devolutiva** | "Deixa eu ver se entendi", repetindo o diagnóstico com as palavras DELE e pedindo correção | Se ele corrige, você ganhou o dado certo. Se confirma, ele assinou o problema |
| 25-30 | **A conta do problema** | A conta em voz alta, com os números que ele deu, item a item, chegando ao total por mês | Números dele. Nunca média de mercado |
| 30-38 | **Pitch colado na dor** | A solução que tapa aquele buraco, na linguagem dele. Não é tour de funcionalidade | Toda frase volta na conta. Sem jargão |
| 38-42 | **Âncora e preço** | Primeiro: "pelo que você viu, quanto isso valeria por mês pra você?" **E aí cale a boca e espere.** A resposta vira a régua. Só então o seu número, com os entregáveis na mesma frase | Preço sem entregável vira preço solto. Anote o que ele respondeu |
| 42-52 | **Objeções** | Uma pergunta antes de defender. Escada de concessão, nunca corte de preço puro | Toda concessão pede algo de volta |
| 52-60 | **Próximo passo** | Retome o combinado e feche uma ação concreta AGORA: pagamento ao vivo, link enviado e confirmado, ou dia e **horário** exatos do próximo toque | "Te mando depois" não é fechamento |

**O que muda por ser falado e não escrito** (a diferença para `whatsapp-sales-process`):

- **O silêncio é ferramenta.** Depois da pergunta de âncora, quem fala primeiro perde a régua.
- **Uma pergunta por vez, e reaja à resposta** antes da próxima. Duas na mesma fala fazem a pessoa responder só a segunda.
- **Não dá para reler.** Repita o número dele em voz alta antes de usá-lo numa conta.
- **A objeção chega com tom.** Dá para ouvir se é preço, medo ou prioridade. A pergunta de isolamento custa 5 segundos e evita responder a objeção errada.
- **O calor esfria ao desligar.** É o ativo mais caro que você tem naquele minuto.

---

## Objeções na call

O ciclo é o mesmo do canal escrito: **validar, isolar, reframe, fechar**. Na call o isolamento é uma pergunta falada, e ela vem **antes** de qualquer defesa.

**Classifique o tipo antes de responder**, porque a resposta certa para um é errada para outro: `preço` · `risco` · `prioridade` · `autoridade` · `escopo`.

Lição medida: o cliente conta que já teve uma solução parecida e desistiu porque ela deu o preço errado para o perfil dele. Isso é **risco**, e responder com desconto é responder a pergunta errada. **Objeção de risco respondida com desconto é o erro mais caro da lista**, porque o cliente aceita o desconto e continua com medo. Outro caso: o cliente pede um teste de 1 a 3 meses e ouve "não existe". A conversa trava. **Decida antes da call quais concessões você autoriza** (por exemplo, "o primeiro marco pago, com entrega e data, e se não estiver de pé o cliente não segue"). Concessão não se decide no susto.

- A tabela de objeções prontas está em `references/roteiro-da-call.md`.
- Escada de concessão (parcelamento, prazo, bônus, brinde, saída limpa): `escada-negociacao`.
- Para escrever as objeções do SEU cliente na preparação, use a pergunta de cada tipo e uma resposta "se insistir".

---

## Depois da call (nos 10 minutos seguintes)

Enquanto você ainda lembra. É o degrau que ninguém sobe, e é onde a aprendizagem acontece.

1. **Escolha o desfecho de uma lista fechada**, nunca uma palavra nova: `pediu_proposta` · `avançou` · `sem_avanço` · `remarcou` · `não_apareceu` · `pediu_outra_pessoa` · `sem_interesse` · `fora_de_perfil`. Lista fechada permite contar depois. Perda exige motivo (`preço`, `sem_orçamento`, `momento`, `concorrente`, `fora_de_escopo`).
2. **Grave no registro**: o que ele respondeu na âncora (é a régua da próxima conversa), o preço dito, uma ata de 3 a 6 linhas e o próximo passo. Se usa CRM, atualize lá também; senão, em `vendas/calls/.../depois-da-call.md`.
3. **Próximo passo com DATA e hora**, sempre, mesmo quando o desfecho é bom.
4. **Cole a transcrição ou as suas anotações** para o Claude ler. Para cada número, o trecho literal vem junto, e só o que você confirmar entra no registro.
5. **Proposta no mesmo dia** quando não fechou na sala. Retornos em D+2, D+5 e D+10, com decisão resolvida até D+10.

> **Número dito em voz não vira campo, vira proposta.** Transcrição automática em português erra número ("quatro mil e quinhentos" vira "45 mil"). Por isso cada número guarda `{valor, trecho}` e só o que você confirma é gravado. Nunca digite da memória o valor que ele falou.

---

## Revisão da call pela transcrição

Procedimento e placar completos em [`references/placar-da-call.md`](references/placar-da-call.md).

1. **Primeiro decida o papel.** Nem toda call gravada é você vendendo. Se você era o comprador (recebendo uma proposta de fornecedor), o papel é `compramos`: não preencha dados de venda, e extraia a **técnica do outro lado**.
2. **Marque os blocos no tempo**: em que minuto apareceram o combinado, a primeira pergunta de implicação, o número dele, a conta em voz alta, o preço e o próximo passo. O mapa mostra inversão de ordem (por exemplo, o número do cliente aparecer só no meio da apresentação e nunca virar conta antes do preço).
3. **Conte, não impressione:** quantas perguntas contra afirmações, quanto do tempo foi você falando, quantas vezes o número dele foi repetido.
4. **Preencha o placar** (12 itens, 0 a 2) e escolha **uma** coisa a mudar na próxima. Uma, não cinco: correção em lote não vira hábito.

---

## A regra padrão (vale para toda call)

As sete travas. Call que quebra qualquer uma foi mal conduzida, mesmo que tenha vendido.

1. **Entrou com a preparação montada.**
2. **Entrou com número e piso decididos a frio**, e com a forma de pagamento pronta.
3. **Fez o combinado nos primeiros 3 minutos.**
4. **Perguntou antes de apresentar.** Nenhuma tela antes do diagnóstico.
5. **Fez a conta do problema em voz alta, com os números dele, antes de qualquer preço.**
6. **Perguntou a âncora antes de dizer o preço, e esperou a resposta em silêncio.**
7. **Saiu com ação concreta e data**, e registrou desfecho, ata e próximo passo no mesmo dia.

**Reprova automática:** preço antes da conta · reunião sem os números gravados · "vou pensar" sem data de retorno · cliente saiu sem proposta e sem próximo passo · perda sem motivo · jargão no lugar da linguagem do dono do outro lado.

---

## Treinamento do time

Roteiro completo em [`references/treino-role-play.md`](references/treino-role-play.md). Resumo:

- **Sessão de 60 minutos, 3 rodadas de role-play.** Uma pessoa vende, outra faz o cliente com ficha escrita, outra observa com o placar aberto.
- **Só se treina o bloco que está quebrando.** Rodada inteira só na primeira sessão. Depois, bloco isolado (a implicação é quase sempre o bloco fraco, porque é o que dá vergonha de fazer).
- **A persona não improvisa:** recebe a ficha com o número que vai dizer, a objeção que vai levantar e o momento de levantar.
- **Fecha com o boletim:** o placar de cada rodada e uma correção por pessoa.
- Base teórica: `doutrina-vendas` e SPIN. A versão escrita do SPIN está em `whatsapp-sales-process`. Aqui ela vira fala.

---

## Armadilhas

- **O roteiro existe e ninguém usa.** Se a preparação continua em branco, o problema é hábito, não o time.
- **Reunião sem ata.** Se a conversa não virou registro em 10 minutos, ela vai ser esquecida. O ganho da revisão some.
- **Sim verbal não é fechamento.** A venda estava certa e quase se perdeu depois de desligar, porque o link de pagamento não foi enviado ao vivo.
- **Transcrição automática erra número e corta fala sobreposta.** Silêncio no texto não prova silêncio na sala. Onde o placar depender de pausa (a âncora), diga "não dá para medir pela transcrição".
- **A etapa do funil diz "reunião marcada" e não há reunião na agenda.** É furo real: alguém moveu o registro e o convite nunca saiu.
- **Objeção de risco respondida com desconto.** Veja acima.
- **Treinar um processo que ninguém rodou uma vez.** Rode UMA call de verdade com o roteiro aberto antes de treinar o time.

---

## Primeira vez

1. Prepare UMA call real com o `preparacao.md`.
2. Rode a call com [`references/roteiro-da-call.md`](references/roteiro-da-call.md) aberto numa aba.
3. Nos 10 minutos seguintes: desfecho, ata, próximo passo com data.
4. Revise pelo placar e escolha uma correção para a próxima.
5. Só depois convoque o treino do time.

## Arquivos

| Arquivo | Quando ler |
|---|---|
| [`references/roteiro-da-call.md`](references/roteiro-da-call.md) | Antes de entrar. As falas, bloco a bloco |
| [`references/placar-da-call.md`](references/placar-da-call.md) | Depois, para revisar |
| [`references/treino-role-play.md`](references/treino-role-play.md) | Para rodar o treinamento |
