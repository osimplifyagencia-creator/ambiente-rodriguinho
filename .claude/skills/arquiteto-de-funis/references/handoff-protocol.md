# Handoff Protocol: Passagem de bastão (IA → humano e entre etapas)

Como o agente sabe **quando** parar de conduzir, **o que** entregar e **pra quem**. Handoff malfeito é a causa nº1 de cliente frustrado e venda perdida em funil com agente de IA.

> **Como usar:** sempre que o funil tiver um robô ou assistente automático respondendo no atendimento, gere o `vendas/funil/handoff.md` a partir daqui. Os gatilhos viram regras no assistente e passos de automação da ferramenta que você usa. Mantenha a lógica neutra; se não houver assistente automático, o mesmo protocolo vale para a passagem entre atendente e vendedor.

## Índice
1. Por que handoff bem feito é decisivo
2. Os três tipos de handoff
3. Gatilhos de handoff IA → humano
4. O payload de contexto (o que passar)
5. SLA e roteamento
6. Devolução humano → IA
7. Implementação agnóstica + nota de stack
8. Anti-patterns

---

## 1. Por que handoff bem feito é decisivo

O agente de IA resolve volume e velocidade, mas **não deve segurar tudo**. Os dois erros opostos custam caro:
- **Segurar demais:** o agente insiste em resolver uma objeção complexa, uma reclamação séria ou um lead quente que pede pra falar com gente. Resultado: cliente irritado, venda perdida.
- **Passar de menos contexto:** o agente joga a conversa pro humano sem resumo. Resultado: o humano pede tudo de novo, o cliente repete, a relação esfria.

Handoff bem feito é **invisível pro cliente**: ele sente que falou com uma equipe coordenada, não com um robô que desistiu. Esse é o padrão de qualidade.

---

## 2. Os três tipos de handoff

| Tipo | Quando | Direção |
|---|---|---|
| **Escalonamento IA → humano** | Agente atinge o limite (intenção alta, objeção, reclamação, pedido explícito) | Conversa ativa passa pro atendente |
| **Passagem comercial → pós-venda** | Lead vira cliente (fechado-ganho) | Bastão entre etapas/times (ver `post-sales-playbooks.md`, play 1) |
| **Devolução humano → IA** | Humano resolveu o ponto, conversa volta ao fluxo automatizado | Atendente devolve ao agente |

Este documento foca no **escalonamento IA → humano** (o mais crítico) e cobre os outros dois nas seções 1 e 6.

---

## 3. Gatilhos de handoff IA → humano

Cada gatilho vira uma regra no agente. Quando **qualquer** um dispara, o agente para de conduzir, avisa o cliente com naturalidade ("vou te conectar com [nome/time] que resolve isso melhor 💙") e abre a tarefa de handoff.

**Gatilhos de oportunidade (não perder a venda):**
- **Intenção de compra/agendamento alta**: cliente diz "quero fechar", "como pago", "qual o melhor horário" e o fechamento exige humano.
- **Lead de alto valor/fit**: score acima do limiar (ver `tags-and-fields.md`); merece atenção humana imediata.
- **Pedido de proposta/negociação**: desconto, condição especial, escopo customizado.

**Gatilhos de risco (não deixar piorar):**
- **Reclamação ou insatisfação**: qualquer sinal de problema com serviço/produto.
- **Sentimento negativo / frustração**: tom irritado, "isso não está ajudando", caps lock, xingamento.
- **Loop detectado**: cliente repetiu a mesma dúvida 2x sem resolver, ou o agente não entendeu 2x.
- **Pedido explícito de humano**: "quero falar com uma pessoa" / "atendente". Sempre honrar de imediato.

**Gatilhos de escopo (o agente não deve responder):**
- **Fora de escopo**: assunto que o agente não foi treinado pra tratar (questão clínica/jurídica específica, caso sensível).
- **Dados sensíveis**: informação de saúde, financeira ou pessoal que exige cuidado humano/LGPD.
- **Decisão que exige autoridade**: algo que só o gestor/profissional pode autorizar.

**Gatilho temporal (failsafe):**
- **SLA de resolução estourado**: conversa sem desfecho há X tempo → escalar pra não abandonar o cliente.

> Em contexto de saúde/menores/sensível, o viés é **escalar mais cedo**, não mais tarde. Na dúvida, passa pro humano.

---

## 4. O payload de contexto (o que passar)

O handoff só vale se o humano recebe contexto suficiente pra continuar **sem o cliente repetir nada**. Toda passagem carrega:

```
HANDOFF: {nome do contato} | {data e hora}
├── Contato:        nome, telefone, link do lead no CRM
├── Estágio atual:  onde está no funil + lifecycle stage
├── Motivo:         qual gatilho disparou o handoff
├── Intenção:       o que o cliente quer (em 1 frase)
├── Resumo:         3-5 linhas do que já foi conversado
├── Campos-chave:   serviço de interesse, qualificação, score, datas
├── Sentimento:     neutro / positivo / negativo (+ urgência: baixa/média/alta)
├── Próximo passo:  ação sugerida pro humano ("fechar agendamento de terça 14h")
└── Histórico:      link/thread da conversa completa
```

**Como entregar o payload (escolha conforme a stack):**
- Tarefa no CRM com o resumo no corpo + lead linkado.
- Notificação no canal interno (Slack/Discord/WhatsApp do time) com o bloco acima.
- Nota/atividade no lead para registro permanente.
- Idealmente os três, disparados na mesma automação.

**O resumo é gerado pela IA** (o agente resume a própria conversa): não faça o humano ler 40 mensagens. Prompt sugerido: "Resuma esta conversa em 3-5 linhas para um atendente humano assumir: o que o cliente quer, o que já foi dito, e o próximo passo."

---

## 5. SLA e roteamento

- **SLA de resposta humana:** defina por tipo. Oportunidade quente e reclamação → resposta em minutos. Dúvida fora de escopo → pode ser horas. Documente no `vendas/funil/handoff.md`.
- **Roteamento:** quem recebe? Por área (comercial vs. suporte vs. profissional), por round-robin, ou por dono do lead. Se ninguém assumir dentro do SLA → escalar pro gestor (failsafe).
- **Estado da conversa:** ao escalar, marcar o lead com **tag** "Em atendimento humano" e **pausar os follow-ups automáticos** (senão o cliente recebe robô e humano ao mesmo tempo: erro clássico). Ver `tags-and-fields.md`.

---

## 6. Devolução humano → IA

Quando o humano resolve o ponto (fechou, esclareceu, acalmou), a conversa pode voltar ao fluxo:
- Atendente marca "resolvido" / remove a tag "Em atendimento humano".
- Automações de follow-up são **reativadas** a partir do estágio atualizado.
- O agente retoma com contexto ("que bom que ficou resolvido! ..."), sem reiniciar do zero.

Cuidado: nunca reative o agente no meio de um assunto sensível ainda aberto. A devolução é explícita, feita pelo humano: nunca por timeout silencioso.

---

## 7. Implementação agnóstica + nota de stack

**Pseudocódigo (qualquer orquestrador implementa):**
```
Trigger:   mensagem recebida do cliente (webhook do canal)
Step 1:    Agente classifica a mensagem contra os gatilhos de handoff
Step 2:    SE algum gatilho disparou:
             a. Agente gera resumo da conversa (IA)
             b. Monta o payload de contexto
             c. Cria tarefa no CRM + notifica canal interno
             d. Aplica tag "Em atendimento humano" no lead
             e. Pausa follow-ups automáticos
             f. Responde ao cliente: "vou te conectar com [time]..."
Step 3:    SENÃO: agente continua conduzindo normalmente
Step 4:    Registrar evento "handoff_triggered" {motivo, sentimento, estágio}
```

**Nota de ferramenta (só se você usa alguma):**
- **CRM com automação:** o gatilho de handoff vira um passo no fluxo: criar tarefa para o responsável, mover ou etiquetar o contato e avisar a pessoa certa. Pausar o follow-up automático = checar a etiqueta "Em atendimento humano" antes de cada envio.
- **Assistente automático (robô):** os gatilhos de handoff devem estar escritos nas regras de conduta dele, com a frase exata que ele diz ao passar o bastão.
- **Follow-up automático:** a pausa e a reativação precisam estar ligadas ao mesmo sistema que dispara as mensagens. Pausar num lugar e não no outro faz o contato receber robô e humano ao mesmo tempo.
- Se você usa um CRM específico, peça para adaptar o vocabulário a ele.

---

## 8. Anti-patterns

- **Handoff sem contexto**: passar a conversa nua. O humano pede tudo de novo. Sempre enviar o payload.
- **Handoff tardio**: o agente insiste até o cliente desistir. Escale no primeiro gatilho de risco/oportunidade forte.
- **Ping-pong (robô ↔ humano)**: cliente recebe follow-up automático enquanto fala com humano. Sempre pausar FUP ao escalar.
- **Devolução silenciosa**: agente reassume por timeout no meio de um assunto sensível. Devolução é sempre explícita.
- **Tudo escala**: se todo gatilho dispara handoff, o agente vira só um encaminhador e perde o propósito. Calibre os limiares: o agente resolve o volume; o humano pega o que importa.
- **Sem failsafe**: ninguém assume e o cliente fica no limbo. Sempre ter escalonamento pro gestor por SLA.
