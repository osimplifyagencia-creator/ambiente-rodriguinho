# Vídeo, carrossel, retenção e momento viral

Quatro assuntos que mexem em D1, D7 e D8 e que a análise de peça estática não cobre.

---

## 1. Vídeo: o que esta skill entrega e o que não entrega

**Regra de honestidade:** todo relatório que avalia vídeo diz o **nível de profundidade** usado. Sinal de gancho e ritmo não é leitura de cena. Não venda análise de vídeo como se fosse a do estático.

| Nível | Entrada | O que a skill faz | Ressalva obrigatória |
|---|---|---|---|
| Estático | imagem | rubrica 8D completa. Confiável | nenhuma |
| Vídeo (versão enxuta) | vídeo, roteiro ou só a capa | rubrica no **quadro de abertura** tratado como estático, mais leitura do gancho dos 3 s, do ritmo e da retenção. O roteiro é avaliado como copy. Saída marcada como **sinal** | "Análise de vídeo enxuta: quadro de abertura mais gancho e ritmo. Não há leitura cena a cena, nem de áudio sincronizado, nem da legibilidade de cada corte." |

**Método**
1. **Primeiro o quadro de parada.** O primeiro quadro (ou a capa) é o que para o dedo. Rode a rubrica inteira nele como se fosse um estático. Se o vídeo é um arquivo local e o `ffmpeg` existe, extraia o quadro com `-vframes 1`. Sem quadro e sem capa, analise só o roteiro e marque `[INSERIR: quadro de abertura]`.
2. **Gancho dos 3 s.** O que acontece nos 3 primeiros segundos prende (movimento, pergunta falada, texto grande, quebra de padrão)? É a D1 do vídeo. Abandono nos 3 s dá teto 4 em D1. Curva que despenca logo depois do gancho é **gancho órfão**: parou e não segurou. Curva quase plana até a chamada é sinal de vencedor.
3. **Ritmo e legenda.** Cortes na cadência do placement? Texto legível a 360 px e no tempo de leitura? Legenda embutida carrega a mensagem sem som (a maioria assiste mudo)?
4. **Onde cai.** Há um ponto óbvio de abandono (abertura lenta, logo primeiro, 3 s sem nada)? O MUDAR ataca esse ponto.
5. **Chamada** falada ou na tela, mais o botão do anúncio (D6).

**Como a rubrica se traduz no vídeo**
- D1 = quadro de parada **mais** gancho dos 3 s. Quadro forte com 3 s vazios ainda perde retenção.
- D2, D3, D4 = promessa, ângulo e sofisticação lidos no roteiro e no quadro.
- D5 = a prova aparece em cena (depoimento falado, demonstração, número na tela)? Vídeo é o melhor formato para prova mostrada. Cliente real depondo é o topo (N5).
- D6 = chamada falada ou na tela, mais o botão.
- D7 = edição, texto a 360 px, legenda embutida, qualidade da captação, zona segura. Vídeo feito por IA: rode o checklist de artefatos (rubrica, seção 6) nos cortes principais. Texto quebrado e mão ou rosto deformado são os defeitos mais comuns.
- D8 = formato ou trilha do momento é o ponto forte do vídeo. A vida útil é curtíssima.
- Gate extra: áudio em alta sem licença, depoimento encenado, avatar ou voz sintética se passando por pessoa real.

**Direção de vídeo no brief tem a mesma força da imagem.** O bloco de vídeo da ficha (`references/estrategia-e-brief.md`) entrega: gancho dos 3 s escrito, roteiro de 3 a 5 cenas (gancho, mecanismo, prova, chamada) simples para gravar no celular, o quadro de abertura, a divisão do que você grava e do que a edição ou a IA gera, e o áudio da biblioteca comercial. Dirigir é prescrever estrutura. Auditar exige ler cada cena, e isso a skill não faz.

---

## 2. Carrossel

Carrossel é uma sequência de estáticos com lógica. Analise:
1. **Card 1 (capa) com peso de gancho.** Ele para o dedo e decide o deslizar. Rode a 8D mais dura nele, principalmente D1.
2. **Cada card** pela rubrica, pesando a função dele: capa = gancho, meio = desenvolvimento e prova, último = oferta e chamada.
3. **O arco.** A sequência conta uma história que avança o lead (dor, mecanismo, prova, chamada)? Ou são N peças soltas? Sem arco é apontamento do lote.
4. **Nota do carrossel** = nota da capa ponderada pela coerência do arco. Capa 8 com arco quebrado não sobe como 8. Declare "nota de carrossel (capa mais arco)".

---

## 3. Cobertura de formato e placement (checagem do lote)

A matriz ângulo x nível pergunta "o lote cobre o funil?". Esta pergunta é outra: **"o lote cobre os lugares onde o anúncio aparece?"**

| Formato | Proporção | Onde aparece | Zona segura |
|---|---|---|---|
| Quadrado | 1:1 (1080 x 1080) | feed | nada cobrindo; texto legível a 360 px |
| Vertical de feed | 4:5 (1080 x 1350) | feed (ocupa mais altura, o padrão do feed) | topo e rodapé livres da interface |
| Vertical total | 9:16 (1080 x 1920) | stories e reels | **topo ~14% e rodapé ~20% cobertos** pela interface: título e chamada fora dessas faixas |

- Lote só em 9:16: falta versão 1:1 ou 4:5 para o feed. Rodar 9:16 no feed corta a arte.
- Lote só em 1:1: sem 9:16, não aparece em stories e reels.
- Ideal: cada conceito vencedor adaptado aos 3 formatos, com título e chamada **reposicionados** para as zonas seguras (não é só esticar a arte).
- **Não cobre 9:16 de quem entregou 4:5.** Falta de formato é apontamento de **produção**, não erro da peça que existe. Formato fora do padrão por escolha declarada não é vício.

---

## 4. Retenção: PARAR, SEGURAR, COMPARTILHAR

Retenção **não é uma 9ª dimensão**. É a leitura conjunta de D1 (para o dedo), D7 (segura) e D8 eixo b (compartilha). Sem mexer em peso nem em nota.

| Estágio | Quando | Trabalho | Indicador | Dimensão |
|---|---|---|---|---|
| PARAR | 0 a 1 s | interromper o scroll | thumbstop | D1 |
| SEGURAR | 1 s até o payoff | manter lendo ou assistindo até a mensagem entregar | retenção, tempo de leitura | D7 (mais a curva no vídeo) |
| COMPARTILHAR | no fim | virar alcance orgânico | compartilhar, salvar, comentar | D8 eixo b |

Peça que só para é thumbstop sem conversão. Peça que seria compartilhável mas não para, ninguém vê.

**Como SEGURAR no estático (4 alavancas)**
- **Hierarquia que conduz**: o olho vai do título ao apoio, à prova e à chamada. Tudo do mesmo tamanho não segura nada.
- **Assunto aberto no título** que só fecha lendo o resto.
- **Tensão visual**: algo que pede resolução (embalagem meio aberta, o antes sem o depois, pergunta sem resposta).
- **Payoff**: a peça entrega 1 coisa concreta em troca da leitura (1 número, 1 mecanismo, 1 verdade).

**Assunto aberto exige onde ele fecha.** Todo assunto aberto declara onde fecha: na própria peça, no deslizar do carrossel, no vídeo até o fim ou na conversa do WhatsApp. Gancho que abre e não fecha em lugar nenhum é isca de clique e vaidade. Calibre por nível: o frio abre com dor ou identidade, o quente abre com oferta ou urgência.

**Os 6 gatilhos de compartilhar** (todo gatilho passa no teste "puxa o comprador ou só alcance de quem não compra?")

| Gatilho | Por que a pessoa compartilha | Puxa comprador? |
|---|---|---|
| Identidade ("isso é você") | se reconhece e marca o amigo | sim, se o "você" é o público-alvo |
| Utilidade (salvar) | guarda para usar depois | sim: salvou = intenção |
| Status | compartilhar eleva quem compartilha | sim, em desejo ou premium |
| Emoção alta | indignação, orgulho, surpresa | só se a emoção liga à oferta |
| Prova relatável | "olha o que aconteceu" | sim: prova compartilhada converte |
| Pedir comentário | "comenta EU que eu mando" | sim: qualifica e ativa o algoritmo |

**Regra de saída (muda a narrativa, não a nota).** Na justificativa, leia os 3 estágios juntos: "D1 8 PARA forte, mas D7 6 não SEGURA (hierarquia plana, sem assunto aberto): gancho órfão. D8 6: relatável, sem gatilho ativo." O MUDAR aponta o estágio quebrado ("o problema não é parar, é segurar").
No brief, a ficha ganha dois campos: **SEGURAR** e **GATILHO DE COMPARTILHAR**. No lote, pergunte: o lote só PARA, ou também SEGURA e COMPARTILHA?

---

## 5. Formatos que engajam, momento e "treta"

**Formatos que costumam pegar em vídeo curto:** depoimento cru feito no celular (parece de pessoa real, gera confiança); pessoa falando direto para a câmera, contando a história; POV e "expectativa x realidade"; bastidores e demonstração baseada em prova; série com assinatura ("toda terça..."); pedir comentário. **Costumam perder alcance:** transição superproduzida sem mensagem, lista com muito texto, gancho de venda agressivo ("COMPRE JÁ"). Peça que parece criador e abre forte ganha D1 e D8. Peça que parece comercial polido perde engajamento de topo.

### Fórmula da ponte: encaixar um momento no seu nicho
Anúncio tradicional não impressiona. O povo para no que parece momento, não no que parece anúncio. Os 6 jeitos de ligar um momento à oferta:
1. **Metáfora:** o momento vira símbolo da oferta ("o jogo mais importante é a sua saúde").
2. **Ocasião:** o momento cria motivo de compra (data, presente).
3. **Contraste:** a marca toma uma posição defensável no debate ("fórmula da moda x avaliação de verdade").
4. **Emoção compartilhada:** espelha o sentimento do momento ("POV: domingo de jogo e você...").
5. **Debunk:** usa a curiosidade do momento para ensinar ("4 jeitos de saber se é original").
6. **Formato ou meme:** pega só o formato viral e preenche com a oferta.

**Encaixe ou descarte.** Se a oferta não entra naturalmente no assunto, é tendência pela tendência: vaidade. **Surfe o assunto, nunca o ativo.** Pessoa famosa em alta é assunto, mas o nome e a imagem dela são ativo protegido. Pode falar do tema que ela representa. Não pode usar imagem ou nome sugerindo apoio, difamar, nem criar falsa associação ("o perfume do [famoso]").

### Governança: quando o viral ajuda e quando atrapalha
1. **Serve à venda.** Todo gancho de momento passa no teste: atrai o COMPRADOR e puxa para o funil, ou só alcance de quem nunca compra?
2. **Teto de risco da empresa.** Nicho regulado (saúde, finanças) ou conta sob vigilância: só calendário e polêmica de categoria segura. Marca premium: momento sim, sem baratear a hierarquia. Voz solta e sem regulação: pode mais, sempre dentro do gate legal. Registre o teto no relatório.
3. **Perda assimétrica.** O ganho de uma curtida é pequeno. O prejuízo de uma polêmica tola pode queimar a conta. Na dúvida, não surfe.
4. **Viral é camada, não o funil.** Mix saudável de lote: cerca de 70% de peças perenes que convertem (prova, oferta), 20% de momento e calendário, 10% de polêmica experimental, ajustando ao teto.
5. **Trava de Schwartz.** Momento viral atrai público frio (não sabe do problema ou só do problema). Toda sugestão viral declara o nível que ataca e só é liberada se o lote tem a peça perene (oferta ou prova) que recebe esse lead. Sem ela, fica bloqueada.
6. **Dono do botão.** Verde: o analista sugere e você pode subir. Amarelo: precisa do seu OK explícito. Vermelho: nunca. O experimental roda em conjunto separado, com no máximo 10% do orçamento diário, e **nunca** no conjunto principal que já converte.
7. **Conta pequena: viral é tempero.** Com poucos reais por dia, produzir 3 variações de tendência por semana custa mais do que devolve. Fique em calendário e polêmica segura.

**Como medir que o viral converteu:** lead qualificado que entrou no funil pelo gancho de momento (conversa iniciada, agendamento, clique atribuível). Alcance alto com zero lead qualificado falhou no norte.

### Polêmica e notícia (os 3 filtros e os 3 níveis)
Filtros: **encaixe** com a oferta? **gate** do nicho e segurança da marca? **a conta aguenta** o escrutínio?
- **Verde (pode):** polêmica de categoria ("fórmula da moda x avaliação de verdade"), mito que todo mundo acredita e você desmente, posição defensável da própria marca, crítica a uma prática ruim do mercado **em geral**.
- **Amarelo (só com encaixe forte e seu OK):** comparação com concorrente sem difamar, opinião que divide seu próprio público, notícia sensível do setor.
- **Vermelho (nunca):** política partidária, religião, tragédia ou luto, ataque a pessoa nomeada, tema social sensível usado como isca, desinformação, e tudo que fure o gate regulado do nicho (por exemplo, medo sensacionalista de doença).
A polêmica mais segura e mais forte é a marca tomar um lado no **próprio tema**, vendendo o diferencial: "A gente só vende com nota fiscal e lacre" contra o mercado de falsificação. **Surfe a conversa, não vire a notícia ruim.**

### Gate de tendência (reprova mesmo com D8 alto)
- **Áudio em alta não é licenciado para anúncio pago.** Serve no orgânico. No anúncio, use a biblioteca comercial e pegue só o **formato** da tendência.
- **Meme ou propriedade de terceiros:** pegue o assunto e o clima, sem logo de marca, personagem, celebridade ou cena de filme.
- **Tendência que fura o gate do nicho:** o gate vence o oportunismo.
- **Janela:** suba enquanto o assunto está subindo, não depois do pico.

---

## 6. Radar de tendências: o dado vive na sua pasta, não na doutrina

Dado de tendência apodrece. Por isso a skill não guarda "o que está bombando": ela manda **rodar o radar** e guardar o resultado datado em `anuncios/criativos/radar/RADAR-ATUAL-AAAA-MM-DD.md`.

**Regra-gatilho:** toda vez que se pede ideia, brief, lote ou "ganchos do momento", a 1ª ação é rodar ou atualizar o radar. **Sem radar fresco declarado, a aposta não sai** (`[INSERIR: rodar o radar]`). "Fresco" = feito hoje ou dentro da validade do item mais curto (meme, áudio e formato duram dias; evento, dias a semanas; data e onda, semanas a meses; calendário perene, nunca vence).

**Onde olhar (declare o que olhou e o que não conseguiu abrir):** o Creative Center do TikTok (sons, hashtags e anúncios em alta por país e período), listas de áudios em alta no Reels da semana, a Biblioteca de Anúncios (o que concorrentes do nicho já surfam), a busca na web ("[nicho] tendência [mês/ano] Brasil") e, para vídeo de referência, a transcrição do próprio vídeo. Abra as páginas com a skill `navegador-osimplify`. Sinal de ferramenta de previsão de viralidade, se você usar alguma, entra como **sinal com fonte**, nunca como nota.

**Modelo do arquivo**
```
# RADAR ATUAL | <data>
Perecível. Vence em <data do item mais curto>. Vencido: refazer e arquivar.
Teto de risco da empresa: <BAIXO / MÉDIO / ALTO> | motivo: <regulação, conta sob vigilância, voz>
SCAN em <data>. Olhei: <fontes>. Não acessei: <fontes; cada uma vira [INSERIR]>.

DADO BRUTO (só com fonte; sem fonte = [INSERIR])
- Formato, áudio ou assunto quente: <item> | plataforma | subindo ou saturado | fonte | vence em <data>
- Calendário na janela (perene): <data ou onda>
- Concorrentes já surfando (Biblioteca de Anúncios): <sim/não, como>

LEITURA E PONTE (criação própria; passa pelo gate)
| Assunto | Gancho que liga à oferta | Padrão de ponte | Formato | Nível do risco | Nível de consciência atacado | Existe peça perene que converte? | Janela | Potencial |
```
O **dado** (o que bomba, com fonte) nunca se mistura com a **leitura** (o gancho que você cria). Sem fonte, `[INSERIR]`. Nunca invente tendência.
