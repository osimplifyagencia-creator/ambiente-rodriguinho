---
name: instruir
description: "Transforma um pedido solto numa instrução precisa e enxuta para a IA, inclusive o texto para a próxima sessão. Use quando: \"deixa essa instrução certa\", \"me manda o prompt pra outra sessão\". Não é: script de venda nem texto de anúncio (skills de vendas e anúncios)."
---

# Instruir: o compilador de pedidos para a IA

Pega o pedido solto do dono (do jeito que ele pensa e digita) e devolve a instrução compilada: precisa o bastante para acertar de primeira, enxuta o bastante para não gastar à toa.

**Princípio central:** o que faz a IA gastar tempo e dinheiro não é o tamanho do pedido. É ela explorar demais para "achar", fazer trabalho que ninguém pediu e as idas e voltas de "não era isso". Uma boa instrução mata as três coisas. Clareza é economia.

**Regra de ouro:** esta skill pratica o que prega. A saída é curta. Se a instrução compilada ficar maior que o pedido original, algo está errado.

---

## 1. Quando ativar (e quando não)

**Ativa** quando o dono cola um pedido solto e quer transformá-lo em instrução boa, ou usa um dos gatilhos acima.

**Não ativa** quando o pedido já está claro, pequeno e óbvio ("abre o arquivo X", "lista as pastas"). Nesse caso não compile: só execute. Diga numa linha "isso já está claro, seguindo direto" e faça.

Regra prática: só compile o que tem ambiguidade real, escopo aberto ou risco de gasto.

---

## 2. Os dois modos

| Modo | Quando | O que faz |
|---|---|---|
| **COMPILAR** (padrão) | "deixa isso certo", "melhora esse pedido" | Devolve a instrução compilada para ele colar ou rodar. Não executa. |
| **COMPILAR E RODAR** | "compila e já faz", ou pedido de baixo risco e sem ambiguidade | Mostra a versão curta e executa na sequência. |

Na dúvida, faça COMPILAR e pergunte "rodo agora?". Se houver ambiguidade que impede execução segura, pare sempre no COMPILAR.

---

## 3. O formato de saída

Devolva exatamente este bloco, curto e fácil de ler. Omita as linhas que não se aplicam (não invente conteúdo para preencher):

```
Objetivo: <o RESULTADO em 1 frase, não a tarefa>
Onde: <arquivo, pasta ou skill exatos, ou "descobrir: <pista concreta>">
Passos: <os mínimos passos concretos, na ordem>
Não fazer: <limites: o que preservar, não mexer, não expandir>
Rodar com: <direto | skill X | agente Y>
Pronto quando: <critério que dá para conferir>
Você define antes: <ambiguidades reais, só se existirem>
```

Se houver "Você define antes", pare e pergunte. Ambiguidade não vira invenção; vira pergunta curta.

---

## 4. As alavancas de economia

| Fonte de gasto | O que a instrução deve fazer |
|---|---|
| Exploração ampla (ler dezenas de arquivos para "achar") | Apontar o alvo exato: "em `anuncios/campanhas/X`". Se não sabe onde, dar a pista mais estreita, não "procura no projeto". |
| Conversa que incha | Mandar leitura pesada para um agente que lê e devolve só a conclusão. |
| Trabalho não pedido | "Não fazer" explícito: "mudança mínima", "não refaz o resto", "não gasta verba". |
| Idas e voltas ("não era isso") | "Pronto quando" que dá para conferir e "Objetivo" no resultado, não na ação. |
| Reinventar o que já existe | "Rodar com" aponta a skill certa (`meta-ads-subir-anuncio`, `copiloto-whatsapp`...) em vez de deixar a IA descobrir do zero. |
| Serial que podia ser paralelo | "Faça A, B e C, são independentes" numa tacada só. |
| Relatório que ninguém lê | Só peça a saída que você vai usar de verdade. |

---

## 5. As alavancas de precisão

- **Objetivo é resultado, não tarefa.** "Quero que o lead pare de esperar mais de 1 hora por resposta" é melhor que "mexe no script".
- **Contexto mínimo suficiente:** o trecho, o nome da campanha, o arquivo. Não a história toda.
- **Restrições explícitas:** o que preservar e o que não tocar costuma importar mais que o que fazer.
- **Critério de pronto que dá para conferir:** "a campanha existe na conta, pausada, com verba de R$ 30 por dia".
- **Ambiguidade vira pergunta, nunca suposição.**
- **Dinheiro e mensagem para cliente:** a instrução sempre diz "mostrar antes e esperar o ok".

---

## 6. Tamanho do pedido, tamanho do veículo

| Tamanho | Sinais | Veículo |
|---|---|---|
| **Trivial** | 1 arquivo, mudança óbvia | Direto. Muitas vezes nem compila. |
| **Busca** | "acha onde", "quais arquivos" | Um agente de busca devolve só a conclusão. |
| **Médio** | poucos arquivos, alguma decisão | Direto, com escopo fechado. |
| **Grande** | várias frentes | Quebrar em partes e rodar as independentes juntas. Avisar o custo antes. |

Sempre proponha o menor veículo que entrega o resultado. Comece embaixo.

---

## 7. Exemplos

### Pedido solto, escopo aberto

**Solto:** "vê aí o anúncio de limpeza que tá caro e arruma"

**Compilado:**
```
Objetivo: descobrir por que o anúncio de limpeza está com custo por contato acima do normal e propor o ajuste.
Onde: campanha de limpeza em anuncios/campanhas/ e os resultados dela (skill meta-ads-expert).
Passos: 1) ler os últimos 7 dias  2) comparar custo por contato com a média da conta  3) dizer se o problema é criativo, público ou verba.
Não fazer: não mexer na campanha, não pausar, não mudar verba. Só diagnosticar.
Rodar com: skill meta-ads-expert, depois conselheiro-trafego para a decisão.
Pronto quando: um parágrafo com a causa mais provável, o número que prova e uma única recomendação.
Você define antes: qual é o custo por contato aceitável para você? Se souber, me diz.
```

### Pedido que já dá para rodar

**Solto:** "põe o telefone da loja no perfil da empresa"

**Compilado:**
```
Objetivo: telefone da loja no empresa/PERFIL.md, no campo certo.
Onde: empresa/PERFIL.md, seção "Canais".
Passos: pedir o número, escrever no campo, ler de volta.
Não fazer: não mexer nas outras seções.
Rodar com: direto.
Pronto quando: o número aparece no arquivo.
```
Sem dúvida e de baixo risco: ofereço "rodo agora?".

---

## 8. Checklist antes de entregar

- [ ] A saída cabe em um bloco (não virou documento).
- [ ] "Objetivo" descreve resultado, não tarefa.
- [ ] "Onde" aponta alvo exato ou pista estreita.
- [ ] Tem ao menos uma alavanca de economia (escopo fechado, skill certa, agente de busca).
- [ ] Ambiguidade real virou pergunta, sem suposição inventada.
- [ ] "Rodar com" é o menor veículo que resolve.
- [ ] Se era trivial demais, não compilei: só executei.

Meta-lição: a melhor instrução é a que faz a IA fazer exatamente o necessário. Nem menos (retrabalho) nem mais (gasto). Toda linha que não muda o comportamento da IA é gordura: corte.
