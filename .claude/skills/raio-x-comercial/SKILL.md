---
name: raio-x-comercial
description: "Inspeção ponto a ponto da operação comercial (vitrine, atendimento, avanço, pós-venda, gestão) com nota de estrutura e de vazamento e plano de correção. Use quando: \"onde estou perdendo venda\", \"faz o raio-x\". Não é: funil novo (arquiteto-de-funis) nem anúncio (pre-voo-de-trafego)."
---

# Raio-X da Máquina Comercial

Método de inspeção da operação comercial da sua empresa. É o motor do ciclo **diagnosticar, corrigir, escalar**.

**Dados da empresa:** o que ela vende, para quem, canais e equipe vêm de `empresa/PERFIL.md`. Os relatórios ficam em `gestao/raio-x/AAAA-MM-DD.md`.

## Para que serve

Diagnóstico comercial vira opinião quando não tem gabarito. Esta skill existe para que **duas pessoas diferentes, olhando a mesma operação, cheguem à mesma nota**, e para que cada nota ruim já saia com correção, dono e prazo.

O objetivo final não é o relatório. É **saber onde corrigir primeiro**, para não gastar energia otimizando o fundo de um funil que vaza no topo.

---

## Regra de ouro

**Todo ponto de inspeção precisa passar no filtro: "se eu corrigir isso, algum número muda?"**

Se a resposta é não, o ponto sai do gabarito. Checklist que não move número é burocracia, e burocracia mata o método na terceira semana, quando a operação aperta.

---

## As duas notas (o coração do método)

Cada estação da jornada recebe **duas notas independentes**. É a diferença entre este método e um checklist comum.

| Nota | O que mede | De onde vem | Natureza |
|---|---|---|---|
| **ESTRUTURA** | A peça existe e está boa? | Gabarito de inspeção (olhar, abrir, ler, testar) | Auditável |
| **VAZAMENTO** | Quantos entraram x quantos avançaram? | CRM, planilha, analytics, dado real | Objetiva |

**Por que as duas:** uma estação pode passar no checklist e mesmo assim vazar (um script impecável que ninguém segue) ou reprovar no checklist e não vazar (bio feia, mas o cliente chega do mesmo jeito). O cruzamento é o diagnóstico real:

| | Vazamento baixo | Vazamento alto |
|---|---|---|
| **Estrutura OK** | Saudável: só escalar | **Problema de execução:** a peça existe, ninguém usa. Vira cobrança e treino, não construção |
| **Estrutura ruim** | Risco latente: conserte antes de escalar volume | **Prioridade máxima:** construir a peça E cobrar o uso |

> Nunca entregue a nota de estrutura sozinha. Sem o número do vazamento, o dono ouve "achei ruim" e derruba a recomendação.

---

## Escala de veredito (única, sempre a mesma)

| Símbolo | Significado | Gera correção? |
|---|---|---|
| ✅ | Existe e atende o padrão | Não: vira candidato a ESCALAR |
| 🟡 | Existe mas falha (incompleto, desatualizado, inconsistente) | Sim |
| ❌ | Não existe | Sim |
| ⬜ | Não se aplica a este negócio | Não: justifique por quê |
| ❔ | Não foi possível verificar (sem acesso ou dado) | Sim: vira pedido de acesso |

Nunca use nota de 0 a 10 nem "parcialmente ok". A escala fechada é o que torna as rodadas comparáveis ao longo do tempo.

---

## Anatomia de um ponto de inspeção

O campo **"Como verificar"** é obrigatório e é o que separa metodologia de lista de desejos. Sem fonte de evidência definida, cada auditor dá uma nota diferente.

```
ID          A1.3
Estação     Bloco 0 · Vitrine · Instagram
Padrão      Bio diz PRA QUEM é + O QUE faz + tem chamada de ação única
Verificar   Abrir o perfil, ler a bio, anexar print
Veredito    🟡
Evidência   "Corretor de imóveis SP": não diz o público nem tem chamada
Correção    Reescrever: público + o que entrega + link único
Dono        [quem]            Prazo   [data]
Impacto     Alto: afeta 100% de quem chega pelo conteúdo
```

**Impacto** (Alto, Médio, Baixo) não é achismo: é *quantas pessoas passam por esse ponto*. Um ponto que 100% dos contatos atravessam bate qualquer ponto de fundo de funil.

---

## Os 6 blocos da régua

A régua segue a jornada real de quem compra, não categorias abstratas. Gabarito completo em [`assets/gabarito-nucleo.md`](assets/gabarito-nucleo.md).

| Bloco | Estações | O que inspeciona |
|---|---|---|
| **0 · Vitrine** | Cada rede (Instagram, TikTok, Facebook, Google Meu Negócio, WhatsApp Business, site) | Existe, está coerente entre si e converte quem chega |
| **1 · Porta de entrada** | Do conteúdo até virar registro no CRM ou na planilha | O link funciona, a mensagem dispara, a origem é gravada |
| **2 · Atendimento** | Primeira resposta, script, qualificação, follow-up | Prazo de resposta, roteiro, e o que acontece quando a pessoa some |
| **3 · Avanço** | Do qualificado ao contrato | Cada passagem, cada documento, cada etapa que trava |
| **4 · Pós-venda** | Entrega, acompanhamento, indicação | O que acontece depois do "sim" |
| **T · Motor de gestão** | Transversal | Higiene do CRM, rotina, metas, treino, dado |

> **Kit Vitrine.** O bloco 0 roda sozinho, sem o raio-x inteiro: [`assets/vitrine-de-bolso.md`](assets/vitrine-de-bolso.md) (10 pontos x Instagram, TikTok, Google Meu Negócio, WhatsApp e site) mais [`assets/vitrine-correcao.md`](assets/vitrine-correcao.md) (os moldes do conserto). É o primeiro passo fixo e a reinspeção de 30 em 30 dias. **Vitrine quebrada antes de subir anúncio é dinheiro no lixo.**

**Regra de priorização:** conserte a estação **mais cedo** que está quebrada. Vazamento nos blocos 0 e 1 torna inútil otimizar o bloco 3. Ache A restrição e sequencie a partir dela, e não pela quantidade de ❌.

---

## Núcleo e complemento de nicho

O gabarito tem duas camadas:

- **Núcleo** (`assets/gabarito-nucleo.md`): cerca de 100 pontos que valem para qualquer negócio que vende por atendimento.
- **Complemento de nicho** (`gestao/raio-x/complemento-do-nicho.md`): o que é específico do seu mercado (etapas próprias, exigências legais, objeções típicas, campos obrigatórios, números de referência).

Esta skill **não traz complemento pronto**. Se você ainda não tem, rode só o núcleo e anote os pontos específicos que apareceram. Depois monte o seu complemento seguindo [`references/como-criar-overlay-de-nicho.md`](references/como-criar-overlay-de-nicho.md). **Nunca invente pontos de nicho na hora.**

---

## Os 3 modos

### 1. DIAGNOSTICAR: a rodada 0

Linha de base completa. Roda uma vez no início (ou a cada trimestre).

1. **Carregar o contexto:** `empresa/PERFIL.md`, histórico em `vendas/` e `gestao/`, e o complemento de nicho se existir.
2. **Puxar o dado antes de opinar:** números reais do CRM ou da planilha (volume por etapa, conversão etapa a etapa, tempo médio, campos vazios, duplicatas). Sem isso não existe nota de VAZAMENTO. Se o CRM tem acesso por API, a chave fica no `.env` da raiz (só o nome da variável vai para o chat, nunca o valor).
3. **Aplicar o gabarito inteiro**, bloco por bloco, com evidência em cada ponto.
4. **Calcular o vazamento por estação:** entraram x avançaram, em pessoas e, quando houver ticket, em reais.
5. **Cruzar as duas notas** e achar A restrição.
6. **Emitir o relatório** no modelo de [`assets/relatorio-template.md`](assets/relatorio-template.md).

Ponto que não pôde ser verificado é ❔, nunca ✅. Não preencha lacuna com suposição.

### 2. CORRIGIR: as rodadas de reinspeção

Cadência semanal (ou a que você definir). **Só reinspeciona o subconjunto vital**, os pontos marcados ⭐ no gabarito (cerca de 25 a 37) mais tudo que estava ❌ ou 🟡 na rodada anterior.

1. Reinspecione o subconjunto e atualize os vereditos.
2. Atualize o número de vazamento das estações tocadas.
3. **Registre o que dependia de terceiros e não veio** (acesso, dado, conteúdo, engajamento do time). Fica por escrito no relatório da rodada.
4. Repriorize: o que virou ✅ sai da fila, o que não moveu sobe.
5. Emita o relatório da rodada, sempre com **rodada anterior x atual**.

### 3. ESCALAR: o que já passou

Só entra aqui o que está ✅ **e** com vazamento baixo. Escalar peça quebrada multiplica o defeito.

Para cada ✅ estável, pergunte em ordem:
1. **Padroniza?** Vira script, modelo, documento.
2. **Automatiza?** Só depois de rodar à mão algumas vezes sem correção. Automação é a última camada.
3. **Dá volume?** Mais verba, mais conteúdo, mais gente fazendo a mesma coisa.

---

## Validação do próprio método

O método está em teste. No fim de cada ciclo de correções, **cada ponto de inspeção recebe um veredito de utilidade**:

| Veredito | Critério | Destino |
|---|---|---|
| **Provou** | Corrigir esse ponto mexeu num número | Fica no núcleo |
| **Não provou** | Corrigiu e nada mudou | Sai do gabarito ou vira ponto de nicho |
| **Inconclusivo** | Não deu para isolar o efeito | Fica marcado e revalida no próximo ciclo |

Registre em `gestao/raio-x/validacao.md` (modelo em [`references/validacao.md`](references/validacao.md)). Um gabarito que só cresce vira burocracia. Ele tem que **encolher** a cada ciclo.

---

## Cuidados

- **Nunca invente dado.** Número sem fonte é ❔. O valor do método é ser defensável.
- **Nunca dê nota de estrutura sem a nota de vazamento** ao lado.
- **Audite também o que depende de terceiros** (produção de conteúdo, equipe usando o CRM, agência). É onde mora o maior gargalo na maioria dos casos, e o registro por escrito evita discussão depois.
- **Separe problema de construção de problema de execução.** Peça que existe e ninguém usa não se resolve construindo de novo: se resolve com cobrança e treino.
- **Não entregue o relatório sem a priorização.** 40 itens vermelhos sem ordem paralisam.
- Dados pessoais de clientes (telefone, documento) que apareçam na inspeção não vão para o relatório.

---

## O que chamar depois do diagnóstico

| Achado | Skill que corrige |
|---|---|
| Funil ou etapas mal desenhados | `arquiteto-de-funis` |
| Script, cadência de follow-up, objeção | `whatsapp-sales-process` · `escada-negociacao` · `copiloto-whatsapp` |
| Reunião de venda que não fecha | `call-de-vendas` |
| Criativo e anúncio | `analisador-criativos` · `meta-ads-expert` · `pre-voo-de-trafego` |
| Copy no nível de consciência errado | `niveis-de-consciencia` |
| Perfil no Google | `google-meu-negocio` |
| Conteúdo das redes | `conteudo-da-empresa` · `carrossel` |
| Problema de caixa, margem ou contratação | `doutrina-financas` · `doutrina-gestao` |

---

## Recursos

| Arquivo | Quando ler |
|---|---|
| [`assets/gabarito-nucleo.md`](assets/gabarito-nucleo.md) | Sempre que rodar DIAGNOSTICAR ou CORRIGIR |
| [`assets/vitrine-de-bolso.md`](assets/vitrine-de-bolso.md) | Kit Vitrine: só auditar as redes (10 pontos x 5 frentes, cerca de 10 min por perfil) |
| [`assets/vitrine-correcao.md`](assets/vitrine-correcao.md) | Junto com o de bolso: os moldes do conserto pronto |
| [`assets/relatorio-template.md`](assets/relatorio-template.md) | Ao emitir qualquer relatório |
| [`references/como-criar-overlay-de-nicho.md`](references/como-criar-overlay-de-nicho.md) | Para criar o complemento do seu nicho |
| [`references/validacao.md`](references/validacao.md) | Ao fechar um ciclo |
