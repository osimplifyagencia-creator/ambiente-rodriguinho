---
name: carrossel
description: "Carrossel de Instagram da sua empresa pronto para montar: slides, prompts de imagem, legenda e estratégia COCA. Use quando: \"cria um carrossel sobre X\". Não é: plano de conteúdo do mês (conteudo-da-empresa) nem criativo de anúncio (analisador-criativos)."
---

# Carrossel

Escreve o carrossel de Instagram da sua empresa do início ao fim: roteiro slide a slide, prompts de imagem, legenda e lembrete de margem. Você monta e posta. O design vem da **marca da empresa**; o texto vem da **estratégia**. Nunca genérico.

---

## Fluxo (em ordem)

1. **Ler `empresa/PERFIL.md`**: o que a empresa vende, o público, a voz da marca, as cores (hex) e fontes, e as restrições (o que não pode ser dito ou mostrado). Falta hex? Marque `[INSERIR cor]` e não invente.
2. **Definir o tipo COCA e o estágio do funil** (tabela abaixo). Se a pessoa não disse, olhe a fase: perfil parado ou pequeno pede Crescimento.
3. **Escrever o roteiro** pela fórmula viral (capa com gancho, contexto, corpo, CTA).
4. **Escrever o texto de cada slide**, curto, um ponto por slide.
5. **Gerar os prompts de imagem** por slide que precisar, ancorados nas cores da marca.
6. **Entregar**: roteiro completo, legenda do post, prompts de imagem e o lembrete de margem 4:5. Salvar em `conteudo/carrosseis/AAAA-MM-DD-tema/` (um arquivo `roteiro.md` e, se houver, as imagens).

---

## COCA x funil (consulta rápida)

| Tipo COCA | Estágio | Objetivo | Métrica principal |
|---|---|---|---|
| **Crescimento** | Topo | atrair (educar ou entreter, sem vender) | salvamento, alcance, compartilhamento |
| **Conexão** | Meio | relacionar (história, bastidor) | respostas, interações |
| **Autoridade** | Meio e fundo | provar competência | prova, depoimento |
| **Objeção e venda** | Fundo | quebrar objeção e vender (só para quem já está aquecido) | conversa qualificada, venda |

**Lógica das 9:** ao menos 1 de cada tipo a cada 9 posts. Fase de crescimento: 6 de Crescimento, 1 de Objeção, 1 de Conexão e 1 de Autoridade.

Para o nível de consciência do gancho, use `niveis-de-consciencia`. Para o plano do mês inteiro, `conteudo-da-empresa`.

---

## A fórmula do carrossel (modelada no que viraliza)

- **Slide 1, capa (gancho):** título centrado, **até 12 palavras**, com curiosidade ou dor. Deixa "arraste →". É o que faz a pessoa parar de rolar.
- **Slide 2, contexto:** fisga quem não parou na capa. Planta uma deixa de retenção ("o 3º engana quase todo mundo").
- **Slides 3 a 7, corpo:** entrega o que a capa prometeu, títulos diretos, **um ponto por slide**.
- **Slide final, CTA:** pede **salvar e comentar**. O CTA **comenta e recebe no direct** ("comenta QUERO que eu te mando no direct") é a maior alavanca de alcance no topo.

Total de 8 a 10 slides. Menos de 6 parece fraco; mais de 10 perde a pessoa.

---

## Como entregar o roteiro

Para cada slide, escreva neste formato:

```
SLIDE 1 (capa)
Título: [até 12 palavras]
Apoio: [uma linha, opcional]
Imagem: [prompt ou "só texto"]
```

O texto fica em **negrito** só na palavra-chave. Quebra de linha onde o título precisa respirar.

---

## Marca da empresa

Tudo sai com a marca da empresa, tirada de `empresa/PERFIL.md`:

- **Cor de destaque:** uma só, usada na palavra-chave do título e nos detalhes.
- **Fonte do título:** com serifa para luxo e tradição; sem serifa para tecnologia e serviço direto. Letra maiúscula só se a marca for de impacto.
- **Fundo:** contraste forte com o texto. Texto claro sobre fundo escuro ou texto escuro sobre fundo claro, nunca meio-termo.
- **Assinatura:** nome ou @ da empresa no rodapé, discreto.

Nunca misture duas identidades no mesmo carrossel.

---

## Guardrails (o que protege você)

- **Uma voz por peça.** Não misture desejo com preço, nem público de empresa com público de pessoa física, no mesmo carrossel.
- **Topo não vende.** Educa e aquece. Venda só no fundo, para público aquecido.
- **Procedência pelo mecanismo, nunca pela afirmação.** Mostre como a pessoa pode verificar (nota fiscal, lacre, processo) em vez de escrever "100% garantido" ou "o melhor".
- **Imagem:** foto própria ou imagem gerada por IA genérica (produto sem marca de terceiros). Nunca foto oficial de marca protegida nem rosto de pessoa real sem autorização.
- **Prova real:** depoimento, número e caso só entram se forem verdadeiros e autorizados. Caso hipotético sai marcado como exemplo.
- **Áreas reguladas** (saúde, finanças, jurídico): nada de promessa de resultado, antes e depois proibido ou diagnóstico. Siga a regra do conselho da profissão.
- **Formato 4:5 (1080 x 1350)** em todos os slides, com **margem de segurança de cerca de 8% (aproximadamente 108 px)** nas bordas. Deixe o canto superior direito livre (o Instagram põe o ícone de carrossel ali).
- **Restrições do perfil:** leia `empresa/PERFIL.md` e respeite o que ele proíbe.

---

## Prompts de imagem

- Ancore nas **cores da marca** (cite os hex) e no estilo. Mesmo produto e mesmo estilo em todos os slides, para parecer catálogo coerente.
- Peça **sem texto dentro da imagem**. O texto entra na montagem, para ficar nítido e editável.
- Produto genérico se a marca for de terceiro.
- Formato vertical 4:5, com espaço livre onde o título vai entrar.

Para gerar a imagem em si, use a ferramenta de imagem que você tem (por exemplo, o gerador de imagem da sua conta de IA ou um banco gratuito de fotos) e confira se nada ficou com texto torto ou marca de terceiro.

---

## Como montar (sem ferramenta especial)

Escolha um caminho:

1. **Canva ou Figma:** crie um quadro 1080 x 1350, cole o texto de cada slide, aplique a cor e a fonte da marca, exporte em PNG.
2. **Pedir ao Claude para montar em HTML:** peça "monta os slides em HTML, 1080 x 1350, um por tela, com a marca da empresa". Abra cada um no navegador (veja `navegador-osimplify`) e exporte uma captura de tela por slide, ou imprima em PDF e separe as páginas.

Em qualquer caminho: confira no celular a um braço de distância. Se não lê, a letra está pequena.

---

## Legenda do post

1. **Gancho** na primeira linha (aparece antes do "ver mais").
2. **Valor**: duas ou três linhas que resumem o que a pessoa leva.
3. **CTA**: "salva para ver depois" e "comenta [PALAVRA] que eu te mando no direct".
4. **Hashtags** do ramo, de 5 a 8, específicas (nada de #amor #instagood).

---

## Formato de saída

1. Roteiro completo, slide a slide.
2. Legenda do post.
3. Prompts de imagem dos slides que precisarem.
4. Lembrete da margem 4:5 e dos guardrails aplicados.
5. Arquivo salvo em `conteudo/carrosseis/AAAA-MM-DD-tema/roteiro.md`.
