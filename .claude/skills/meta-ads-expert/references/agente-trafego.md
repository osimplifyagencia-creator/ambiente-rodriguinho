# Rotina de gestão de tráfego (com travas)

Como montar uma rotina que observa os números, diagnostica e propõe (ou executa) ajustes nas campanhas do Meta sem queimar a sua verba.

**Princípio nº 1:** isso mexe em dinheiro real. O risco não é técnico, é financeiro. As travas não são opcionais. Um erro num ciclo pode gastar a verba de um mês em horas.

---

## Ciclo de decisão

```
OBSERVAR → DIAGNOSTICAR → DECIDIR → (APROVAR?) → AGIR → REGISTRAR → repetir
```

**1. Observar** (só leitura, livre)
- Estado atual: campanhas, conjuntos e anúncios ativos, com verba (`campanhas-leitura.md`).
- Resultados no tempo: gasto, CTR, custo por resultado, ROAS, frequência.
- Desvios fortes: custo disparou, CTR despencou.
- Erros de entrega: anúncio reprovado, conta com pendência.

**2. Diagnosticar** (raciocínio, sem ação). Regras de partida, ajuste para o seu negócio:
- Custo por resultado acima de 1,3 vez a meta por 2 dias ou mais, com gasto relevante: candidato a pausar ou reduzir.
- Frequência subindo e CTR caindo: criativo cansado, sinalizar troca.
- Anúncio com ROAS bem acima da média: candidato a mais verba, com teto.
- Erro de entrega: corrigir primeiro. Não otimize o que nem está rodando.

**3. Decidir, 4. Aprovar, 5. Agir** (escrita, sob trava)
- Ajustar verba ou lance.
- Ativar ou pausar.
- Criar testes novos (sempre `PAUSED`).

**6. Registrar:** toda decisão e ação num arquivo de auditoria (`anuncios/registro-de-decisoes.md`): data, o que disparou, ação, valor antes e depois, e se foi proposto ou executado.

---

## Os 3 modos (comece conservador)

### Modo copiloto (recomendado para começar)
O Claude **só propõe**. Gera um relatório: "O anúncio X tem custo 2 vezes a meta há 3 dias, sugiro pausar." Nada de escrita roda sem o seu "pode". Risco financeiro quase zero.

### Modo híbrido
Executa sozinho só as **ações de baixo risco**, com teto. Pede aprovação no resto.
- Sozinho: pausar anúncio com custo absurdo (gasto acima de X e custo acima de 2 vezes a meta); ajuste pequeno de verba (até 10% por dia).
- Com aprovação: aumentar verba acima de Y%, ativar campanha nova, mexer em público, qualquer mudança acima de R$ Z.

### Modo autônomo (com tetos rígidos)
Age sozinho dentro de uma "caixa". Só em conta madura, com histórico, e com **todas** as travas abaixo ligadas.

---

## Travas obrigatórias (em qualquer modo automático)

1. **Teto de gasto absoluto:** nunca levar a verba somada acima de um limite diário ou mensal definido. Confira o gasto acumulado antes de qualquer aumento.
2. **Limite por ação:** nenhuma mudança de verba acima de X% por vez (ex.: 20% por dia). Nada de "dobrar a verba" sozinho.
3. **Janela de operação:** só age em horários definidos. Fora disso, só observa.
4. **Dados mínimos:** não decide com pouco dado. Exija gasto e impressões mínimos e janela de alguns dias antes de pausar ou escalar (a fase de aprendizado da Meta precisa de tempo).
5. **Ensaio primeiro:** todo modo novo roda "propor sem executar" por alguns dias. Você compara com o que faria. Só depois liga as ações.
6. **Você aprova o que é grande ou irreversível:** pausar campanha inteira, mexer em público, passar do teto.
7. **Botão de parar tudo:** um arquivo ou marcador (`anuncios/PARAR.txt`) que, se existir, congela todas as ações.
8. **Auditoria e volta atrás:** registre o estado antes e depois e permita reverter.
9. **Sem repetir:** não repita a mesma ação em nova execução (uma ação por anúncio, decisão e dia).
10. **Escopo mínimo:** o token só enxerga as contas que a rotina deve tocar.

---

## Como rodar

- Agende uma rotina (do Claude Code ou do seu computador) a cada poucas horas, dentro da janela de operação. Ela lê, diagnostica e escreve a proposta num arquivo.
- No modo copiloto, você lê a proposta e responde "pode" ou "não". O Claude executa só o que você aprovou.
- O "cérebro" pode ser o próprio Claude lendo os números já coletados e devolvendo decisões estruturadas (ação, justificativa, valor). Elas passam pelas travas antes de qualquer escrita.

## Playbook de otimização (regras de partida, calibre com os seus dados)

- **Pausar:** custo acima de 2 vezes a meta, com gasto mínimo de teste, depois do tempo de aprendizado. Não pause no primeiro dia.
- **Escalar:** retorno consistente acima da meta, aumente 15 a 20% de verba por dia, respeitando o teto.
- **Criativo cansado:** frequência alta e CTR caindo. Crie um criativo novo (pausado) e troque.
- **Realocar:** tire verba do conjunto fraco e dê ao forte, dentro do limite por ação e do teto.
- **Erro de entrega:** prioridade máxima.

Toda regra aqui é ponto de partida. Registre o resultado das decisões e ajuste os limites com dados reais. Veja a skill `doutrina-trafego` para a leitura de métricas e a ordem de diagnóstico.
