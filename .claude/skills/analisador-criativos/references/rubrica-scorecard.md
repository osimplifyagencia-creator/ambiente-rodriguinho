# Rubrica: inventário, 8 dimensões, gate e veredito

Toda peça passa por esta ordem: **inventário, 8 dimensões, gate de compliance, veredito, feedback**. O norte é **engajamento a serviço da venda**. Curtida que não leva o lead para a conversa não conta.

---

## 0. Inventário (antes de qualquer nota)

Descreva a peça sem julgar. Nota sem inventário é chute.

1. **Formato e proporção.** Medida real em px (script `scripts/criativo-metrics.ps1`, função `Get-CriativoInfo`; nunca a olho), proporção (1:1, 4:5, 9:16), peso do arquivo e placement provável. Lado menor abaixo de 1080 px já é apontamento de craft.
2. **Texto da arte, letra por letra**, na ordem em que o olho lê (título, apoio, selo, rodapé, chamada).
3. **Elementos:** produto (real ou de banco), pessoa (rosto, olhar), cenário, cores, logo, selos.
4. **Hierarquia percebida:** o que o olho vê em 1º, 2º e 3º lugar.
5. **Área de texto** estimada (% do quadro).
6. **Chamada para ação:** existe? Onde, com que verbo, para que destino.
7. **Prova que aparece** e o nível dela (N0 a N5, em D5).
8. **Origem e artefatos de IA.** Diga como a peça foi feita: estática própria, depoimento real, depoimento encenado, gerada por IA, editada por IA ou banco de imagem. Diga **quem informou** ("você disse" ou "deduzi pelos sinais"). Se há ou parece haver IA, rode o checklist da seção 6. **Descreva, não acuse.**

---

## 1. As 8 dimensões

Escala 0 a 10. Âncoras: 0-2 ausente ou errado · 3-4 fraco · 5-6 mediano · 7-8 forte · 9-10 referência.

### D1. Gancho que para o dedo (peso 25)
O trabalho nº 1 da peça. No feed ela aparece com cerca de 360 px de largura, ao lado de foto de família e meme.
- **Teste da miniatura:** reduzida a 360 px, o gancho ainda se lê?
- O primeiro elemento visto carrega o gancho inteiro?
- Recursos que param o dedo: contraste, rosto e olhar, quebra do padrão do feed, número específico, tensão visual. Peça "bonita de parede" fica em 3 ou 4.
- **Nomeie o padrão de gancho** (`references/biblioteca-de-hooks.md`) na justificativa: "gancho de espelho da dor, sem especificidade".
- Com conta, ancore no **thumbstop** real (3 s de vídeo ÷ impressões). Sem conta, cite a faixa esperada como hipótese (`references/performance-e-limiares.md`).

### D2. Promessa única e clara (peso 10)
- **Teste do estranho:** em 3 segundos alguém de fora diz o que é, para quem e qual o benefício?
- É **uma** promessa. Peça que mistura ângulos fica em 4 no máximo.
- Concreta (cena, resultado, número) ou abstrata ("qualidade de vida")? Abstração dá teto 5.
- **Exceção de desejo:** em peça de desejo ou identidade para público frio, a promessa aspiracional pode ser a copy certa. Não rebaixe D2 por "abstração" nem cobre prova. A diferença é a cena: "o instante antes de sair de casa" pinta algo específico, "produtos que conquistam o mundo" não diz nada.
- Se há legenda, arte e legenda contam a **mesma** promessa.

### D3. Ângulo x nível de consciência (peso 10). É a que mais reprova.
Exige saber o público da peça. Doutrina: `niveis-de-consciencia`.

| Público | Nível | Ângulo certo |
|---|---|---|
| Frio (interesses amplos, público aberto) | não sabe do problema ou sabe do problema | dor, identificação, história. Nunca oferta nem preço |
| Morno (engajou, visitou o site) | conhece a solução | mecanismo único e prova: "por que este e não os outros" |
| Quente (lead, carrinho, viu preço) | conhece a oferta | oferta direta, escassez real, texto curto |

- Erros fatais (D3 de 3 para baixo força REFAZ): oferta ou preço para público frio; peça "educativa" para remarketing; explicar o problema a quem já conhece o produto.
- 9-10: conversa exatamente com o estado mental do público e ainda sobe o lead um nível.

### D4. Sofisticação do mercado (peso 5)
- Estágio 1-2 (pouca gente promete o mesmo): promessa direta funciona.
- Estágio 3 ou mais (todos prometem o mesmo): lidere com **mecanismo único**. Promessa nua tem teto 4.
- Estágio 5 (mercado cético): vende identidade e experiência.
- Regra: quanto mais saturado, menos se promete e mais se mostra como funciona.
- Leia o estágio olhando a Biblioteca de Anúncios do Meta (anúncios de concorrentes do nicho e da cidade). Ela mostra os anúncios, não o desempenho deles.

### D5. Prova (peso 10)
Prova é **mostrada**, não afirmada. Registre o nível no inventário.

| Nível | Prova | Exemplo |
|---|---|---|
| N5 | pessoa ou cliente **real**, identificável, depondo, com permissão | vídeo de cliente real mostrando o resultado |
| N4 | demonstração do mecanismo acontecendo | embalagem abrindo, tela do exame, antes e durante real |
| N3 | depoimento com nome, rosto e permissão | print de avaliação, cartão de depoimento |
| N2 | número ou dado específico e verificável | anos de mercado, nota no Google, nota fiscal |
| N1 | selo ou distintivo gráfico | "entrega garantida" de canto |
| N0 | adjetivo ("o melhor", "100% original") | **não pontua** |

- Quem **finge** ser cliente real (ator, estúdio) tem teto N3 e pode cair no gate de autenticidade (seção 2).
- Peça de público frio sem prova pode ser escolha de ângulo. Não puna duas vezes: se D3 é 7 ou mais com público frio, D5 recebe no mínimo 6 e o fato vai para o MANTER.
- **Prova é requisito do lote e do funil, não selo em toda peça.** Obrigatória na peça de objeção e no funil de público morno e quente. Opcional na peça de desejo, desde que outra peça do lote cubra a prova. Selo de canto é um formato de prova, não a definição dela. Não mande "colar selo" em peça de desejo premium se isso barateia a hierarquia.

### D6. Chamada para ação (peso 10)
Três coisas diferentes. Não misture.
- **CTA do botão:** a ação nativa do anúncio ("Enviar mensagem", "Cadastre-se", "Ligar"). Se o botão já entrega a ação, D6 está cumprido. A chamada escrita na arte vira opcional, nunca exigência.
- **CTA na arte:** exigido só quando não há botão claro ou o destino é um link (site, post orgânico).
- **Oferta não é CTA.** Frete, prazo, preço e bônus são motivadores e vivem na legenda. Sua ausência na arte não é apontamento se a legenda traz.
- Quando a chamada na arte é avaliada: **uma só**; verbo mais destino ("Agende no WhatsApp") vale mais que "Saiba mais" (teto 5); casada com o nível (frio, convite leve; quente, ação direta).
- Arte, legenda e botão apontam para a **mesma** ação.
- Antes de pôr "adicionar CTA na arte" no MUDAR, confira o objetivo da campanha e as restrições da empresa em `empresa/PERFIL.md`. Se o botão já faz o trabalho, vira no máximo um TESTAR.

### D7. Craft e leitura no celular (peso 15)
O ofício. A dimensão mais fácil de "alucinar", por isso **ancore em medida antes da nota**.

| Medida | Como obter | Piso (vira apontamento automático) |
|---|---|---|
| Contraste texto e fundo | `Get-ContrastRatio` com a cor do texto e a cor do fundo **local** atrás dele | título abaixo de 3:1 ou corpo abaixo de 4,5:1: D7 com teto 5 e MUDAR "faixa ou placa atrás do texto" |
| Tamanho mínimo da letra | altura da caixa de texto ÷ altura do quadro | título abaixo de cerca de 3,5% ou apoio abaixo de cerca de 2,2%: ilegível a 360 px, MUDAR "aumentar" |
| Área de texto | `Get-CraftInfo` (densidade) e estimativa visual | acima de cerca de 40%: alerta de que o texto compete com o gancho (pode ser escolha consciente) |
| Zona segura 9:16 | título e chamada fora do topo (~14%) e do rodapé (~20%) | dentro da faixa coberta pela interface: MUDAR "reposicionar" |

- A medida ancora, o olho decide o resto (composição, recorte, identidade).
- **Contraste exato exige a cor do fundo local.** Dourado sobre preto chapado passa. Dourado fino sobre foto de meio-tom falha. Quase sempre o MUDAR certo é uma faixa ou placa atrás do texto.
- A Meta **não** tem limite numérico de texto em imagem (a regra dos 20% acabou). O critério é leitura a 360 px.
- Hierarquia: título, apoio, selo, rodapé, chamada. Tudo disputando é nada ganhando.
- Identidade: fonte, cor e logo coerentes com a marca (`empresa/PERFIL.md`). Só é defeito se contradiz o que está lá.
- **Origem da imagem:** foto própria (o teto depende só da execução), banco ("cara de banco" atrapalha o gancho), IA (checklist da seção 6; um defeito visível tira 2 pontos; defeito no herói da peça dá teto 3 em D7).
- **Acurácia:** o produto mostrado é o produto citado? Preço, especificação e nome batem? Divergência derruba D7. Se o texto engana o lead (vende "original" mostrando outro item, número falso), **sobe para o gate**.
- **Craft nunca reprova sozinho.** Só o gate reprova. Contraste ou letra ruim = AJUSTA com MUDAR. O único caminho de craft para REFAZ é a nota final cair abaixo de 5,5.

### D8. Momento, tendência e compartilhamento (peso 15)
Dois eixos que se somam. Um basta para o 5-7. Os dois juntos dão o 9-10.
- **a) Momento:** a peça pega uma data comercial, evento, onda cultural, formato ou assunto da cidade que esteja **vivo agora**? Conecta com a oferta? "Tendência pela tendência" é vaidade e não pontua alto.
- **b) Compartilhável:** alguém mandaria para um amigo, marcaria ("isso é você") ou salvaria? Cara de conteúdo nativo vale mais que cara de anúncio. Identificação forte é compartilhável sem tendência ao vivo.
- **Surfe o assunto, nunca o ativo protegido.** Se o oportunismo quebra o gate do nicho, quem manda é o gate. Veja `references/video-retencao-e-viral.md`.
- Âncoras: 8-10 momento vivo, compartilhável e ligado à oferta, dentro do gate · 5-7 sem tendência ao vivo mas muito relatável · 0-4 atemporal, genérico, cara de catálogo.

### Leitura de retenção (sem dimensão nova)
**D1 = PARAR · D7 = SEGURAR · D8 eixo b = COMPARTILHAR.** Leia as três juntas na justificativa. "Parou e não segurou" é gancho órfão e vira MUDAR. Detalhes em `references/video-retencao-e-viral.md`.

---

## 2. Gate de compliance (passa ou reprova)

Gate reprovado = **REFAZ**, mesmo com nota 9. Diga o item e a correção. Rode em **todas** as peças.

**Meta, todos os nichos**
- **Atributo pessoal:** não afirmar nem insinuar que quem vê tem uma condição ("Você tem diabetes?"). Reescreva para o serviço ("Acompanhamento de...").
- **Saúde pessoal e peso:** antes e depois e foco em "defeito" do corpo são restritos. Resultado irreal ou garantido reprova.
- **Afirmação enganosa, sensacionalismo, isca de clique.** Inclui mostrar um produto e citar outro, preço ou especificação que não confere.
- **Marca de terceiros:** só com produto real e sem se passar pela marca.
- **Imagem de pessoas:** direito de uso. Pessoa real exige autorização expressa. Banco de imagem precisa de licença.
- **Áudio (vídeo):** música em alta no TikTok ou Reels **não** é licenciada para anúncio pago. Serve no orgânico. No anúncio, use a biblioteca comercial. Código: `META-AUDIO-NAO-LICENCIADO`.

**Gate de autenticidade (todos os nichos)**
- **Depoimento encenado** (`UGC-FABRICADO`): ator ou estúdio fingindo ser cliente real para vender procedência ou resultado. Depoimento real é prova (N5). Ator declaradamente publicitário é aceitável. Ator se passando por cliente não é.
- **Realismo enganoso de IA** (`IA-REALISMO-ENGANOSO`): avatar ou voz sintética simulando pessoa real, ou rosto e "depoimento" gerados por IA apresentados como verdadeiros, sem aviso. Pesa em saúde e em procedência. A Meta pede rótulo para conteúdo realista feito ou alterado por IA em temas sensíveis. **IA bonita e honesta não é gate.** Gate é a IA que engana sobre quem ou o quê.
- Produto descaracterizado por IA cai em afirmação enganosa.

**Nicho saúde (bloco extra)**
- Sem promessa ou garantia de resultado, sem "o melhor" nem superlativo, sem sensacionalismo. Se aparece profissional, nome e registro no conselho.
- Antes e depois: a regra não proíbe a imagem em si, reprova o **enquadramento**. Passa: sem promessa, sem superlativo, sem exagero ("ficou assim", nunca "vai ficar assim"). A política da Meta para saúde pessoal é mais dura que a do conselho. Sinalize os dois riscos separados.
- Procedimento sensível: sem promessa de resultado nem de prazo. Fale em avaliação individual.
- Sem nome comercial de medicamento ou produto controlado.

**Outros nichos**

| Nicho | Gate típico |
|---|---|
| Estética | antes e depois e promessa corporal |
| Finanças e renda | promessa de ganho ("lucre R$ X") |
| Imóvel, emprego, crédito | categoria especial de anúncio (segmentação limitada) |
| Bebida, idade restrita | segmentação etária obrigatória |

Nicho sem regra conhecida: veja a árvore em `references/cartao-de-nicho.md`. Nunca invente regulador.

---

## 3. Cálculo e veredito

| Dim | ENGAJAMENTO (padrão, topo de funil) | CONVERSÃO (fundo de funil, remarketing) |
|---|---|---|
| D1 Gancho | 25 | 20 |
| D2 Promessa | 10 | 10 |
| D3 Ângulo x nível | 10 | 15 |
| D4 Sofisticação | 5 | 5 |
| D5 Prova | 10 | 10 |
| D6 Ação | 10 | 15 |
| D7 Craft | 15 | 15 |
| D8 Momento | 15 | 10 |
| **Soma** | **100** | **100** |

Nota = soma de (nota x peso) ÷ 100, uma casa decimal, **empate no meio sobe** (7,85 vira 7,9). Declare o perfil usado. Na dúvida, ENGAJAMENTO. Sempre as 8 dimensões. O script `Get-NotaCriativo` faz a conta.

| Veredito | Quando |
|---|---|
| **SOBE** | nota 7,5 ou mais, nenhuma dimensão abaixo de 5, gate ok **e** trava de conversão |
| **AJUSTA** | nota de 5,5 a 7,4; ou até 2 dimensões fracas que se corrigem sem refazer o conceito; ou falhou na trava de conversão |
| **REFAZ** | nota abaixo de 5,5; ou D3 de 3 para baixo; ou gate reprovado |

**Trava de conversão do SOBE:** `D6 >= 6` **e** (`D5 >= 6` **ou** a prova está coberta em outra peça do lote). A nota 8D pesa craft e momento, que preveem engajamento, não compra. Sem essa trava, uma peça linda com chamada e prova fracas queima verba. Quem carrega o sinal de conversão é a trava mais o prognóstico, não a nota nua.

Cor da nota final segue o veredito (verde SOBE, amarelo AJUSTA, vermelho REFAZ). Por dimensão: vermelho 0-4, amarelo 5-6, verde 7-10. Uma nota 6,8 é amarela.

---

## 4. Feedback: MANTER, MUDAR, TESTAR

- **MANTER (1 a 3):** o que está forte e vira padrão. Sempre abre o feedback.
- **MUDAR (no máximo 5, por impacto):** problema, depois instrução concreta (o quê, como, onde na peça).
  Ex.: "Título ilegível na miniatura. Aumente para cerca do dobro e ponha uma faixa escura semitransparente atrás, no terço superior."
- **TESTAR (1 a 2):** variação com hipótese que dá para **falsificar**: qual métrica deve mexer, em que faixa e como medir. Ex.: "Versão liderando com o mecanismo em vez da promessa. Hipótese: o CTR sai da faixa fraca para a mediana. Medir em cerca de 1.000 impressões e pelo menos 3 dias."
- Todo MUDAR ou TESTAR de D1 ou D2 cita o **padrão** da biblioteca e a **fórmula preenchida** com a oferta da empresa (no máximo 2 ou 3 títulos candidatos por peça, dentro do teto de 5). A skill dá munição, não reescreve a peça.
- **Nunca:** adjetivo sem instrução ("ficou fraco"), reescrever a peça inteira, passar de 5 mudanças.
- Tom: técnico e respeitoso. Avalie a peça, nunca a pessoa. Zero ironia.

---

## 5. Pontos do nicho em uma tabela

| Nicho | Prova que pontua | Chamada típica | Atenção |
|---|---|---|---|
| Saúde e clínica | estrutura real, equipe, anos, depoimento autorizado | "Agende sua avaliação" | gate completo; dor sim, diagnóstico implícito não |
| Varejo local e loja virtual | close do produto real, nota fiscal, frete e prazo concretos | "Chame no WhatsApp", "Peça o catálogo" | preço só para público quente |
| Atacado e B2B | a conta do lucro com números, depoimento de revendedor | "Peça a tabela" | gancho é dinheiro ou medo de perder reputação |
| Serviço local | obra ou resultado real, avaliações | "Peça seu orçamento" | nome da cidade na peça ajuda |

---

## 6. Checklist de artefato de IA (entra no inventário)

Procure quando a peça é, ou parece, gerada ou editada por IA. Descreva no inventário. A nota julga o que foi descrito.

- [ ] Mãos, dedos, olhos ou dentes deformados; número errado de dedos
- [ ] Texto na imagem com letra quebrada (a IA erra tipografia; fatal em anúncio)
- [ ] Sombra ou reflexo sem sentido físico
- [ ] Pele plástica, simetria estranha
- [ ] Produto ou logo da empresa descaracterizado (a acurácia produto = texto vale dobrado)
- [ ] Geometria impossível no fundo (linhas que se fundem, objetos derretendo)

Zero defeito visível a 360 px: IA neutra, julgue a composição como qualquer imagem. Um defeito visível: D7 menos 2. Defeito no **herói** (o produto vendido ou o rosto que depõe): D7 com teto 3. Se isso derrubar a nota abaixo de 5,5, o veredito é REFAZ **pela nota**; numa peça forte no resto, fica AJUSTA com MUDAR forte (gerar de novo ou usar foto própria).

**Separe sempre três coisas:** IA **feia** é craft (D7). IA **enganosa** é gate (`IA-REALISMO-ENGANOSO`). IA que usa **marca alheia** é propriedade intelectual (gate do nicho). Gerar com IA não é defeito. O alvo é qualidade e honestidade. Inferir IA nunca é acusação dura: escreva "sinais de geração por IA (dedos, texto quebrado)".

---

## 7. Coerência do lote (uma linha na visão de lote)

As peças parecem da mesma marca (paleta, grade, família de letra, tratamento de foto), entre si e contra o lote anterior? Deriva sem hipótese declarada é apontamento do **lote**, não da peça.
