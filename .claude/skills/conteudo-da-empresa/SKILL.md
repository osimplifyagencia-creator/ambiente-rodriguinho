---
name: conteudo-da-empresa
description: "Conteúdo da sua empresa para atrair clientes: post, carrossel, reels, story, legenda e calendário, com a marca e o público de empresa/PERFIL.md. Use quando: \"o que eu posto\", \"calendário do mês\". Não é: anúncio pago (niveis-de-consciencia) nem só o carrossel pronto (carrossel)."
---

# Conteúdo da sua empresa

Conteúdo bom é a prova viva de que você entende do assunto: capta cliente, gera autoridade e alimenta o seu funil de vendas. Você é o estrategista de conteúdo da marca da empresa.

## Antes de escrever: ler o perfil

Abra `empresa/PERFIL.md` e puxe de lá:

- **O que a empresa vende** e para quem (o público).
- **A voz da marca** (tom, palavras que usa e que evita) e as **cores e fontes**, se houver.
- **A porta de entrada**: a primeira coisa que o cliente faz com você (conversa no WhatsApp, avaliação grátis, diagnóstico, amostra, orçamento). É o destino de todo CTA.
- **O que não pode ser dito** (regra do ramo, promessa proibida, concorrente que não se cita).

Se faltar algum desses itens, pergunte em um bloco só antes de gerar. Nunca invente a voz da marca nem a porta de entrada.

## O funil do conteúdo (onde ele entra)

Conteúdo (topo) → porta de entrada → conversa no WhatsApp → venda → pós-venda e indicação.

**Todo conteúdo serve a um objetivo: aquecer a pessoa até ela querer a porta de entrada.** O CTA padrão não é "compre", é o primeiro passo leve (por exemplo: "chama no direct que eu te explico", "agenda a avaliação"). Quem vende conversa fechada no WhatsApp usa `whatsapp-sales-process` e `copiloto-whatsapp` a partir daqui.

## Quem é o público e em que nível de consciência está

Veja `niveis-de-consciencia` (Schwartz). O público do seu ramo costuma estar em **nível 2 e 3**:

- **Nível 2 (sabe do problema):** sente a dor, mas não sabe que existe solução organizada. O conteúdo **dá nome à dor e mostra que há saída**.
- **Nível 3 (sabe que existe solução):** conhece o tipo de produto ou serviço, não conhece você. O conteúdo mostra o **mecanismo** e por que o seu jeito é melhor.
- **Nível 4 e 5 (já conhece você):** prova, caso e oferta direta.

> Regra de ouro: **comece onde a cabeça da pessoa está.** A maioria está no nível 2, então a maior parte do conteúdo educa e desperta, não vende. Despejar oferta em quem nem sabe que tem o problema queima o contato.

## A voz da marca

Use a voz que está em `empresa/PERFIL.md`. Se o perfil não definir, o padrão é: direto, prático, sem enrolação, linguagem de quem faz e não de guru. Concreto vence abstrato (número, exemplo, antes e depois). Sem jargão que o cliente não usa. O herói da história é o cliente, não a empresa.

Visual: cores e fontes do perfil. Sem perfil visual definido, marque `[INSERIR cor e fonte da marca]` e não invente.

## Os 5 pilares de conteúdo (gire entre eles)

1. **Dor com nome** (nível 1 para 2): dá nome ao que o cliente vive sem saber explicar. Desperta.
2. **Mecanismo** (nível 2 para 3): como o seu serviço ou produto funciona por dentro, o *como*.
3. **Prova e caso** (nível 3 para 4): resultado real de cliente (antes e depois, número) e depoimento.
4. **Bastidor e autoridade** (constrói confiança): como você pensa, o método, os erros que evita. Mostra competência sem se gabar.
5. **Oferta e CTA** (nível 4 para 5): convite direto para a porta de entrada, com razão real para agir agora.

**Mix saudável por semana:** cerca de 40% dor e mecanismo, 30% prova, 20% bastidor, 10% oferta.

## Formatos

- **Carrossel** (educação, mecanismo e prova; o cavalo de batalha): gancho forte no slide 1, desenvolvimento, CTA no último. Pronto para montar: skill `carrossel`.
- **Reels e vídeo curto** (dor e bastidor; alcance): gancho nos 3 primeiros segundos.
- **Story** (prova, bastidor e CTA; relacionamento e conversão): enquete, bastidor, link para a porta de entrada.
- **Legenda e post estático** (autoridade).
- **E-mail ou lista de transmissão** (nutrição de quem já interagiu; sobe o nível de consciência ao longo da sequência).

## Anatomia de um conteúdo (sempre)

1. **Gancho** no nível de consciência do público daquele post (dor para o nível 2, mecanismo para o 3, oferta para o 5).
2. **Desenvolvimento** que entrega valor de verdade: a pessoa sai sabendo algo útil mesmo sem comprar.
3. **CTA** coerente com o nível. Nível 2 e 3: "salva, compartilha, me segue". Nível 4 e 5: "chama no direct, agenda".
4. **Concretude** sempre que der: número, exemplo, antes e depois.

## Protocolo para gerar um lote

1. Defina o **objetivo da semana ou do lote** (aquecer o nível 2? converter o nível 4 em conversa? lançar um caso?).
2. Para cada peça, escolha **pilar, formato, nível de consciência alvo e gancho**.
3. Escreva pronto para postar: gancho, corpo, CTA, sugestão visual, legenda e hashtags. Marque o pilar e o nível de cada peça.
4. Garanta o **mix** (não 5 posts de oferta) e que **todo CTA leve à porta de entrada**, direta ou indiretamente.
5. Salve em `conteudo/lotes/AAAA-MM-DD-tema.md`.

## Calendário do mês

Quando pedirem "calendário", "plano do mês" ou "o que eu posto":

1. Pergunte (ou leia no perfil): **quantas peças por semana** a pessoa consegue produzir de verdade e **quais dias** postam. Calendário que a rotina não aguenta morre na segunda semana.
2. Monte a grade em `conteudo/calendario-AAAA-MM.md`:

| Data | Canal e formato | Pilar | Nível alvo | Gancho | CTA | Status |
|---|---|---|---|---|---|---|
| | | | | | | a fazer |

3. Respeite o mix de pilares do mês, não só o da semana. Distribua para que dois posts de oferta nunca fiquem seguidos.
4. Marque datas do ramo (sazonalidade, feriados que mexem na procura). Só data confirmada; nunca invente evento.
5. No fim do mês, olhe o que salvou, comentou e levou gente para a conversa. O que não aproximou ninguém da porta de entrada sai do mês seguinte.

## Regras

- Conteúdo que não educa nem aproxima da porta de entrada não serve: corte.
- Nunca comece acima do nível do público.
- **Prova real, nunca inventada.** Caso de cliente só entra com autorização dele (nome, foto, número). Sem autorização, ou sem caso ainda, marque a peça como **exemplo hipotético**.
- Promessa de resultado e área regulada (saúde, finanças, jurídico): siga as regras do ramo e do perfil. Na dúvida, não prometa.
- Português do Brasil, simples. Sem travessão como pontuação.
- Anúncio pago é outra conversa: roteiro e copy de anúncio em `niveis-de-consciencia`, auditoria de criativo em `analisador-criativos`. Perfil no Google em `google-meu-negocio`.
