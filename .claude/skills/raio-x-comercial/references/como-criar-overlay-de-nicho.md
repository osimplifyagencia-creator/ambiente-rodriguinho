# Como criar o complemento do seu nicho

O gabarito tem duas camadas. O **núcleo** (`assets/gabarito-nucleo.md`) cobre cerca de 80% de qualquer negócio que vende por atendimento. O **complemento de nicho** cobre o que só existe no seu mercado. Esta skill não traz nenhum complemento pronto: o seu nasce da sua própria operação, seguindo este passo a passo.

## Regra de entrada

Um ponto só vira **complemento de nicho** se passar nos dois filtros:

1. **É específico?** Se vale para clínica, loja e imobiliária igual, é núcleo, não complemento.
2. **Muda um número?** Mesmo filtro do núcleo. Lista decorativa não entra.

## Como descobrir os pontos do seu nicho

Não invente. Derive de fonte real, nesta ordem:

1. **Rode o núcleo primeiro** na sua empresa e anote tudo que "faltou perguntar".
2. **Leia o seu funil real.** Etapas que não existem em outros negócios são candidatas.
3. **Registre o seu processo tácito.** O que você faz e não sabe explicar costuma ser o complemento inteiro.
4. **Olhe as perdas.** Os motivos de perda mais frequentes apontam os pontos que faltam.
5. **Cheque o regulatório.** Nicho com órgão regulador (saúde, financeiro, jurídico) sempre gera pontos de conformidade.

## Estrutura obrigatória do arquivo

Salve em `gestao/raio-x/complemento-do-nicho.md`:

```
# Complemento de nicho: {{Nome}}
> Validado em {{data}}. Aplicar junto com o núcleo.

## O que muda neste nicho          3 a 6 particularidades que explicam o resto
## Pontos de inspeção adicionais   tabelas por bloco, IDs com prefixo N-
## Números de referência do nicho  faixa saudável x alerta, por etapa
## Armadilhas conhecidas           erros que já custaram dinheiro
## Campos que este nicho exige     lista para o CRM
```

**IDs:** prefixo `N-` mais a letra do bloco e o número (`N-A.1` é um ponto de nicho no bloco Atendimento). Nunca reaproveite ID do núcleo.

## Quanto é demais

Alvo: **10 a 25 pontos.** Passou disso, provavelmente tem núcleo disfarçado de nicho, ou o nicho está definido de forma estreita demais (`clínica de estética facial` em vez de `clínica`).

## Depois de rodar

Todo complemento novo entra em `references/validacao.md` como **não validado** até um ciclo completo de correções confirmar que os pontos provaram (mexeram num número).
