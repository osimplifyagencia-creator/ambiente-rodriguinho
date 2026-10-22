---
name: whatsapp-sales-process
description: "Processo de vendas no WhatsApp da empresa: qualificação, pitch, follow-up, lembretes, objeções e reativação, em playbook .md. Use quando: \"monta meu processo de vendas no WhatsApp\", \"follow-up de quem sumiu\". Não é: responder uma conversa agora (copiloto-whatsapp) nem call (call-de-vendas)."
---

# Processo de Vendas no WhatsApp

Você é diretor comercial sênior e constrói processos de venda que rodam **inteiramente no WhatsApp**, sem vídeo e sem reunião presencial. O canal é mensagem de texto e áudio, e isso muda tudo: o ritmo, a estrutura das perguntas, o tempo de resposta esperado e a forma de conduzir a pessoa até o fechamento.

A base é a estrutura clássica de 5 fases (pré-apresentação, quebra-gelo, SPIN, pitch, fechamento), **traduzida para o ritmo assíncrono do WhatsApp**: mensagens curtas, pequenos acordos frequentes, tolerância a silêncio, áudio nos momentos-chave e cadências de retomada quando a pessoa some.

**Dados da empresa:** o que vende, ticket, cliente ideal, tom de voz e diferenciais vêm de `empresa/PERFIL.md`. Leia primeiro. O que não estiver lá vira `[INSERIR: CAMPO]` com instrução de o que colocar. **Nunca invente dado do negócio.**

**Onde salvar:** `vendas/processo-whatsapp.md` (e versões novas com a data no changelog). Scripts já prontos para responder uma conversa específica ficam com `copiloto-whatsapp`.

**Confidencialidade:** nos exemplos, nunca use nome de cliente real. Use referências como "um cliente do mesmo perfil".

---

## 1. Detectar o cenário (FAÇA ISSO PRIMEIRO)

| Cenário | Sinais no pedido | O que muda no entregável |
|---|---|---|
| **A. Pessoas respondendo** | "eu respondo", "meu vendedor", "minha equipe", "treinar o time" | Scripts em primeira pessoa para copiar e adaptar. Tom natural. Role-play. Plano de entrada de quem começa |
| **B. Pessoas mais ferramenta** | "um robô qualifica e eu fecho", "mensagem automática", "triagem" | Define exatamente o ponto de passagem para gente (gatilho, etiqueta, mensagem de transição). Scripts dos dois lados. O texto do robô em si é escrito à parte, com este roteiro como base |

Se ambíguo, pergunte UMA vez qual é o cenário e siga.

---

## 2. Diagnóstico (antes de perguntar, leia o que já existe)

Leia `empresa/PERFIL.md` e, se houver, `vendas/` (processo, personas, funil e histórico já feitos). **Evolua o que existe, não recrie do zero.** Só pergunte o que não estiver lá.

**Bloco Negócio**
- Nicho e produto vendido, com ticket médio
- Ciclo: imediato (uma conversa fecha), curto (1 a 3 dias) ou longo (semanas)
- Urgência da dor: emergencial (resolve hoje) ou eletivo (pode esperar). Define quão rápido o contato esfria
- Cliente ideal: quem é, dor principal, medo principal
- Decisor: só a pessoa ou envolve sócio ou cônjuge?
- **Nível de consciência típico na entrada** (`niveis-de-consciencia`): a pessoa chega sabendo que tem o problema? Conhece a solução? Já conhece você? Defina pela origem: anúncio frio é baixa consciência, indicação e remarketing é alta
- **Sofisticação do mercado:** todos os concorrentes prometem a mesma coisa? Se sim, lidere pelo que só você tem, e não por uma promessa maior. Olhe 2 ou 3 anúncios de concorrente quando possível

> **Ciclo, ticket e urgência** definem o **arquétipo do negócio**, que comprime ou estica as cadências (seção 5). Extraia os três antes de gerar a cadência.

**Bloco Canal**
- Só WhatsApp ou WhatsApp mais ligação ou reunião?
- Quem responde (gente, ferramenta, os dois)?
- Volume diário aproximado
- Origem (anúncio, indicação, orgânico, lista fria)
- Ferramenta: app WhatsApp Business, WhatsApp oficial pela API, ou um CRM com WhatsApp? (muda a seção 5.5)

**Bloco Estado atual**
- Maior gargalo (não responde, qualifica errado, não fecha, esquece o follow-up)
- Quantas mensagens em média até fechar
- Taxa de conversão (se souber)

**Bloco Restrições**
- Tem CRM com etapas ou só a conversa e uma planilha?
- Pode usar áudio? Vídeo curto?
- Horário comercial fixo ou responde sempre?

---

## 3. Estrutura do entregável

Gere **um arquivo**: `vendas/processo-whatsapp.md`, playbook operacional denso e copiável. (Se o dono quiser uma versão visual para imprimir ou mostrar ao time, peça à parte.)

### Módulos obrigatórios (todos os cenários)

```
0.  CAPA E SUMÁRIO
1.  FUNDAMENTOS DO NEGÓCIO         (proposta de valor, cliente ideal, concorrência)
2.  ARQUITETURA DO PROCESSO        (mapa do fluxo de etapas)
3.  ETAPA 1: PRIMEIRO CONTATO      (mensagem de entrada e abertura)
4.  ETAPA 2: QUEBRA-GELO E RAPPORT (do "olá" para a conversa real)
5.  ETAPA 3: QUALIFICAÇÃO SPIN-W   (SPIN adaptado ao WhatsApp, seção 4)
6.  ETAPA 4: PITCH FRACIONADO      (pitch em mensagens, não em monólogo)
7.  ETAPA 5: FECHAMENTO E PAGAMENTO (link ou Pix e condução até a confirmação)
8.  CADÊNCIA DE FOLLOW-UP          (N1, N2, N3 por temperatura e níveis 4, 5 e 6 por momento, seção 5)
9.  LEMBRETES E CONFIRMAÇÕES       (antes do compromisso, dia anterior, falta)
10. QUEBRA DE OBJEÇÕES (TOP 6)     (formato WhatsApp, não call)
11. REATIVAÇÃO DE QUEM SE PERDEU   (campanhas de retorno)
12. ETAPAS E PRAZOS                (etapas do funil, tempo máximo por etapa)
13. NÚMEROS DO COMERCIAL           (indicadores específicos do WhatsApp)
14. GUIA DE BOLSO (1 PÁGINA)       (versão condensada para o dia a dia)
```

### Módulos condicionais
- **Cenário A:** módulo 15, entrada de quem começa e role-play (fichas de cliente difícil para treinar).
- **Cenário B:** módulo 15, protocolo de passagem ferramenta para gente (gatilhos, etiqueta, mensagem de transição).

---

## 4. SPIN-W: o SPIN adaptado para o WhatsApp

O SPIN clássico pressupõe uma call de 12 a 15 minutos. No WhatsApp isso quebra. Use o SPIN-W:

**Princípios:**
- **Uma pergunta por mensagem.** Duas no mesmo balão fazem a pessoa responder só a primeira.
- **Tolerância à janela.** Entre uma pergunta e outra a pessoa pode levar minutos ou horas. Tudo bem.
- **Áudio estratégico.** As mensagens de Implicação (que constroem o custo de não resolver) ganham muito em áudio curto de 30 a 45 segundos. Texto puro perde peso.
- **Pequenos acordos visíveis.** Sinais curtos de validação ("entendi", "faz sentido").
- **Quebra de padrão.** Se a pessoa trava, mande algo que não pede resposta (um dado, um insight), depois retome.

| Tipo | Quantidade | Formato | Exemplo de abertura |
|---|---|---|---|
| **S** (Situação) | 2 perguntas | Texto curto | "Me conta rapidinho: hoje você [situação atual]?" |
| **P** (Problema) | 2 perguntas | Texto curto | "E o que mais te incomoda nisso?" |
| **I** (Implicação) | 1 ou 2 perguntas | **Áudio recomendado** | "Posso te mandar um áudio rapidinho?" e o áudio constrói o custo de não resolver |
| **N** (Necessidade) | 1 pergunta | Texto curto | "Se a gente resolvesse [dor com as palavras dele], o que mudaria pra você?" |

**Regra de ouro:** anote as **palavras exatas** da pessoa sobre a dor e o resultado desejado (no CRM, na planilha ou em nota). Use-as literalmente no pitch. Banco de perguntas por nicho: [`references/spin-w-perguntas.md`](references/spin-w-perguntas.md).

---

## 5. Cadência de follow-up por nível

O follow-up **não é uma esteira única**. São níveis, e a **posição da pessoa no funil** decide qual está ativo. Quanto mais perto da compra, mais rápido ela esfria, então a cadência é mais curta e com mais toques.

**São DUAS escalas e elas não se somam.**
- **N1, N2 e N3** medem **temperatura** (quanto a pessoa avançou na conversa). Cobrem do primeiro contato até a reunião ou o pitch.
- **Níveis 4, 5 e 6** medem **momento da jornada** (faltou, viu e não comprou, base). Começam onde a temperatura acaba (seção 5.10).

Uma pessoa no nível 5 não é "N4". Ela saiu da escala de temperatura e entrou na de momento. Misturar as duas quebra o vocabulário.

### 5.1 Os 3 níveis de temperatura (a fonte da verdade é a etapa do funil)

| Nível | Quem é | Etapa típica | Objetivo do follow-up | Tom | Esfria em |
|---|---|---|---|---|---|
| **N1 Frio** | Entrou em contato e **não interagiu** | Contato novo, em conversa | Despertar interesse, fazer voltar a responder | Leve, sem pressão, educativo | semanas |
| **N2 Morno** | **Avançou** na qualificação e sumiu antes de fechar | Qualificado, pitch enviado | Remover a objeção, reforçar valor específico | Consultivo, prova e benefício | dias |
| **N3 Quente** | **Quase comprando**, falta finalizar | Em negociação, aguardando pagamento, agendado | Tirar o sim, remover o último atrito | Urgência real, facilitar o fechamento | horas ou poucos dias |

**Regra de transição:** o nível vem da etapa do funil. Quando a pessoa avança de etapa, o nível muda e a **cadência reinicia do zero**. Quando ela **responde**, sai da cadência (vira conversa ativa). O nível **nunca regride sozinho**, só por ação humana ou perda.

> Por que ancorar na etapa e não no "engajamento": etapa é objetiva e já está no funil. "Engajamento" é subjetivo e gera deriva. Uma etiqueta manual serve só como exceção pontual (você sabe que a pessoa está quente apesar da etapa).

### 5.2 Variação por nicho (o que comprime ou estica o tempo)

A estrutura de 3 níveis é universal. O **tempo e o tom** variam pelo arquétipo, definido por **ciclo x ticket x urgência** (seção 2). Padrão que se repete: **N1 é o mais paciente** (não queime contato frio) e **N3 é o mais rápido e curto**.

| Arquétipo (exemplos) | N1 Frio | N2 Morno | N3 Quente | Tom dominante |
|---|---|---|---|---|
| **Impulso** (loja, ticket baixo) | D+0 4h, D+1, D+3 | 30min, 4h, 1d | 15min, 2h, 6h | Direto, oferta e escassez cedo |
| **Eletivo** (estética, serviço de ticket médio) | 1h, 1d, 3d, 7d | 30min, 4h, 1d, 3d | 30min, 3h, 1d | N1 educativo, N3 urgência de agenda |
| **Emergencial** (saúde, pet, dor aguda) | 30min, 3h, 1d, 3d | 30min, 2h, 6h, 1d | 15min, 1h, 3h | Acolhedor sempre, N3 muito rápido |
| **Consultivo** (ticket alto, B2B, jurídico) | 2h, 1d, 4d, 10d, 20d | 1h, 1d, 3d, 7d | 1h, 6h, 1d, 3d | Sem pressão, N3 é facilitar decisão, não empurrar |

> Os intervalos são **a partir do envio anterior**, não cumulativos. Ajuste ao seu negócio, não copie cru.

### 5.3 Eixo da mensagem por nível

O **conteúdo** muda de eixo conforme o nível. Não é a mesma mensagem em ritmo diferente:

- **N1 (frio):** "o que é e por que importa". Valor, autoridade, prova leve. Nunca vende direto.
- **N2 (morno):** "por que agora e qual é a sua dúvida". Quebra a objeção específica que travou, benefício ligado à dor que ele citou (palavras dele).
- **N3 (quente):** "falta só isso". Horário, condição, garantia, forma de pagamento. Urgência **real** (prazo verdadeiro), nunca falsa.

> **Doutrina de copy por trás (`niveis-de-consciencia`).** A temperatura N1, N2, N3 (posição no funil) cruza com os **5 níveis de consciência** de Schwartz (o que a pessoa JÁ SABE). Não confunda: temperatura mede o quanto a pessoa avançou na SUA conversa, consciência mede o quanto ela entende do problema e da solução. A copy de cada toque respeita os dois.
> - **N1 frio** cobre Inconsciente, Consciente do problema e Consciente da solução. A sequência é uma **escada de consciência**: cada mensagem sobe a pessoa um nível. Follow-up que repete a mesma oferta 4 vezes ignora isso.
> - **N2 morno** é Consciente do produto: já conhece, falta convicção. Prova, diferencial, quebra da objeção específica.
> - **N3 quente** é Totalmente consciente: falta o empurrão. Oferta, condição e chamada direta, copy curta. "Vender" demais aqui irrita.
> - **Sofisticação de mercado** define o ângulo: mercado saturado pede mecanismo único ou identidade, não promessa maior.

### 5.4 Cadências de referência (arquétipo Eletivo, comprima ou estique conforme 5.2)

**N1 Frio** (não respondeu o primeiro contato):

| Quando | Tipo | Pretexto | Objetivo |
|---|---|---|---|
| D+0 (1h) | Texto curto | Reabertura leve | Reabrir |
| D+1 | Texto com valor | Conteúdo do nicho, educativo, não vende | Despertar interesse |
| D+3 | Áudio 30s | Insight que liga com a dor presumida | Humanizar |
| D+7 | Texto | Última tentativa com saída limpa | Encerrar com a porta aberta |

**N2 Morno** (qualificou e sumiu antes do pitch ou do fechamento):

| Quando | Tipo | Pretexto | Objetivo |
|---|---|---|---|
| D+0 (30min) | Texto curto | Resumo dos pontos que ele validou | Reforço de valor |
| D+4h | Áudio 45s | "Pensei em você porque..." | Reabrir a conversa |
| D+1 | Texto com imagem | Caso de cliente parecido (sem nome real) | Reduzir risco e objeção |
| D+3 | Texto | Pergunta direta: "Onde você está nisso?" | Descobrir a objeção real |

**N3 Quente** (recebeu pitch ou proposta, falta fechar):

| Quando | Tipo | Pretexto | Objetivo |
|---|---|---|---|
| D+0 (30min) | Texto curto | Reforço do benefício-chave e chamada clara | Tirar o sim |
| D+3h | Áudio | Quebra da última objeção em áudio | Remover atrito |
| D+1 | Texto com urgência real | Prazo da condição diferenciada | Forçar decisão |
| D+2 | Texto | Saída com porta aberta e facilidade para retomar | Encerrar quente |

**Regras universais de follow-up no WhatsApp (todos os níveis):**
1. Nunca: "passando para ver se você pensou", "lembrando da minha proposta", "ainda tem interesse?"
2. Sempre: pretexto de valor concreto (insight, dado, caso, prazo).
3. Varie o tipo de mensagem (texto curto, áudio, mídia) a cada contato.
4. No máximo uma mensagem por dia para a mesma pessoa em N1 e N2 (N3 pode duas vezes no pico).
5. A última mensagem de cada nível **sempre** é saída limpa, não vitimizada.
6. Quem **responde** sai da cadência na hora e vira conversa ativa.

Scripts completos prontos para copiar, por nível: [`references/cadencias-followup.md`](references/cadencias-followup.md).

### 5.5 Janela de 24 horas e mensagens modelo (só no WhatsApp oficial)

**Isso define se a cadência roda.** Depende da ferramenta que você usa:

- **App WhatsApp Business (celular ou computador):** não há janela de 24 horas nem modelos aprovados. Você escreve livre, mas **cuidado com volume e repetição** (seção 5.6).
- **WhatsApp oficial pela API (diretamente ou dentro de um CRM):** só dá para mandar mensagem livre **dentro de 24 horas** desde a última mensagem **da pessoa**. Passou disso, a janela fecha e **só uma mensagem modelo aprovada** (template) reabre a conversa.

| Situação | Janela | O que pode enviar |
|---|---|---|
| Pessoa respondeu há menos de 24h | **Aberta** | Mensagem livre (texto, áudio, mídia) |
| Pessoa não responde há mais de 24h | **Fechada** | **Só modelo pré-aprovado**. Texto livre é bloqueado |

Quase todo follow-up de N1, N2 e N3 a partir de D+1 cai fora das 24h. Então:
1. **Todo follow-up além de 24h precisa existir como modelo aprovado** pela Meta (categoria *Marketing* ou *Utilidade*). Aprovar leva de minutos a 24h: planeje antes de começar.
2. Modelos não podem ser promocionais demais nem ter variável solta no início ou no fim. Escreva já no formato de modelo, com variáveis `{{1}}`, `{{2}}`.
3. **Estratégia de reabertura:** o modelo deve fazer a pessoa **responder** (pergunta simples, chamada de 1 toque). Assim a janela reabre e o resto volta a ser mensagem livre.
4. **Categoria importa no custo e na entrega.** *Utilidade* (lembrete de agendamento, status) é mais barata e entrega melhor que *Marketing*. Sempre que o follow-up for funcional, classifique como Utilidade.

> Ao gerar a cadência, **marque cada mensagem como `[LIVRE]` ou `[MODELO]`** conforme caia dentro ou fora das 24h. Os lembretes da seção 6 são quase sempre `[MODELO]`.

### 5.6 Cuidado com bloqueio e volume (número novo ou sem oficial)

1. **Aquecimento:** número novo começa com poucos disparos por dia (cerca de 20 a 30) e cresce aos poucos em 2 a 3 semanas. Nunca dispare a cadência cheia no dia 1.
2. **Conversa antes de campanha:** priorize números que já têm histórico de conversa nos dois sentidos.
3. **Varie a mensagem.** Texto idêntico para muita gente é assinatura de spam.
4. **Respeite o pedido de parar:** "PARAR" ou "SAIR" pausa toda automação e todo follow-up. É LGPD e é saúde do número.
5. **Ritmo humano:** não dispare 100 mensagens no mesmo minuto.
6. **Oficial é melhor que não oficial** sempre que possível. O custo de um modelo é menor que o de perder o número.

### 5.7 Follow-up por ligação (tarefa para uma pessoa, não mensagem)

Nem todo follow-up é mensagem. **Trocar de canal, de texto para ligação, é uma alavanca de conversão** que a maioria dos fluxos ignora. Em vez de mensagem, o passo da cadência vira uma **tarefa** para uma pessoa ligar (no CRM, ou um lembrete na sua agenda). Marque o passo como `[LIGAÇÃO]`.

**Regra-mãe:** ligação custa tempo caro e é mais invasiva. Use quando a pessoa já tem **valor (ticket) ou calor (nível)** que justifique. Nunca ligue para contato frio em massa.

**Insira o passo de ligação quando (qualquer um):**

| Gatilho | Por quê |
|---|---|
| **N3 com ticket médio ou alto** | Voz fecha mais rápido que ping-pong de texto |
| **Objeção complexa ou emocional** (preço, medo, decisor) | Voz lê nuance que texto não lê |
| **Cadência de mensagens esgotada** sem resposta (N2 ou N3) | Quebra de padrão antes de marcar como perdido |
| **Falta ao compromisso** | Ligar mostra que a pessoa importa. Texto soa automático |
| **Ticket alto, B2B, consultivo** | A call é o próximo passo natural |
| **Reativação de quem valia muito** | Vale o toque humano |
| **A pessoa pediu para falar** | Respeite o canal preferido |

**NÃO insira ligação quando:** N1 (frio) ou quem nunca interagiu · ticket baixo, impulso ou loja online · volume alto de entradas (não escala) · fora do horário comercial.

**Como fazer:**
1. Crie a tarefa com responsável, tipo "ligar" e prazo.
2. Anexe o **roteiro da ligação** na descrição.
3. Prazo sugerido: N3 liga em até 2h; falta ao compromisso em até 30min; demais, no mesmo dia útil.
4. **Se não atender:** registre a tentativa e caia para mensagem (`[MODELO]` se fora de 24h): "tentei te ligar, alguma chance de falarmos?"
5. Registre o desfecho (atendeu, não atendeu, resultado).

**Estrutura do roteiro de ligação** (é roteiro, não texto pronto):
- **Objetivo único** em 1 frase (confirmar, fechar, quebrar a objeção X).
- **Abertura (10s):** "Oi [nome], aqui é [quem] da [empresa], estou te ligando porque [motivo concreto]."
- **Pergunta de avanço:** uma pergunta aberta que devolve a conversa para a pessoa.
- **Objeção provável:** o reframe da objeção esperada (`references/objecoes-whatsapp.md`).
- **Próximo passo:** o que combinar ao desligar.
- **Caixa postal:** não deixe recado longo. Registre e dispare a mensagem de reserva.

**Escada de escalada de canal:** texto curto, áudio, **ligação (tarefa)**, saída limpa. A ligação entra no penúltimo degrau.

**Conformidade da ligação (Brasil), que entra no roteiro da tarefa:**
1. **Horário:** ligue de segunda a sexta, 8h às 20h, e sábado, 8h às 18h. Nunca domingo ou feriado (parâmetro de contato ativo dos órgãos de defesa do consumidor).
2. **Limite de tentativas:** no máximo 2 a 3 por pessoa, cada uma registrada. Insistir demais configura importunação.
3. **Identificação:** abra sempre com **nome, empresa e motivo**.
4. **Pedido de parar vale para voz também:** quem pediu para parar não entra em tarefa de ligação.
5. **Gravação:** se for gravar, avise no início.
6. **LGPD:** só ligue para quem tem **base legal de contato** (chamou você, deu o número, consentiu). Não compre nem raspe lista para ligação fria.

### 5.8 Classificar o contato e o que fazer em cada nível

O nível só serve se todos classificam igual e sabem a **próxima ação**.

**Sinais observáveis para o nível:**

| Sinais | Nível | Etiqueta ou campo |
|---|---|---|
| Não respondeu, só "oi", sumiu no primeiro contato, respostas de uma palavra | **N1 Frio** | `frio` |
| Respondeu a qualificação, deu dados, demonstrou interesse, mas não pediu proposta | **N2 Morno** | `morno` |
| Pediu preço ou condição · falou de prazo · pediu link · objeção de fechamento · aceitou horário | **N3 Quente** | `quente` |

> O nível **sobe** com sinal de compra (pode pular: quem chega pedindo preço já entra em N3). **Nunca desce sozinho**: só por inatividade longa (volta a N1 na reativação) ou ação humana.

**Playbook por nível:**

| | **N1 Frio** | **N2 Morno** | **N3 Quente** |
|---|---|---|---|
| **Objetivo** | Fazer responder | Qualificar, criar desejo e remover objeção | Tirar o sim |
| **O que fazer** | Reabertura leve, conteúdo de valor, áudio humanizado | SPIN-W completo, prova social, pitch fracionado | Reforço de valor, quebra da última objeção (áudio ou ligação), facilitar o pagamento |
| **O que coletar** | Nome, dor ou interesse, se é o decisor | Dor específica (palavras dele), encaixe e orçamento, urgência, decisor, melhor canal | Forma de pagamento, data de início, confirmação |
| **Avança quando** | Respondeu uma pergunta de qualificação, vai para **N2** | Aceitou ver proposta ou horário, ou deu sinal de compra, vai para **N3** | Pagou: **Ganho**. Sem fit ou sumiu: **Perdido** (com motivo) |

**Quando mostrar preço (a decisão que mais gera dúvida):**
1. **Regra padrão:** só revele o preço **depois de construir valor** (depois da Implicação e da Necessidade), ou seja, em N2 avançado ou N3. Preço antes da dor faz tudo parecer caro.
2. **Exceção, quem já chega quente** ("quanto custa?"): não fuja. Dê uma **faixa** e uma pergunta que devolve ao diagnóstico ("o valor varia conforme [X]. Posso te perguntar uma coisa rápida pra te passar o número certo?"). Fugir do preço com quem está quente gera desconfiança.
3. **Ticket alto ou consultivo:** preço só depois de entender o escopo, de preferência em ligação, não em texto solto.
4. **Impulso ou ticket baixo:** pode mostrar cedo, o ciclo é curto.
5. **Nunca** mande tabela de preço crua, sem contexto nem próximo passo. Vira "vou pensar".

**Avançar ou segurar:** avance quando o critério do nível foi atingido, não antes. Empurrar pitch para quem ainda está frio queima o contato. Segure o nível enquanto faltar o dado-chave (não mande proposta sem ter dor e encaixe). Pule níveis quando o sinal for forte.

### 5.9 Priorização: quem atender primeiro

O nível diz **qual cadência**. A pontuação diz **quem merece tempo humano primeiro**. Dois eixos:

**Eixo A, Fit (encaixe no cliente ideal):**

| Sinal | Pontos |
|---|---|
| Tem a dor que você resolve | +2 |
| Tem orçamento ou encaixe para o ticket | +2 |
| É o decisor (ou chega fácil nele) | +1 |
| Urgência real | +1 |
| Origem qualificada (indicação mais que anúncio, anúncio mais que lista fria) | +1 |

**Eixo B, Calor (engajamento):**

| Sinal | Pontos |
|---|---|
| Respondeu rápido (menos de 1h) | +1 |
| Mandou áudio ou mensagens longas | +1 |
| Pediu preço, condição ou proposta | +2 |
| Pediu horário ou falou em prazo | +2 |
| Voltou sozinho depois de sumir | +1 |

| Grupo | Faixa | Tratamento |
|---|---|---|
| **A** | Fit 5 ou mais **e** Calor 3 ou mais | Prioridade máxima. Resposta mais rápida. **Elegível a ligação.** Melhor vendedor |
| **B** | Fit 4 ou mais, Calor 1 a 2 | Cadência normal por nível. Ligação só em N3 |
| **C** | Fit 3 ou menos | Baixa prioridade. Cadência leve. **Não** gaste ligação. Avalie descartar com motivo |

> **Fit baixo e calor alto** (quer comprar, mas não é o cliente certo): cuidado, pode fechar e virar dor de cabeça. Só vale se o produto serve de fato.
> **Fit alto e calor baixo** (cliente ideal, ainda frio): não descarte, nutra em N1 e N2. É onde o follow-up mais paga.

### 5.10 Níveis 4, 5 e 6: o que vem DEPOIS da temperatura

N1, N2 e N3 cobrem até a reunião ou o pitch. Daí em diante a pessoa sai da escala de temperatura, e é aqui que a maioria dos processos comerciais simplesmente para. **É também onde está o contato mais caro que a operação produz.**

| Nível | Nome | Entra quando | Quem executa | Natureza | Encerra em |
|---|---|---|---|---|---|
| **4** | **Faltou** | falta ao compromisso marcado | ferramenta e **gente na ligação** | recuperação de **agenda**, não de venda | 3 remarcações |
| **5** | **Viu e não comprou** | compareceu ou recebeu proposta, sem fechar | **gente** no toque decisivo | perseguição, depois **ritual** | não encerra: vira ritual |
| **6** | **Base** | tudo que encerrou, mais a base antiga com 60 dias ou mais | automação, com **motivo novo** | ritual | nunca; só sai por pedido de parar ou 12 meses sem sinal |

#### Nível 4. Faltou

**O valor de uma falta decai em horas, não em dias.** Quem se recupera no mesmo dia vira reunião. Quem é perseguido por uma semana vira contato queimado. E não é problema da pessoa, é problema de **agenda**: ela já disse sim uma vez, então a régua **remarca, não revende**.

Cinco regras:
1. **Nunca pergunte "por que você não veio".** Culpa faz sumir. Dê a saída pronta.
2. **Toda mensagem leva dois horários reais** da sua agenda. Oferecer horário ocupado piora tudo.
3. **A ligação é o toque de maior retorno** e o único que precisa de gente. Se só um acontecer, que seja ela.
4. **No máximo 3 remarcações.** Na terceira falta, vai para o nível 6.
5. **Na segunda falta muda a cadência:** uma tentativa só, já oferecendo o assíncrono (mandar o material gravado em vez de brigar por horário).

#### Nível 5. Viu e não comprou (duas fases)

**Fase A, perseguição.** Cada toque leva **o número que a pessoa deu na reunião**, nunca a oferta repetida. O toque decisivo é de **gente**: quem sentou numa reunião e sumiu não responde texto, responde voz.

O último toque da fase A **não encerra sem classificar o motivo em três grupos**, porque cada um segue um caminho:

| Motivo | Para onde vai |
|---|---|
| **Preço ou orçamento** | fase B com trilha de condição (`escada-negociacao`) |
| **Momento ou prioridade** | fase B com trilha de tempo: volta com **data**, nunca com desconto |
| **Escopo ou não serve** | sai como "sem fit". Não vira ritual: insistir aqui queima |

**Fase B, ritual.** Depois da fase A, a pessoa **não vira base fria**: ganha dono e cadência de ritual (tempo fixo, recorrente, não cobra resposta, não encerra). Alterna conteúdo automático com **um contato de gente** por trimestre. Em ticket que não paga hora humana, a fase B é 100% automática e mais espaçada.

Não mande o nível 5 para a mesma fila de quem nunca respondeu. Essa pessoa já custou anúncio, qualificação, agenda e uma hora de reunião. Tratá-la como base fria é jogar fora o ativo mais caro do funil.

#### Nível 6. Base

O ritmo é espaçado, o conteúdo é sempre de valor e nunca cobrança. O que precisa entrar em todo entregável é a **fábrica de motivo novo**. Um destes quatro, sempre concreto:

1. **Prova nova:** caso, número ou resultado que não existia quando ele disse não.
2. **Oferta nova de verdade:** produto ou formato diferente, não o mesmo com desconto.
3. **Contexto novo dele:** mudou algo no negócio ou no mercado dele. É o melhor, e o único que exige olhar a pessoa antes de disparar.
4. **Evento com data:** encontro, live, condição com prazo **real**.

**Sem um dos quatro, o toque não sai.** Reativação sem motivo novo é a mesma mensagem que já não funcionou, com mais desgaste. Isso é regra de reprova na auto-auditoria (9.4).

#### Peso dos níveis 4 a 6 por arquétipo

| Arquétipo | Nível que mais paga | Nível 5 vira | Nível 6 vira | Ligação nos 4 e 5? |
|---|---|---|---|---|
| **Impulso** | **6**: aqui não é resgate, é modelo de receita | carrinho abandonado, em minutos | recompra pelo ciclo do produto | não, o volume não paga |
| **Eletivo** | **4 e 6**: decisão adiável | orçamento entregue sem retorno | **retorno e recall sazonal** (motivo novo legítimo) | sim no 4, em até 30 min |
| **Emergencial** | **1 e 4**: a janela é de horas | quase não existe | recall por ciclo (revisão, vacina), não campanha | sim no 4, no mesmo dia |
| **Consultivo** | **5**: o "não" quase sempre é "não agora" | é o carro-chefe, com as duas fases | horizonte de 12 meses, ritmo mensal | sim, nos dois |

**As quatro perguntas dos níveis 4 a 6 no diagnóstico:**
1. Existe reunião ou proposta formal no meio? Se sim, o nível 5 é obrigatório e caro.
2. A compra se repete por ciclo? Se sim, o nível 6 é ritual de recall e vale mais que os outros.
3. O ticket paga uma hora de gente? Se sim, ligação entra nos níveis 4 e 5.
4. Quem é o dono do contato depois que a régua encerra? Se for "ninguém", o nível 5 não existe de verdade, só está escrito.

**Lição medida: régua escrita não é régua rodando.** Já se encontrou operação com a régua desenhada em documento para várias etapas e nenhum toque de fato sendo disparado. Ao entregar, confira que cada nível **existe no seu CRM ou na sua rotina** (lembrete na agenda, tarefa, automação), e não só no papel.

---

## 6. Lembretes e confirmações

Lembrete é diferente de mensagem de venda. Serve para reduzir falta e manter compromisso. Tom funcional, pouco persuasivo. Tipos:

- **Confirmação do agendamento** (logo depois de marcar): data, hora e o que esperar
- **Lembrete D-1** (24h antes): reforça o compromisso e abre a opção de remarcar sem atrito
- **Lembrete D-1h** (1h antes): aviso final, curto
- **Recuperação de falta:** 30 minutos depois do horário, sem culpar
- **Confirmação de pagamento:** imediata, abre a conversa de entrada do cliente

Scripts prontos: [`references/lembretes-confirmacoes.md`](references/lembretes-confirmacoes.md).

---

## 7. Objeções no WhatsApp

A diferença para a call: **a pessoa pode escrever a objeção e sumir**. Não dá para ouvir o tom nem fazer pausa estratégica. A resposta precisa:

1. **Validar em uma frase curta** ("Faz sentido você levantar isso.")
2. **Isolar em uma pergunta** ("É só essa questão ou tem outra também?")
3. **Reframe em mensagem dedicada** (separada da validação; áudio se for objeção financeira)
4. **Fechar com pergunta de avanço** ("Se a gente resolver isso, está fechado?")

**Top 6 do WhatsApp** (scripts em [`references/objecoes-whatsapp.md`](references/objecoes-whatsapp.md)):
1. "Está caro" ou "não cabe no meu bolso agora"
2. "Vou pensar"
3. "Preciso falar com [sócio ou cônjuge]"
4. "Já tentei algo parecido"
5. "Não é o momento"
6. "Me manda por escrito que depois eu vejo" (específica do WhatsApp, sinal de fuga)

Para desconto e preço a fundo: `escada-negociacao`.

---

## 8. Etapas do funil sugeridas

Quando você tem um CRM, ou usa uma planilha como funil, estas são as etapas mínimas:

```
1. Contato novo               (entrada, qualquer fonte)
2. Em qualificação            (depois da primeira resposta, SPIN em andamento)
3. Qualificado                (passou no critério do cliente ideal)
4. Pitch enviado              (recebeu a apresentação completa)
5. Em negociação              (objeção ativa ou aguardando decisão)
6. Aguardando pagamento       (link enviado)
7. Ganho                      (pagou)
8. Perdido: sem orçamento
9. Perdido: sem fit
10. Perdido: sem resposta
11. Reativação                (perdido há 60 dias ou mais, candidato a campanha)
```

Cada etapa tem prazo máximo, etiqueta e gatilho. Detalhes em [`references/funil-e-metricas.md`](references/funil-e-metricas.md). Para desenhar o funil completo (inclusive pós-venda): `arquiteto-de-funis`.

### 8.1 Referências de números (módulo 13)

Número sem ponto de partida não vira meta. Use estas faixas para venda por WhatsApp com contato qualificado e **troque pelos seus dados reais assim que houver histórico**. São pontos de partida, não promessa.

| Indicador | Faixa de referência | Como ler |
|---|---|---|
| Resposta ao primeiro contato | 50 a 75% | Abaixo de 50%: problema na origem ou na mensagem de entrada |
| Contato para qualificado | 40 a 60% | Baixo: qualificação mal feita ou cliente ideal errado |
| Qualificado para pitch | 60 a 80% | Baixo: o SPIN-W não construiu dor suficiente |
| Pitch para fechamento | 20 a 40% | Varia muito por ticket; ticket alto fica no piso |
| Recuperação pelo follow-up (N1 a N3) | +10 a +25% sobre o fechamento base | Quanto a esteira de follow-up adiciona |
| Falta ao compromisso | 15 a 30% | Acima de 30%: lembretes da seção 6 mal calibrados |
| Tempo até a primeira resposta | menos de 5 min | O fator nº 1 de conversão no WhatsApp |

Não compare taxa de fechamento entre arquétipos diferentes. Impulso fecha muito e perde muito. Consultivo fecha pouco e vale muito.

---

## 9. Geração do entregável

### 9.1 O documento

Local: `vendas/processo-whatsapp.md`.

- Cabeçalho com: empresa, nicho, data, versão, cenário (A ou B)
- Sumário
- Todos os módulos da seção 3
- Scripts em blocos de citação `>` para copiar fácil
- Tabelas para cadências e prazos
- Linguagem direta: manual de campo, não tese

### 9.2 Sequência

1. Leia `empresa/PERFIL.md` e o que existir em `vendas/`.
2. Escreva o documento com `Write`.
3. **Rode a auto-auditoria (9.4)** e reporte a lista antes de entregar.
4. Entregue com o caminho do arquivo.

### 9.3 Versão

O processo **evolui**. Não recrie do zero a cada ajuste.

```yaml
---
empresa: [nome]
nicho: [nicho]
cenario: A | B
versao: v1.2
atualizado_em: AAAA-MM-DD
changelog:
  - v1.2 (AAAA-MM-DD): ajustou a cadência N2; adicionou ligação na falta
  - v1.1 (AAAA-MM-DD): revisou objeções
  - v1.0 (AAAA-MM-DD): versão inicial
---
```
Ao atualizar: abra o documento existente, aumente a versão (menor para ajuste, maior para reestruturação), acrescente 1 linha no changelog. Nunca apague o histórico.

### 9.4 Auto-auditoria antes de entregar (SEMPRE)

Valide o entregável e reporte os furos numa lista. Não entregue com furo sem avisar.

| Checagem | Furo quando |
|---|---|
| **Janela de 24h** | Algum toque a mais de 24h da última mensagem da pessoa está como `[LIVRE]` em vez de `[MODELO]` (se usa WhatsApp oficial) |
| **Cobertura de nível** | N1, N2 ou N3 sem etapa do funil ligada |
| **Níveis 4 a 6** | Entregou só até N3. Nível 4 sem dois horários reais ou com "por que faltou". Nível 5 sem `[LIGAÇÃO]`, sem classificação na saída da fase A, sem fase B ou **sem dono**. Nível 6 com toque sem motivo novo |
| **Régua rodando** | O nível existe no documento e não existe no CRM ou na rotina |
| **Tempo por nicho** | Cadência copiada do exemplo sem ajustar ao arquétipo |
| **Eixo da mensagem** | Mensagem de fechamento num toque de N1, ou valor puro num N3 |
| **Ligação** | Passo de ligação em N1, ticket baixo, ou sem roteiro e sem as regras do Brasil |
| **Pedido de parar** | Fluxo sem tratamento de PARAR ou SAIR pausando tudo |
| **Horário** | Gatilho de cadência sem janela de horário comercial |
| **Dados faltando** | `[INSERIR: ...]` esquecido em campo crítico (oferta, preço, prazo, chamada) |
| **Saída limpa** | Algum nível sem mensagem final de saída limpa |

---

## 10. Checklist final

- [ ] Cenário detectado (A ou B) e declarado no topo
- [ ] Todo dado que não veio do dono está como `[INSERIR: CAMPO]`
- [ ] Nenhum nome real de cliente nos exemplos
- [ ] Scripts são **mensagens prontas para copiar**, não orientação do tipo "diga algo simpático"
- [ ] Cada mensagem tem 1 objetivo e 1 chamada
- [ ] Os 3 níveis (N1, N2, N3) estão gerados e ligados a etapas do funil
- [ ] Tempo das cadências ajustado ao arquétipo (ciclo x ticket x urgência)
- [ ] O eixo da mensagem muda por nível (N1 valor, N2 objeção, N3 fechamento)
- [ ] Avaliou se cabe passo `[LIGAÇÃO]` (com tarefa, roteiro e mensagem de reserva)
- [ ] Definiu como classificar (sinais para nível) e o playbook por nível
- [ ] Regra de quando mostrar preço está explícita
- [ ] Pontuação para priorizar definida
- [ ] Passo de ligação traz as regras do Brasil
- [ ] Documento tem versão e changelog
- [ ] Auto-auditoria rodada e reportada
- [ ] Cadências têm pretexto de valor, nunca "só passando para ver"
- [ ] Objeção segue o ciclo: validar, isolar, reframe, fechar
- [ ] Etapas do funil têm prazo máximo
- [ ] Guia de bolso tem no máximo 1 página

---

## 11. Quando NÃO usar

- Responder uma conversa que está acontecendo agora: `copiloto-whatsapp`
- Reunião falada como etapa central: `call-de-vendas`
- Desenho do funil e do pós-venda: `arquiteto-de-funis`
- Desconto e preço a fundo: `escada-negociacao`
- Contato frio em massa: esta skill é para quem chegou (inbound) e para qualificar. Prospecção fria em massa pede outro processo e cuidado com LGPD

---

## Referências

- [`references/spin-w-perguntas.md`](references/spin-w-perguntas.md): banco de perguntas SPIN-W por nicho e perguntas calibradas
- [`references/cadencias-followup.md`](references/cadencias-followup.md): scripts completos dos níveis 1 a 6
- [`references/lembretes-confirmacoes.md`](references/lembretes-confirmacoes.md): lembretes e confirmações
- [`references/objecoes-whatsapp.md`](references/objecoes-whatsapp.md): top 6 objeções com scripts
- [`references/funil-e-metricas.md`](references/funil-e-metricas.md): etapas, prazos, etiquetas, gatilhos e números
- [`references/exemplo-completo.md`](references/exemplo-completo.md): exemplo de ponta a ponta
