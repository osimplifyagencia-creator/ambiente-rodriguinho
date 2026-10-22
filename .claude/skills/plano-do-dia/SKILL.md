---
name: plano-do-dia
description: "O plano do dia em gestao/plano-do-dia.md: montar o dia com foco de 3, quebrar projeto em passos, marcar feito, fechar o dia e ver o andamento. Use quando: \"monta meu dia\", \"tô perdido\", \"terminei X\", \"quanto falta do projeto Y\". Não é: guardar reunião ou ideia (anotacoes)."
---

# Plano do dia

O dono tem muita coisa na cabeça e pouca clareza do que fazer primeiro. O que falta não é lista: é a **escolha**. Esta skill monta o dia em um arquivo simples, `gestao/plano-do-dia.md`, escolhe o que importa, marca o que foi feito e fecha o dia.

Tudo mora em arquivo de texto. Não há sistema nem banco: o que você escreve ali é o que ele vê, e o que ele marcar no arquivo você lê no próximo comando.

## Onde mora

| O quê | Onde |
|---|---|
| O plano do dia e os projetos em andamento | `gestao/plano-do-dia.md` |
| Metas do trimestre | `gestao/metas.md` (e `empresa/PERFIL.md`, seção Metas) |
| Rotinas fixas (toda segunda, todo dia 5...) | `gestao/rotinas.md` |
| Pendências que vieram de reunião | `anotacoes/` (busque por `- [ ]`) |

Dia de hoje: use a data do computador (`Get-Date` no PowerShell), fuso de São Paulo. Nunca chute a data.

## Formato do arquivo

```markdown
# Plano do dia

## Hoje: AAAA-MM-DD (dia da semana)

### Foco de 3
- [ ] 1. <verbo + objeto>  (30 min)  pronto quando: <o que precisa ser verdade>
- [ ] 2. ...
- [ ] 3. ...

### Se sobrar tempo
- [ ] ...

### Feito hoje
- [x] <item>  (feito às HH:MM, prova: <onde conferir>)

## Projetos em andamento

### <Nome do projeto>  (3 de 8 passos, 37%)
- [x] <passo feito>
- [ ] <próximo passo, cabe em 15 minutos>
- [ ] <passo>

## Histórico
### AAAA-MM-DD
Feito: ... | Ficou para amanhã: ... | Observação: ...
```

## As quatro regras que não se negociam

1. **Feito se lê da coisa, nunca do plano.** Anúncio publicado, mensagem enviada, arquivo salvo: isso é o que conta. Só marque `[x]` quando houver prova (onde conferir). Marcar sem prova é o que faz o plano mentir.
2. **Foco de 3.** O plano pode ter mais itens, mas só os 3 primeiros abertos são o foco. Nunca proponha mais de 3 de uma vez; o resto vai para "Se sobrar tempo".
3. **Prazo só quando alguém de fora cobra.** Não invente data de entrega para o que é só "quero fazer hoje". O dia planejado mora no plano; o prazo mora no item.
4. **Propor antes de gravar.** Mostre a quebra ou o foco, espere o "ok" (uma palavra basta) e só então escreva. Nunca conclua, cancele ou adie item real sem ele pedir. Exceção: o passo que você mesmo executou e provou pode ser marcado na hora.

## /dia: montar o dia

Quando ele diz "monta meu dia", "o que eu faço hoje", "tô perdido":

1. Leia `gestao/plano-do-dia.md`, `gestao/metas.md`, `gestao/rotinas.md` e, por busca, as pendências abertas em `anotacoes/`. Se o arquivo do plano estiver com a data de outro dia, trate primeiro o fechamento (seção abaixo).
2. Pergunte no máximo duas coisas, se faltar: quanto tempo ele tem hoje e se há compromisso fixo (reunião, visita).
3. Escolha o **foco de 3** pelo critério: (1) o que está pendurado há mais tempo e alguém cobra; (2) o que mais aproxima da meta do trimestre; (3) o que destrava outra pessoa ou outro passo. Rotina do dia (de `rotinas.md`) entra antes, se existir.
4. Mostre: os 3 do foco com tempo estimado (15, 30, 60, 120 ou 240 minutos), "pronto quando" de cada um, e o que ficou de fora. Pergunte "fecho assim?".
5. Com o ok, escreva no arquivo, na seção "Hoje".

O primeiro item do foco deve caber em 15 minutos. É ele que destrava o resto e tira o dono do "não sei por onde começar".

## /projeto: quebrar um projeto em passos

1. Ache o projeto: já existe em "Projetos em andamento"? Se sim, atualize; se não, crie.
2. **Tamanho.** Coisa de um dia com até 5 passos não é projeto: vira um item do dia. Projeto é o que tem fases ou vai durar dias.
3. Leia o estado real antes de escrever passo: `empresa/PERFIL.md`, as pastas `anuncios/`, `vendas/`, `conteudo/` e as anotações. O que já está feito entra marcado `[x]`. Checklist que nasce mentindo perde a confiança.
4. Cada passo tem **verbo + objeto** ("Gerar o token do Meta"), um "pronto quando" e, se existir, a skill que executa (`meta-app-e-acessos`, `carrossel`...). Passo que é só ligação ou mensagem fica sem skill.
5. Mostre a quebra (passos na ordem, tempo de cada um, total em horas) e espere o ok. Só então grave.
6. O percentual do projeto é **passos feitos dividido pelo total**. Recalcule sempre que marcar um passo; nunca escreva o número de cabeça.

## /feito: marcar o que foi feito

"Terminei X", "já fiz o 2":

1. Ache o item no plano (por número ou pelo texto).
2. Confira a prova: o arquivo existe, o anúncio está na conta, a mensagem saiu. Se não dá para conferir, pergunte "onde eu vejo isso?" e anote a resposta como prova.
3. Mova de "Foco de 3" para "Feito hoje" com hora e prova. Se for passo de projeto, marque `[x]` lá também e atualize o percentual.
4. Ofereça o próximo item do foco. Se o foco acabou, ofereça puxar de "Se sobrar tempo".

## /fechar: fechar o dia

1. Liste o que foi feito e o que ficou (leia o arquivo; não confie na memória da conversa).
2. Para cada item que ficou, pergunte uma vez: **amanhã, depois ou descartar**. Não decida sozinho.
3. Escreva no "Histórico" uma linha com a data, o que foi feito, o que ficou e uma observação se houver aprendizado.
4. Limpe o "Hoje" para o próximo dia. Os itens que ficaram vão para o topo do foco de amanhã (no máximo 3).
5. Se algo virou decisão ou ideia, ofereça guardar em `anotacoes/`.

## /andamento: quanto falta

"Quanto falta do projeto Y": leia a seção do projeto, conte os passos, diga o percentual, o que está feito, o próximo passo e o que está travado (e por quê). Se um passo está aberto há muito tempo, diga.

## Quando ele está perdido

"Tô perdido", "tanta coisa": não faça lista longa. Faça uma pergunta ("qual dessas, se não acontecer essa semana, dói mais?"), escolha o foco com ele e mostre só o primeiro item. Menos é mais.

## Checklist antes de entregar

- [ ] A data veio do computador.
- [ ] O foco tem no máximo 3 itens, e o primeiro cabe em 15 minutos.
- [ ] Todo item tem verbo, objeto e "pronto quando".
- [ ] Mostrei antes de gravar e esperei o ok.
- [ ] Item marcado como feito tem prova.
- [ ] O percentual do projeto foi recalculado, não chutado.
