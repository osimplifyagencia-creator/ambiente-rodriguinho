---
name: analisador-criativos
description: "Audita criativos de anúncio, antes de subir ou já no ar: nota por dimensão, veredito sobe, ajusta ou refaz, feedback e brief da próxima peça. Use quando: \"analisa esses criativos\", \"esse criativo tá bom?\". Não é: criar a arte (conteudo-da-empresa, carrossel) nem subir campanha (meta-ads-subir-anuncio)."
---

# Analisador de criativos: dirige a produção e julga o resultado

Esta skill faz duas coisas em ciclo fechado. **Dirige:** decide a aposta e escreve o brief da peça. **Julga:** audita a arte pronta e diz se sobe. Ela só **lê**. Nunca produz a arte nem sobe, pausa ou escala campanha.

Criativo de tráfego não é arte. É mídia de resposta direta, e você quer **venda**, não curtida. A peça é julgada pelo trabalho que faz: parar o dedo, falar com o nível de consciência do público, mostrar em vez de afirmar e puxar a ação que vira conversa. O norte é **engajamento a serviço da venda**. Engajamento de vaidade não conta.

Três ideias seguram a skill:
1. **A nota é hipótese, não adjetivo.** Cada nota de D1, D6 e D8 prevê uma faixa de métrica. Quando a peça roda, confere-se se acertou. Se a nota e o desempenho brigam, o desempenho manda e a régua se ajusta.
2. **A nota 8D não prevê compra por construção** (pesa gancho, craft e momento). Por isso o SOBE tem uma trava de conversão e cada peça recebe um prognóstico. Veja `references/rubrica-scorecard.md`.
3. **Feedback acionável.** Todo apontamento diz O QUE mudar e COMO, com a referência na peça. Feedback sem o como é só opinião. O objetivo é elevar quem produz, não vencer dele.

"Quem produz" aqui é quem faz a arte: designer, freelancer, você mesmo ou uma ferramenta de IA.

---

## Modos (detecte sempre primeiro)

| Modo | Gatilho | O que faz |
|---|---|---|
| **BRIEF** (dirigir) | "monta o brief dos criativos", "que criativo fazer para vender?" | Portfólio de 2 ou 3 apostas e uma ficha por aposta (`references/estrategia-e-brief.md`). Não há lote para auditar |
| **RÁPIDO** | 1 ou 2 peças avulsas, "essa tá boa para subir?" | Rubrica completa, resposta compacta na conversa, sem arquivo. Não pula inventário nem gate |
| **PRÉ-VOO** | você aponta um lote de artes | Cada peça antes de subir, com relatório `.md` |
| **AUDITORIA** | sem arte nova; a conta Meta está no ar | Puxa os anúncios e as métricas e avalia o que já rodou |
| **LOTE ANCORADO** | arte nova e conta com histórico | Pré-voo comparando com o DNA dos vencedores (o mais forte) |

Com conta conectada, o padrão é LOTE ANCORADO. Sem conta, PRÉ-VOO com a Biblioteca de Anúncios como referência de mercado.

---

## O ciclo (a skill é dona de 4 das 6 fases)

| # | Fase | Quem | O que |
|---|---|---|---|
| 1 | **Aposta** | a skill (BRIEF) | 2 ou 3 hipóteses: ângulo x nível x gancho x formato |
| 2 | **Brief** | a skill (BRIEF) | a aposta vira ficha acionável (imagem e vídeo) |
| 3 | Produção | quem faz a arte | fora da skill |
| 4 | **Auditoria** | a skill | rubrica 8D, gate, veredito, feedback e fidelidade ao brief |
| 5 | Subida e teste | você, com `meta-ads-subir-anuncio` e `meta-ads-expert` | fora da skill |
| 6 | **Aprendizado** | a skill | post-mortem (com conta) ou resultado reportado (sem conta); a aposta que vendeu vira base do próximo brief |

**Viés: produzir com convicção, não montar laboratório.** Com verba curta, suba a ideia mais forte e **leia o número real**. Teste A/B formal é exceção. A convicção vem do DNA da conta, do momento vivo e do gate.

**Ritmo sugerido (1 ciclo por semana):** segunda, brief · segunda e terça, produção · quarta, auditoria · quarta e quinta, subida · sexta, leitura do resultado. Conta sem verba: rode só o banco de apostas e segure a produção.

**Empresa que acabou de começar a anunciar:** o primeiro brief só sai **depois do pré-voo** (`pre-voo-de-trafego`). Brief sem pré-voo é aposta sem terreno, e sem público-alvo não existe D3, a dimensão que mais reprova criativo.

---

## Detecção de contexto (antes de qualquer análise)

1. **A empresa.** Leia `empresa/PERFIL.md`: nicho, oferta, ticket, público, cidade, diferencial, marca (logo e cores) e restrições (da conta, dos canais e do criativo). Antes de recomendar chamada ou contato na arte, confira as restrições. Julgue identidade contra o perfil, nunca contra memória. Sem perfil, pergunte o mínimo ou marque `[INSERIR]`. **Não invente** limitação nem identidade.
2. **A conta Meta.** Procure `META_AD_ACCOUNT_ID` no `.env` da raiz. Se não existe, registre `[INSERIR: conta de anúncio]` e siga em PRÉ-VOO. Para ler, use `meta-ads-expert`. Falta o token? `meta-app-e-acessos`. Nunca escreva valor de chave no chat nem em arquivo.
3. **As artes.** Convenção: `anuncios/criativos/entrada/AAAA-MM-DD/`. Aceita também imagem colada na conversa (leia cada uma com a ferramenta de leitura de imagem). No inventário, registre tipo (estático, vídeo, carrossel) e medida real em px com `scripts/criativo-metrics.ps1`, nunca a olho. Vídeo ou carrossel: leia `references/video-retencao-e-viral.md`.
4. **Contexto do lote.** Se houver `contexto.md`: objetivo, público (frio, morno, remarketing), placement e legenda. Com legenda, confira se arte e legenda contam a mesma promessa. Se a peça nasceu de uma ficha desta skill, confira a **fidelidade**: executou a aposta, desviou com hipótese ou desviou em silêncio (este último entra no MUDAR).
5. **Histórico.** Leia `anuncios/criativos/analises/historico-designer.md` e a análise anterior, se existirem.
6. **A única pergunta que vale:** para qual público (frio, morno ou remarketing) e com qual objetivo a peça vai rodar? Pergunte **uma vez**, num bloco só. O resto vira `[INSERIR]`. Sem público não há nota de D3.

---

## Fluxo de análise

### Fase 1. Terreno
Três fontes de ancoragem, na ordem:
1. **Conta Meta direta:** monte o **DNA da conta** (padrões dos vencedores e perdedores com números) e confira se a rubrica acerta os vencedores reais. Veja `references/performance-e-limiares.md`.
2. **Sem conta:** estime a **sofisticação do mercado** (estágio 1 a 5) na Biblioteca de Anúncios do Meta, aberta com `navegador-osimplify`. É leitura qualitativa, sem métrica.
3. **Nicho:** monte o **cartão de nicho** na hora (`references/cartao-de-nicho.md`). Não precisa de playbook.
4. **Momento:** rode ou atualize o **radar de tendências** (`references/video-retencao-e-viral.md`, seção 6). **Sem radar fresco, a aposta não sai.**

### Fase 2. Peça a peça (nesta ordem)
1. **Inventário**: descreva antes de julgar (medidas, texto, hierarquia, prova N0 a N5, origem e checklist de IA).
2. **Notas D1 a D8** (perfil ENGAJAMENTO por padrão) e **gate**, que inclui o de autenticidade. Nomeie o padrão de gancho na justificativa. Ancore D7 nas 4 medidas. Cite a faixa esperada de D1, D6 e D8. Leia PARAR, SEGURAR e COMPARTILHAR juntos.
3. **Veredito:** SOBE, AJUSTA ou REFAZ.
4. **MANTER / MUDAR / TESTAR.**
5. **Prognóstico** (nas peças SOBE e AJUSTA): aposta de vencedor, seguro para rodar ou vale o teste.

### Fase 3. Visão do lote
Ranking · os 3 vícios que mais se repetem · matriz ângulo x nível · cobertura de formato (1:1, 4:5, 9:16) · coerência de marca entre as peças · cobertura de retenção (o lote só PARA?) · diagnóstico diferencial (criativo, oferta ou página? Só com conta) · evolução contra os lotes anteriores · **receita do próximo vencedor** (sempre) · iteração dos vencedores e recomendação de verba (com conta).

### Fase 4. Entrega
- Lote: relatório `.md` em `anuncios/criativos/analises/analisador-criativos-AAAA-MM-DD.md`, mais uma linha em `historico-designer.md` e outra em `anuncios/historico.md`. Modelo em `references/modelo-de-relatorio.md`.
- Rápido: só o bloco compacto na conversa.
- Sempre: a **mensagem para quem produz** (texto de WhatsApp, sem jargão de rubrica como "D3").
- **Antes de fechar, rode a auto-auditoria** (`references/modelo-de-relatorio.md`, seção 4): pesos somam 100, conta batendo, veredito coerente, gate em toda peça, nenhum número sem fonte. Relatório com conta errada não sai.

---

## Mapa de referências

| Quando | Carregue |
|---|---|
| BRIEF (dirigir) | `estrategia-e-brief` · `biblioteca-de-hooks` · `video-retencao-e-viral` · `performance-e-limiares` (faixas e receita) · `cartao-de-nicho` |
| Detecção | `estrategia-e-brief` (fidelidade) · `video-retencao-e-viral` se houver vídeo ou carrossel |
| Terreno | `performance-e-limiares` · `cartao-de-nicho` · `video-retencao-e-viral` (radar) |
| Pontuação | `rubrica-scorecard` · `biblioteca-de-hooks` · `performance-e-limiares` (faixas e prognóstico) |
| Lote | `performance-e-limiares` (receita, iteração, verba, post-mortem) · `video-retencao-e-viral` (formato, retenção) |
| Entrega | `modelo-de-relatorio` |

Ajudante de cálculo: `scripts/criativo-metrics.ps1` (PowerShell). `Get-CriativoInfo` lê px, proporção e peso (jpg, png e webp). `Get-NotaCriativo` faz a média ponderada e aplica as travas do veredito. `Get-ContrastRatio` mede o contraste. `Get-CraftInfo` estima a densidade de detalhe. Carregue com `. .\scripts\criativo-metrics.ps1`. Sem PowerShell, faça a conta à mão: ela está explicada na auto-auditoria.

---

## Rubrica em resumo (detalhe e âncoras em `references/rubrica-scorecard.md`)

| # | Dimensão | Peso | Pergunta-chave |
|---|---|---|---|
| D1 | Gancho que para o dedo | 25 | A 360 px, a peça para o dedo no 1º segundo? |
| D2 | Promessa única e clara | 10 | Em 3 s dá para dizer o que é, para quem e qual benefício? É UMA promessa? |
| D3 | Ângulo x nível de consciência | 10 | O ângulo casa com o público (frio = dor, morno = mecanismo e prova, quente = oferta)? |
| D4 | Sofisticação do mercado | 5 | Promete onde devia mostrar como funciona? |
| D5 | Prova | 10 | A prova é MOSTRADA (N0 adjetivo até N5 cliente real)? |
| D6 | Ação | 10 | Há UMA ação clara? (o botão do anúncio conta) |
| D7 | Craft e leitura no celular | 15 | Hierarquia, contraste medido, letra mínima, zona segura, origem |
| D8 | Momento e compartilhamento | 15 | Surfa um momento vivo, ligado à oferta, compartilhável e dentro do gate? |
| Gate | Compliance | passa ou reprova | Meta, nicho, propriedade de terceiros, autenticidade |

Perfil CONVERSÃO (fundo de funil) usa pesos 20/10/15/5/10/15/15/10.

**Veredito**
- **SOBE:** nota 7,5 ou mais, nenhuma dimensão abaixo de 5, gate ok **e** a trava de conversão (`D6 >= 6` e (`D5 >= 6` ou a prova está coberta no lote)).
- **AJUSTA:** nota de 5,5 a 7,4, ou até 2 dimensões fracas que se corrigem sem refazer o conceito, ou falhou na trava.
- **REFAZ:** nota abaixo de 5,5, ou D3 de 3 para baixo, ou gate reprovado.

---

## Regras inegociáveis

- **Descreva antes de julgar.** Análise sem inventário alucina.
- **Nunca invente métrica ou comparação.** Número só vem da API, do perfil ou do dono. Sem fonte, `[INSERIR]`. Sem conta, o relatório diz que não há métrica sua.
- **O gate reprova sozinho.** Gate reprovado é REFAZ, mesmo com nota 9. Craft **nunca** reprova sozinho.
- **Acurácia.** O produto mostrado é o citado no texto. Se o texto engana o lead, sobe para o gate.
- **Uma promessa e uma ação por peça.** Dois pedidos concorrentes zeram a conversão. A ação pode estar no botão do anúncio.
- **Prova é mecanismo, não adjetivo.** E é requisito do lote, não selo em toda peça.
- **Não imponha regra de um caso a todos.** "Selo em toda peça" ou "chamada na arte" dependem de botão, placement, nível e das restrições do perfil.
- **No máximo 5 MUDAR** por peça, por impacto. **Abra o feedback pelo MANTER.** Avalie a peça, nunca a pessoa.
- **Uma pergunta de intake** (público e objetivo).
- **Só leitura.** Nenhuma chamada de escrita na Meta. Quem sobe e escala é você, com `meta-ads-subir-anuncio`.
- **IA: separe feia, enganosa e de terceiros.** Feia é craft. Enganosa é gate. A que usa marca alheia é propriedade. Gerar com IA não é defeito.
- **Vídeo é versão enxuta.** Diga sempre o que não foi lido (cena a cena).

---

## Quando usar e quando não

Use para: brief e aposta de criativo, auditar artes antes de subir, auditar o que já roda, comparar um lote novo com os vencedores, plano de evolução de quem produz, radar de tendências.

Não use para: escrever a copy de campanha (`niveis-de-consciencia` e `conteudo-da-empresa`), criar carrossel (`carrossel`), montar ou subir campanha, público e pixel (`meta-ads-expert` e `meta-ads-subir-anuncio`), decidir verba e escala (`doutrina-trafego`), montar o funil (`arquiteto-de-funis`).

## Integração

| Skill | Uso |
|---|---|
| `niveis-de-consciencia` | D3 e D4 são a matriz de Schwartz aplicada |
| `meta-ads-expert` | leitura da conta e limites de fadiga e custo |
| `pre-voo-de-trafego` | destrava o primeiro brief (público, ângulo, prova) |
| `doutrina-trafego` | escalar ou cortar, a partir da recomendação de verba |
| `arquiteto-de-funis` | quando o diagnóstico aponta oferta ou página, não criativo |
| `navegador-osimplify` | abrir a Biblioteca de Anúncios e as páginas do radar |

---

## Frases-âncora

- O criativo certo no nível errado é criativo errado.
- Mostrar vale mais que afirmar. Mercado saturado não acredita em adjetivo.
- Beleza não paga leilão. Clareza paga.
- Feedback sem o COMO é só opinião.
- O erro que importa é o que se repete no lote.
- Surfe o ASSUNTO, nunca o ATIVO protegido.
- A nota previu um número: ou a peça bate a faixa, ou a régua estava errada.
- Faixa sem fonte é chute com casa decimal.
- Peça linda com ação e prova fracas é falso positivo de verba.
- Não refaça o criativo que converte o clique se quem não converte é a página.
- Retenção é PARAR (D1), SEGURAR (D7) e COMPARTILHAR (D8) lidos juntos. Gancho órfão parou e não segurou.
- Assunto aberto sem fechamento é vaidade. Compartilhamento sem comprador é vaidade.
- Produzir com convicção bate laboratório de teste: o número real escolhe o vencedor, não a nota.
- Vencedor cansado se itera, não se mata.
- Tendência não mora na doutrina. Mora no radar, com data de validade.
