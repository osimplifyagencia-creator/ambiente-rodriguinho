# Modelo de relatório e auto-auditoria

Dois formatos de saída:
- **Rápido (1 ou 2 peças avulsas):** um bloco compacto na conversa. Não grava arquivo. Não mexe no histórico.
- **Lote (3 peças ou mais, ou pedido de relatório):** um arquivo `.md` em `anuncios/criativos/analises/`, mais a linha no histórico.

Pastas (crie se não existirem):
```
anuncios/criativos/
  entrada/AAAA-MM-DD/    <- as artes do lote (e um contexto.md opcional)
  analises/              <- relatórios e historico-designer.md
  radar/                 <- RADAR-ATUAL-AAAA-MM-DD.md
```
O `contexto.md` do lote, se existir, traz: objetivo da campanha, público da peça (frio, morno ou remarketing), placement previsto, legenda que vai junto e a oferta.

---

## 1. Bloco rápido (na conversa)

Mesma rubrica completa (inventário e gate incluídos). Só muda o formato.

```
ANÁLISE RÁPIDA | <data> | perfil: ENGAJAMENTO | sem conta conectada
#1 <arquivo> | nota 7,6 | AJUSTA (D6 abaixo de 6)
Inventário: 4:5, 1080 x 1350. Título: "..." Rosto olhando para a câmera. Prova: N2. Origem: foto própria.
D1 8 · D2 8 · D3 9 · D4 7 · D5 6 · D6 5 · D7 8 · D8 7
Conta: (8x25 + 8x10 + 9x10 + 7x5 + 6x10 + 5x10 + 8x15 + 7x15) / 100 = 7,6
Gate: passa (nenhum item).
MANTER: ...
MUDAR: (1) problema -> instrução concreta
TESTAR: hipótese -> faixa -> como medir
Prognóstico: seguro para rodar
Mensagem para quem produz: (texto curto, sem jargão)
```

---

## 2. Estrutura do relatório de lote (.md)

```
# Análise de criativos | Lote <AAAA-MM-DD>

0. CAPA: data, modo, nº de peças, público e objetivo declarados, perfil de nota, cartão de nicho usado,
   radar consultado (data), fonte dos números (conta + período, ou "sem conta: [INSERIR]")
1. RESUMO: nota média, quantos SOBE / AJUSTA / REFAZ, os 3 vícios que mais se repetem, 1 frase de direção
2. DNA DA CONTA (só com conta): vencedores e perdedores com números, e o que isso implica para o lote
3. PEÇA A PEÇA, um bloco por criativo:
   ## #N <arquivo> | <nota> <VEREDITO>
   - Inventário (inclui o texto da arte, a origem, o nível de prova N0 a N5, o status de fidelidade ao brief)
   - Notas D1 a D8 com 1 linha de justificativa cada (D1/D6/D8 citam a faixa esperada; D1/D2 nomeiam o padrão de gancho)
   - Gate: PASSA ou REPROVA (item, norma, correção). Inclui o gate de autenticidade
   - MANTER (1 a 3) · MUDAR (até 5, com o COMO e o título candidato) · TESTAR (1 a 2, hipótese falsificável)
   - Prognóstico (aposta de vencedor / seguro / vale o teste) com a faixa-alvo
4. RANKING: # | arquivo | nota | veredito | maior força | maior alavanca
5. MATRIZ ÂNGULO x NÍVEL: células cobertas (x) e descobertas (vazio) para frio, morno e remarketing
5.1 COBERTURA DE FORMATO: 1:1, 4:5 e 9:16 (apontamento de produção, não da peça)
5.2 COERÊNCIA DO LOTE: as peças parecem da mesma marca? O lote só PARA ou também SEGURA e COMPARTILHA?
5.3 EVOLUÇÃO: vícios do lote anterior RESOLVIDOS ou PERSISTENTES (veja o histórico)
5.4 RECEITA DO PRÓXIMO VENCEDOR (sempre)
5.5 ITERAÇÃO DE VENCEDORES e RECOMENDAÇÃO DE VERBA (só com conta)
5.6 RADAR E SUGESTÕES DE ENGAJAMENTO: tabela do radar, cada sugestão com o nível que ataca, a peça perene que recebe o lead e o nível de risco
6. PLANO DE EVOLUÇÃO: as 3 prioridades (vêm dos vícios que se repetem, não dos erros pontuais), cada uma com um exercício
7. CHECKLIST ANTES DE ENTREGAR (quem produz roda sozinho):
   [ ] A 360 px o título se lê e o gancho comunica?
   [ ] UMA promessa e UMA ação (verbo mais destino)?
   [ ] O ângulo casa com o público (frio = dor, morno = mecanismo, remarketing = oferta)?
   [ ] A prova é MOSTRADA, não adjetivo?
   [ ] Título e chamada fora das zonas seguras (9:16: topo ~14%, rodapé ~20%)?
   [ ] O gate do nicho passa (saúde: sem promessa de resultado, sem diagnóstico implícito)?
8. PENDÊNCIAS: todos os [INSERIR] numa lista só, cada um com quem fornece e para quê
9. MENSAGEM PARA QUEM PRODUZ: texto de WhatsApp copiável (abre pelo acerto, aponta o essencial sem jargão como "D3", termina com o caminho do relatório). Também vai na resposta da conversa.
```

**Vídeo ou carrossel no lote:** a ressalva de profundidade é obrigatória no relatório e na mensagem (veja `references/video-retencao-e-viral.md`).

Regras do relatório:
- Número sempre com fonte e período ("CTR 1,8%, últimos 30 dias, pela API"). Sem conta, a seção 2 vira o resumo da Biblioteca de Anúncios, com a ressalva de que ela não mostra desempenho.
- Quem lê é quem produz a arte. Direto, técnico, respeitoso. Zero ironia.
- Depois do relatório, acrescente uma linha em `anuncios/historico.md`: data, lote, distribuição de veredito, caminho do arquivo.

---

## 3. historico-designer.md (acumulador; atualize a cada lote)

Arquivo: `anuncios/criativos/analises/historico-designer.md`. Uma linha por lote. Análise rápida **não** entra (para não poluir a série com peças avulsas).

```
| Data | Lote | Peças | Nota média | SOBE / AJUSTA / REFAZ | Vícios principais | Vícios anteriores | Resultado reportado (lead, conversa, venda; fonte) |
|---|---|---|---|---|---|---|---|
| 2026-10-05 | entrada/2026-10-05 | 5 | 6,2 | 1/3/1 | chamada genérica; zero prova | (primeiro lote) | [INSERIR: perguntar ao dono] |
| 2026-10-19 | entrada/2026-10-19 | 4 | 7,1 | 2/2/0 | texto abaixo de 360 px | chamada genérica RESOLVIDO; zero prova PERSISTE | "prova -> 3 conversas, 1 fechou. Fonte: [INSERIR]" |
```

- **Vícios anteriores:** marque RESOLVIDO (aplicou o MUDAR e a peça nova não repete) ou PERSISTE.
- **Resultado reportado:** o que a aposta gerou de verdade, com fonte e data. Sem dado, `[INSERIR]`. Com conta, use o post-mortem, não duplique.
- Se a régua mudar entre dois lotes, a nota média só é indicativa. Compare **vícios**, não decimais.

---

## 4. Auto-auditoria: rode antes de entregar qualquer análise

Conta errada ou número inventado destrói a confiança mais rápido do que um feedback fraco.

**4.1 Cálculo à prova de erro**
1. Escolha o perfil e **declare** (ENGAJAMENTO por padrão; CONVERSÃO só para fundo de funil).
2. Multiplique cada nota pelo peso e some os 8 produtos. Divida por 100. Uma casa decimal. **Empate no meio sobe** (7,85 vira 7,9).
3. Escreva a conta na análise: `(D1xp + D2xp + ... + D8xp) / 100 = X,X`.
4. Três perguntas: a soma dos pesos deu 100? (25+10+10+5+10+10+15+15 e 20+10+15+5+10+15+15+10) Refiz a média e bateu? O número está entre a menor e a maior nota? Se estourou, há erro de soma.
5. Sempre as **8** dimensões. Só 7 notas = esqueceu a D8.
6. Para conferir, rode `Get-NotaCriativo -D <8 notas> [-Perfil CONVERSAO]` no `scripts/criativo-metrics.ps1`. Sem PowerShell, faça a conta à mão.

**4.2 Coerência entre veredito, nota e cor**
- Cor da nota final segue o veredito, não a faixa por dimensão. Nota 6,8 é AJUSTA, nunca verde.
- Nota de 7,5 ou mais com **qualquer** dimensão abaixo de 5 não é SOBE (no melhor caso, AJUSTA).
- D3 de 3 para baixo é REFAZ, mesmo com nota acima de 5,5.
- Gate reprovado é REFAZ, mesmo com nota 9. Inclui o gate de autenticidade.
- Todo SOBE tem `D6 >= 6` **e** (`D5 >= 6` ou prova coberta no lote). Senão rebaixe para AJUSTA.
- O perfil declarado bate com o objetivo da peça? Se não, justifique ou troque.

**4.3 Antes de salvar (qualquer "não" é corrigido primeiro)**
- [ ] Inventário feito em **toda** peça, antes da nota.
- [ ] Nenhum número inventado. Todo número veio da API, do perfil, do dono ou de busca com fonte. O resto virou `[INSERIR]`.
- [ ] Todo `[INSERIR]` tem dono e ação, e está na lista de pendências.
- [ ] Gate rodado em **todas** as peças, não só nas suspeitas.
- [ ] Conta de cada peça refeita e batendo. Veredito, nota e cor coerentes.
- [ ] D8 fundamentada: li o radar fresco e o calendário perene. Se não confirmei, marquei `[INSERIR: rodar o radar]` e pontuei só pelo eixo perene. Tendência já vencida foi descartada.
- [ ] Acurácia: o produto mostrado é o citado no texto? Afirmação verificável é verdadeira?
- [ ] Restrições da empresa (`empresa/PERFIL.md`) respeitadas **antes** de recomendar chamada ou contato na arte. Identidade julgada contra o perfil, não contra memória.
- [ ] Não universalizei uma regra de um caso (por exemplo "selo em toda peça"). Chamada na arte e prova por peça dependem de botão, placement, nível e restrições.
- [ ] Faixa esperada citada como **hipótese de mercado** quando não há conta. Nunca escrita como métrica da empresa.
- [ ] Origem declarada (estática, depoimento real ou encenado, IA, banco), com a fonte. Separei "IA feia" (craft) de "IA enganosa" (gate).
- [ ] Tom: abre pelo MANTER, avalia a peça e não a pessoa, no máximo 5 MUDAR.
- [ ] Vídeo ou carrossel: apliquei `references/video-retencao-e-viral.md` e escrevi a ressalva.
- [ ] Lote: relatório, linha no `historico-designer.md` e linha em `anuncios/historico.md`.

Se travou em algo factual sem fonte, a saída honesta é `[INSERIR]`. Nunca preencha com palpite para "completar" o relatório.
