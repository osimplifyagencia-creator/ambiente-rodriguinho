# anuncios/

Tudo de anúncio pago: Meta Ads (Facebook e Instagram) e Google Ads.

| Subpasta | O que fica |
|---|---|
| `campanhas/` | Uma pasta por campanha, com o nome `AAAA-MM-nome` (objetivo, público, verba, estado, ids). |
| `criativos/` | As peças: imagens, vídeos, textos e títulos de cada anúncio, por campanha. |
| `relatorios/` | Leituras de resultado: `AAAA-MM-DD-assunto.md` (o que gastou, o que trouxe, o que mudar). |
| `dados/` | Números puxados das plataformas (exportações e leituras da API). |
| `google-ads/` | Estrutura e decisões das campanhas do Google. |
| `gmn/` | Perfil da Empresa no Google: fotos, posts, respostas a avaliações. |
| `pre-voo/` | O dossiê de prontidão antes de rodar tráfego. |
| `historico/` e `registro-de-decisoes/` | O que foi testado, o que se aprendeu e por que cada decisão foi tomada. |

- **Mídia pesada** que o Claude gera na montagem (vídeos, renders) vai numa subpasta `render/`, que não sobe para o GitHub.
- **Regras:** anúncio nasce pausado e só é ativado com o seu ok. Gasto novo e aumento de verba também só com o seu ok.
- **Chaves** da Meta e do Google ficam no `.env`, nunca aqui.
- **Por onde começar:** peça "vê se estou pronto para anunciar" (skill `pre-voo-de-trafego`). Para ligar as contas, "me ajuda a configurar o acesso da Meta" (skill `meta-app-e-acessos`).
