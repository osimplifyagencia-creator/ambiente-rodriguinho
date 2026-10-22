# Desempenho, faixas e aprendizado: a nota a serviço do criativo que vence

O fim da skill **não é dar nota**. É aumentar a chance de a peça vencer a campanha: parar o dedo, ganhar leilão barato, converter e poder ser repetida antes de cansar. A nota 8D é um **substituto** do resultado. Quando nota e desempenho brigam, **o desempenho manda** e a régua se ajusta.

---

## 1. Indicadores que preveem o vencedor antes do custo por resultado firmar

O custo por resultado (CPA) é o juiz final, mas demora dias para estabilizar. O criativo se revela antes, nestes indicadores:

| Indicador | O que é | Liga com |
|---|---|---|
| **Thumbstop (taxa de gancho)** | quem para nos primeiros 3 s: visualizações de 3 s ÷ impressões | **D1**. O melhor previsor de vencedor |
| **Taxa de retenção** | quem assiste 15 s ou até o fim (vídeo) | D1 + D7 + D8. Vídeo que para e não segura é gancho órfão |
| **CTR de link** | cliques ÷ impressões | D2 + D3 + D6. Em campanha de mensagem, o "clique" é o início da conversa: leia a ação-alvo |
| **CPM** | custo por mil impressões | D8 e relevância. D8 alto tende a CPM abaixo da mediana da conta |
| **Frequência x CTR no tempo** | repetição contra queda de clique | fadiga. Cair com frequência subindo = hora de **iterar**, não de matar |
| **CPA** | custo da ação-alvo | o juiz final. No alvo e estável por 3 dias ou mais = vencedor |

**Como ler a conta (só leitura).** Use a skill `meta-ads-expert`: carregue o `.env` como ela ensina e puxe os resultados por anúncio.

```bash
curl -s -G "https://graph.facebook.com/$GV/$ACT/insights" \
  --data-urlencode "level=ad" \
  --data-urlencode "fields=ad_id,ad_name,spend,impressions,reach,clicks,ctr,cpm,frequency,actions,cost_per_action_type,video_3_sec_watched_actions,video_thruplay_watched_actions" \
  --data-urlencode "date_preset=last_30d" --data-urlencode "limit=100" \
  --data-urlencode "access_token=$META_ACCESS_TOKEN"
```

Os nomes dos campos de vídeo mudam com a versão da API. Se der erro de campo, confira na documentação do Meta. Quebre por `platform_position` para ver feed, stories e reels (uma peça pode ganhar no feed e morrer nos stories). **Nunca** chame operação de escrita a partir desta skill.

**Regra de ancoragem.** Com dado da conta, a justificativa de D1 cita o thumbstop real ("D1 8: thumbstop 31% contra mediana de 22% da conta, últimos 30 dias"). Sem dado, cita a **faixa esperada como hipótese** (seção 3). Número sem período e sem fonte não entra.

**Diagnóstico diferencial antes de culpar o criativo.** CTR forte com CPA fora do alvo **em várias peças** aponta para fora do criativo: oferta, preço, página, público ou atendimento. A peça não é penalizada. O relatório registra a passagem para `arquiteto-de-funis` (ou revisão de estrutura em `meta-ads-expert`). Não refaça o criativo que converte o clique se quem não converte é a página.

---

## 2. Classificar vencedor e perdedor, e montar o DNA da conta

**Dado mínimo:** pelo menos 1.000 impressões e gasto relevante para o ticket. Abaixo disso: "sem dado suficiente". Nunca classifique no achismo.

| Sinal | Vencedor | Perdedor |
|---|---|---|
| CTR | acima da mediana da conta | caindo enquanto a frequência sobe (fadiga) |
| CPA | no alvo ou abaixo, estável por 3 dias ou mais | mais de 1,3 vez a meta por 2 dias ou mais; mais de 2 vezes = morto |
| Frequência | estável | 4 ou mais com CTR abaixo de 0,5% = criativo morto |
| Tendência | sustenta no tempo | alcance cai enquanto o gasto sobe |

Fadiga não é peça ruim. Criativo que performou e cansou é **vencedor a iterar**.

**DNA da conta.** Dos 3 a 5 melhores e 3 a 5 piores anúncios com dado suficiente, extraia **padrões**, não peças: tipo de imagem, rosto, densidade de texto, prova, ângulo (pela matriz de Schwartz), tamanho do título, chamada usada. Saída:
```
DNA DA CONTA | últimos 30 dias, R$ X gastos
Vencedores: [padrões com números: "close do produto com preço, CTR 2,1% contra mediana 1,2%"]
Perdedores: [padrões: "peça institucional sem chamada, CTR 0,4%, CPA 3x a meta"]
Implicação para o lote novo: [2 a 3 diretrizes concretas]
```

**Sem conta:** não existe métrica sua, e o relatório diz isso. O que ainda se ancora: a Biblioteca de Anúncios do Meta (abra com a skill `navegador-osimplify`). Veja quantos anunciam, que promessas dominam e há quanto tempo os anúncios rodam (anúncio velho no ar costuma funcionar). Use para estimar a sofisticação do mercado (D4). **Limite:** ela mostra os anúncios, não o desempenho deles. Registre `[INSERIR: conectar a conta para ancorar em dados reais]`.

**Calibração da régua (uma vez, com histórico).** Pontue os vencedores e perdedores reais pela 8D às cegas. Vencedor com nota alta e perdedor com nota baixa = régua calibrada. Se divergir, descubra qual dimensão a régua sobre ou subvalorizou nesta conta, registre o ajuste na **leitura do nicho** (nunca na rubrica global) e declare no relatório.

---

## 3. Faixas de leitura: a nota vira hipótese

**Como ler estas faixas.**
1. Faixa é **hipótese de mercado**, não verdade nem dado seu. Serve para calibrar o analista quando não há conta.
2. **A mediana da própria conta manda** sobre a faixa de mercado. Conta vence mercado, sempre.
3. Número no relatório só com **fonte e período**. "Seu thumbstop esperado é 28%" sem dado da conta é invenção. O correto: "D1 8: faixa forte de gancho (hipótese de mercado; sem conta conectada)".
4. Nicho, cidade e formato movem muito os números. Faixa específica sem confirmação vira `[INSERIR]`.

| Indicador | Fraco | Mediano | Forte | Excepcional |
|---|---|---|---|---|
| Thumbstop (liga em D1) | abaixo de ~15% | ~15 a 25% | ~25 a 35% | acima de ~35% |
| Retenção (vídeo) | abaixo de ~5% | ~5 a 12% | ~12 a 20% | acima de ~20% (depende da duração) |
| CTR de link (D2, D3, D6) | abaixo de ~0,7% | ~0,7 a 1,3% | ~1,3 a 2,5% | acima de ~2,5% |

CPM, frequência e CPA não têm faixa universal. Leia como método: CPM relativo à mediana da conta; frequência de 3 ou mais com CTR caindo é fadiga; CPA como múltiplo da meta ([INSERIR: meta com o dono]).

**Ponte nota para métrica esperada**

| Nota | D1 prevê thumbstop | D6 prevê CTR | D8 prevê CPM |
|---|---|---|---|
| 9-10 | excepcional | excepcional | bem abaixo da mediana |
| 7-8 | forte | forte | abaixo da mediana |
| 5-6 | mediano | mediano | na mediana |
| 4 ou menos | fraco | fraco | acima da mediana |

A ponte prevê indicadores de **topo** (thumbstop, CTR, CPM) melhor do que o CPA. A nota não promete CPA.

---

## 4. Post-mortem: conferir se a nota acertou

Quando a peça aprovada já rodou (volume mínimo da seção 5), registre uma linha no relatório seguinte e no `historico-designer.md`. O bloco abaixo é só **exemplo de formato**.

```
POST-MORTEM | peça <nome> (id do anúncio <id>)
Previu: D1 = 8 -> faixa forte (~25 a 35%) · D6 = 7 -> CTR ~1,3 a 2,5%
Realizou: thumbstop 19% (mediano), CTR 1,6% (forte), últimos 14 dias
Leitura: D1 superestimou o gancho neste nicho (ajustar a leitura de D1) · D6 convergiu
```

Convergiu: régua confiável para o nicho. Divergiu: ajuste a **leitura do nicho**, nunca a rubrica global. Sem conta não há post-mortem, só a hipótese declarada. É honesto escrever "previsão não verificada, sem conta".

---

## 5. Tamanho mínimo de um teste (exceção, não padrão)

Só quando há verba sobrando e dúvida real.

- **Verba por variação:** pelo menos cerca de 3 vezes o CPA-alvo, ou cerca de 1.000 impressões em teste de topo (quando o sinal é thumbstop ou CTR).
- **Janela:** não decida antes de sair da fase de aprendizado nem antes de uns 3 dias.
- **Abaixo de 1.000 impressões:** SEGURAR. Decidir no achismo é proibido.
- **Uma variável por vez** (gancho, ou oferta, ou formato). Conceito contra conceito não diz qual elemento ganhou. Gancho contra gancho, com a mesma oferta, diz.

Sem volume mínimo, o número é ruído com cara de conclusão.

---

## 6. Do julgamento à direção: receita, iteração, prognóstico e verba

**Receita do próximo vencedor (sempre, no fim do lote).**
```
RECEITA = DNA dos vencedores da conta
        + célula descoberta da matriz (ângulo x nível e formato que faltam)
        + momento vivo (D8)
        - o que já saturou
-> "Produzir: 1 peça de [ângulo] para [público], gancho de [tipo que vence], prova [canal],
   formato [1:1 / 4:5 / 9:16], surfando [momento], porque [evidência]."
```
Concreto vence genérico: não "faça uma peça de prova", e sim "peça de prova com close de lacre e nota fiscal em 4:5, ângulo medo de golpe, espelhando o vencedor `prova-02`". Entregue **2 a 3 títulos** de padrões diferentes da biblioteca de ganchos. Sem conta, a receita sai do cartão de nicho e da Biblioteca de Anúncios, e o relatório diz que é hipótese.

**Iteração de vencedores (com conta).** A maior alavanca de uma conta não é aprovar peça nova, é espremer o vencedor antes de cansar. Vencedor ainda quente: 1 ou 2 variações do mesmo ângulo trocando só o que cansa o olho (gancho visual, formato, prova). Vencedor em fadiga: refresh imediato do mesmo conceito. Perdedor real: não itera, substitui pela receita. **Conceito vencedor cansado não é conceito ruim.**

**Prognóstico de cada SOBE (onde pôr a verba).**

| Prognóstico | Sinais | Verba |
|---|---|---|
| Aposta de vencedor | D1 8+, D3 8+, momento vivo (D8 7+) ou espelha o DNA vencedor | testar com prioridade, candidata a escalar |
| Seguro para rodar | SOBE sólido sem diferencial de gancho ou momento | base, não aposta principal |
| Vale o teste | AJUSTA com uma hipótese forte de TESTAR | teste pequeno |

Ancore no DNA da conta quando há dados. Sem dados, em hipótese de mercado, e diga qual. Cite a faixa: "aposta de vencedor: D1 8 prevê thumbstop forte (~25 a 35%); conferir quando rodar".

**Recomendação de verba (com conta; a skill só recomenda, quem executa é você com `meta-ads-expert`).**
```
ESCALAR: vencedor confirmado, CPA no alvo estável  -> subir o orçamento aos poucos
ITERAR:  vencedor em fadiga                        -> subir as variações antes de cair mais
MATAR:   perdedor real (CPA acima de 2x a meta)    -> pausar e trocar pela receita
SEGURAR: menos de 1.000 impressões                 -> deixar maturar
```
Decisão de escala e de corte fica com `doutrina-trafego`. Sem conta, não há recomendação de verba.
