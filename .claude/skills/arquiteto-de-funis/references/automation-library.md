# Automation Library: Biblioteca de automações por objetivo

Catálogo de padrões de automação **agnósticos de ferramenta**. Cada padrão descreve a lógica em pseudocódigo neutro; qualquer ferramenta de automação (Make, Zapier, Power Automate, backend próprio) ou pessoa pode implementar a partir daqui.

> **Como usar:** identifique o objetivo, copie o pseudocódigo, adapte variáveis ao contexto da sua empresa, anexe ao `vendas/funil/automacoes.md`. Se você já usa uma ferramenta, inclua notas específicas dela; caso contrário, deixe neutro e pergunte qual usa.

---

## Princípio de neutralidade

Toda automação tem 4 elementos universais, presentes em qualquer ferramenta de orquestração:

1. **Trigger (gatilho):** evento observável (ex: "lead criado", "estágio mudou", "cron diário 09:00", "cliente respondeu").
2. **Condições/filtros:** regras booleanas (ex: "se telefone válido", "se score ≥ 70").
3. **Ações:** efeitos externos (enviar mensagem, criar tarefa, atualizar campo, registrar evento).
4. **Timing/wait:** espera entre passos (imediato, 5min, D+1, 2h antes de X, cron).

Descrever o padrão usando esses 4 elementos garante que **qualquer desenvolvedor ou RevOps implementa** em seu stack em minutos.

---

## Referência de categorias (exemplos, não prescrições)

Produtos comuns no ecossistema brasileiro: substitua livremente pelo que você usa:

| Função | Exemplos (escolha um) |
|---|---|
| **Automação** | Make, Zapier, Power Automate, Pipefy, backend próprio |
| **CRM** | HubSpot, Pipedrive, RD Station, Salesforce, Bitrix24, Notion, planilha |
| **WhatsApp / mensageria** | Evolution API, WhatsApp Business Cloud, Twilio, Zenvia, Take Blip, SMS |
| **Storage de eventos** | Postgres, Firestore, Google Sheets, BigQuery, próprio DB |
| **IA (classificação / geração)** | Claude, OpenAI, Gemini, modelos locais |
| **Agendamento** | Cal.com, Google Calendar, Calendly, Microsoft Bookings |
| **Webhook layer** | Cloudflare Workers, Vercel Functions, Lambda, backend próprio |

---

## Padrão 1: Boas-vindas ao novo lead

**Objetivo:** responder em <5 minutos todo lead novo e criar tarefa para o atendente.

```
Trigger:     evento "lead_created" (webhook do CRM)
Input:       {nome, telefone, origem, serviço_interesse}
Condição:    telefone válido
Ação 1 (0min):    Enviar WhatsApp de boas-vindas para {telefone}
Ação 2 (0min):    Criar tarefa no CRM "Responder {nome}" com SLA 5min
Ação 3 (opcional, 30min): Se tarefa não concluída → notificar gestor
Ação 4 (log):     Registrar evento "welcome_sent" em storage de métricas
Fallback:    telefone inválido → notificar gestor por canal interno
```

**Copy da mensagem (tom consultivo, WhatsApp):**
```
Olá {{nome}}! 😊 Aqui é da [CLIENTE].
Recebi seu contato sobre {{serviço}}. Como posso te ajudar?
```

**Variáveis a ajustar por cliente:** nome da empresa, serviço padrão quando não vier preenchido, tom da mensagem, SLA (alguns nichos aceitam 15min).

---

## Padrão 2: Lembretes de agendamento escalonado

**Objetivo:** reduzir no-show com lembretes em D-2, D-1 e 2h antes.

```
Trigger:     estágio mudou para "Agendado" OU campo "Data Agendamento" preenchido
Input:       {data_hora, responsável, endereço_ou_link}

Ação D-2 (48h antes):  Enviar confirmação "você confirma? ✅ / 🔄"
Ação D-1 (24h antes):  Reforço do lembrete
Ação 2h-antes:         Lembrete final com endereço ou link

Se cliente responder ✅:    atualizar estágio → "Confirmado"
Se cliente responder 🔄:    criar tarefa "reagendar {nome}"
Se não responder até 1h antes: manter agendado + flag de risco
```

**Copy D-2:**
```
Oi, {{nome}}! 😊
Sua [consulta/demo/visita] é {{data}} às {{hora}}.
Você confirma?
✅ Confirmado
🔄 Preciso reagendar
```

**Copy D-1:**
```
{{nome}}, passando para reforçar:
📅 {{data}} às {{hora}}
Nos vemos amanhã?
```

**Copy 2h antes:**
```
{{nome}}, estamos te esperando! 💙
📍 {{endereço}}
Qualquer dúvida é só chamar.
```

---

## Padrão 3: Nutrição pós-evento (pós-consulta/demo/primeira compra)

**Objetivo:** manter engajamento após o evento e puxar cross-sell/retorno.

```
Trigger:     estágio mudou para "Realizado" / "Primeira Compra"

Ação +1h:    Enviar pedido de feedback curto
Ação +24h:   Mensagem pós-evento (checkin + CTA próximo passo)
Ação +72h:   Se cross-sell pendente → oferta específica
Ação +7d:    Check-in de satisfação
Ação +30d:   Se próximo evento não agendado → lembrete
```

**Copy +1h (feedback):**
```
{{nome}}, que bom que você esteve com a gente! 😊
Me conta em uma palavra: como foi a experiência?
```

**Copy +24h (saúde):**
```
Oi, {{nome}}!
Como você está se sentindo? Se o(a) Dr(a). indicou algum exame ou retorno, posso agendar agora mesmo.
```

**Copy +7d (cross-sell genérico):**
```
{{nome}}, passando para lembrar: {{oferta_cross_sell}}.
Quer que eu verifique um horário pra você?
```

---

## Padrão 4: Reativação de base dormindo (60 dias)

**Objetivo:** reativar clientes inativos antes de virarem churn definitivo.

```
Trigger:     cron diário 09:00
Query:       leads status="Ativo" AND última_interação < (hoje - 60d)

Passo 1:     Para cada lead, mover para estágio "Em Risco" + criar tarefa
Passo 2:     Disparar sequência de reativação:
               D+0:  mensagem suave
               D+15: oferta de retorno com benefício concreto
               D+30: última chance
               D+60: encerramento respeitoso
```

**Copy D+0:**
```
{{nome}}, faz um tempo que não converso com você! 😊
Tá tudo bem? Posso te ajudar em algo?
```

**Copy D+15:**
```
{{nome}}, lembrei de você hoje.
{{oferta_concreta_com_benefício}}.
Quer que eu verifique sua agenda?
```

**Copy D+30:**
```
{{nome}}, última tentativa por aqui.
Se quiser voltar, é só responder esta mensagem.
Se preferir não receber mais, também é só avisar. 💙
```

---

## Padrão 5: Cross-sell baseado em histórico

**Objetivo:** identificar oportunidade de venda adicional a partir do perfil e histórico do cliente.

```
Trigger:     estágio mudou para "Realizado"
Input:       {perfil_cliente, histórico_serviços}

Ação 1:      Chamar modelo de IA (ou regras) para sugerir serviço complementar
             Input: perfil + histórico
             Output: {serviço_sugerido, mensagem_curta} ou {null, null}
Ação 2:      Se sugestão existe:
               → Enviar mensagem ao cliente
               → Criar tarefa "Cross-sell sugerido: {serviço}" para atendente
Ação 3:      Registrar evento "cross_sell_suggested"
```

**Regras determinísticas (alternativa à IA):**
```
SE paciente fez consulta cardiológica E idade > 45 E nunca fez ultrassom
    → sugerir "avaliação cardiológica completa"

SE cliente comprou tratamento estético A E protocolo prevê complemento B
    → sugerir B com janela ideal

SE aluno de academia faz 3 aulas/semana E nunca fez avaliação física
    → sugerir "avaliação física"
```

**Prompt de IA sugerido (se usar modelo generativo):**
```
Você é um atendente comercial humanizado do segmento {nicho}.
Dado o histórico do cliente abaixo, sugira 1 serviço cross-sell
relevante e uma mensagem curta de WhatsApp (máx 3 linhas, tom
acolhedor, 1 emoji).

Histórico: {{histórico_json}}

Retorne JSON:
{"servico_sugerido": "...", "mensagem": "..."}

Se não houver oportunidade clara, retorne:
{"servico_sugerido": null, "mensagem": null}
```

---

## Padrão 6: Confirmação bidirecional (cliente responde ✅ / 🔄)

**Objetivo:** processar resposta do cliente a lembretes e atualizar CRM automaticamente.

```
Trigger:     mensagem recebida do cliente (webhook do canal de mensageria)
Input:       {telefone, texto_mensagem}

Passo 1:     Buscar lead/contato no CRM por telefone
Passo 2:     Se encontrado, classificar intenção:
               - CONFIRMAR → mover para "Confirmado" + enviar "Perfeito, te espero!"
               - REAGENDAR → criar tarefa + enviar "Claro, qual horário fica melhor?"
               - CANCELAR → mover para "Perdido" + confirmar cancelamento
               - PERGUNTA → notificar atendente humano
               - OUTRO → salvar como atividade, aguardar humano
```

**Classificação via IA (prompt):**
```
A mensagem a seguir é uma resposta a um lembrete de agendamento.
Classifique em uma destas categorias:
CONFIRMAR / REAGENDAR / CANCELAR / PERGUNTA / OUTRO

Mensagem: "{{texto}}"

Responda apenas a categoria, em maiúsculas.
```

**Classificação sem IA (regra simples):**
```
SE texto contém "✅" OU "confirm" OU "sim"               → CONFIRMAR
SE texto contém "🔄" OU "remarcar" OU "outra data"       → REAGENDAR
SE texto contém "cancel" OU "desistir" OU "não vou"      → CANCELAR
SE texto termina com "?"                                 → PERGUNTA
SENÃO                                                    → OUTRO
```

---

## Padrão 7: SLA alert: lead parado tempo demais

**Objetivo:** alertar gestor quando lead trava em algum estágio além do SLA.

```
Trigger:     cron a cada 1h
Query:       leads onde tempo_no_estágio > SLA_do_estágio

SLAs padrão (ajustar por cliente):
  - Novo Lead        > 15 min   → alerta CRÍTICO
  - Qualificação     > 24 h     → alerta médio
  - Agendado         > 7 dias   → alerta médio (pode indicar esquecimento de atualização)
  - Proposta         > 14 dias  → alerta médio
  - Negociação       > 21 dias  → alerta médio

Ação:        Para cada lead fora de SLA:
               - Notificar gestor (Slack / Discord / WhatsApp / email)
               - Criar tarefa "Recuperar lead {nome}: parado há {N} dias"
               - Registrar evento "sla_breach"
```

---

## Padrão 8: Pedido de avaliação / review após NPS positivo

**Objetivo:** capturar reviews de clientes satisfeitos no canal que importa (Google, Reclame Aqui, loja de app).

```
Trigger:     avaliação interna (NPS/CSAT) registrada com score ≥ 9

Passo 1:     Esperar 2h (emoção decantar sem esfriar)
Passo 2:     Enviar mensagem com link para review público
Passo 3:     Tag "review_solicitado" no CRM
Passo 4:     Criar tarefa de acompanhamento em D+3 (caso não tenha avaliado)
```

**Copy:**
```
{{nome}}, que bom saber que você gostou! 💙
Se puder deixar uma avaliação aqui, ajuda muito outras pessoas a nos encontrar:
{{link_google_ou_outro}}
Obrigado!
```

---

## Padrão 9: Funil B2B: Demo agendada → realizada → proposta

**Objetivo:** nutrir ciclo comercial longo com follow-ups consistentes.

```
Fase 1: Pré-demo:
  Trigger: Demo Agendada
  D-1:  Email com agenda + material prévio + link de acesso
  D-0 (1h antes): lembrete do link

Fase 2: Pós-demo:
  Trigger: Demo Realizada
  +1h:   Resumo da demo + gravação + próximos passos
  D+1:   Follow-up humano do vendedor
  D+3:   Caso de uso relevante
  D+7:   Comparativo vs. alternativa
  D+14:  Última chamada antes de pausa

Fase 3: Proposta:
  Trigger: Proposta Enviada
  D+3:   "Teve chance de olhar?"
  D+7:   Reiteração de valor + esclarecimento de dúvidas
  D+14:  Última tentativa com oferta de conversa
```

---

## Padrão 10: Qualificação automática com IA (ou regras)

**Objetivo:** qualificar lead no momento da captura e direcionar para estágio correto.

```
Trigger:     submissão de formulário (landing page, lead form de ads)
Input:       {dados_formulário}

Passo 1:     Normalizar dados (telefone, email)
Passo 2:     Calcular score de fit (IA ou regras)
Passo 3:     Criar lead no CRM com:
               - score atribuído
               - pipeline correto (alto fit → comercial direto; baixo → nutrição)
               - campo "Origem" preenchido via UTM
               - responsável atribuído (round-robin ou por regra)
Passo 4:     Se alto fit → disparar Padrão 1 (boas-vindas + tarefa SLA)
             Se baixo fit → entrar em sequência de nutrição de longo prazo
```

**Regras determinísticas de scoring (exemplo):**
```
SCORE = 0
SE porte_empresa IN [nosso ICP]         → +30
SE segmento IN [nossos segmentos]       → +20
SE cargo IN [decisor, influenciador]    → +20
SE budget_declarado >= ticket_mínimo    → +20
SE tem urgência declarada               → +10

SE SCORE >= 70  → "alto fit"
SE SCORE 40-69  → "médio fit"
SE SCORE < 40   → "baixo fit"
```

---

## Convenções recomendadas (independem da ferramenta)

- **Nomenclatura:** `{negocio}_{objetivo}_v{versao}`: ex: `academia_boas_vindas_lead_v1`. Facilita achar, versionar, desativar.
- **Credenciais:** sempre via cofre/secrets do orquestrador; nunca hardcoded no workflow.
- **Error handling:** todo fluxo de produção tem branch de erro que notifica canal interno (Slack/Discord/email).
- **Logging:** todo evento relevante vai para um storage central (tabela ou sheet), com pelo menos `{client_id, lead_id, event_type, payload, timestamp}`. Isso alimenta dashboards.
- **Retry:** em chamadas HTTP para APIs externas, usar 3 tentativas com backoff exponencial.
- **Rate limit:** respeitar limites do canal (WhatsApp Business tem regras de frequência: não enviar >1 msg não-solicitada por dia para o mesmo contato).
- **LGPD:** para clientes no Brasil, não enviar campanha de reativação a quem nunca deu consentimento. Manter flag `opt_in` nos contatos.

---

## Schema mínimo de eventos (qualquer banco serve)

Para alimentar dashboards e relatórios, manter uma tabela/coleção de eventos:

```
funnel_events:
  id              identificador único
  negocio         qual negócio (só use se tiver mais de um)
  lead_id         referência ao lead no CRM
  pipeline_id     referência ao pipeline
  stage           estágio atual
  event_type      string (ex: 'welcome_sent', 'reminder_d2', 'confirmed')
  payload         JSON/objeto com dados específicos do evento
  created_at      timestamp
```

Índices recomendados: `(negocio, lead_id)`, `(event_type)`, `(created_at desc)`.

Implementável em Postgres, MySQL, Firestore, Google Sheets, Airtable, ou até um CSV append-only: o importante é a forma, não a ferramenta.
