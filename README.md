# Slides de Séries Temporais

Repositório com materiais didáticos e científicos sobre séries temporais, desenvolvido no contexto das atividades de ensino e extensão do DAL (Data Analytics Lab). O material integra slides, vídeos e implementações práticas, abordando de forma unificada problemas de predição e detecção de eventos em dados temporais.

## Ementa

Análise de séries temporais, abordando conceitos fundamentais e componentes estruturais. Técnicas de pré-processamento e representação de dados temporais. Métodos estatísticos e computacionais para análise, predição e detecção de eventos, incluindo anomalias, pontos de mudança, desvio de conceito e padrões recorrentes. Avaliação em tarefas temporais. Processamento de séries em fluxo e em tempo real. Implementação prática e análise de desempenho em dados reais.

## Objetivos

Fundamentar os conhecimentos essenciais para análise e modelagem de dados temporais, com foco na identificação de padrões, eventos relevantes e comportamentos dinâmicos ao longo do tempo. O curso aborda, de forma sistemática, conceitos fundamentais, técnicas de pré-processamento e representação, além de métodos estatísticos e computacionais para detecção de anomalias, pontos de mudança, desvio de conceito e predição.

Busca-se aliar embasamento teórico sólido à prática computacional, capacitando o aluno a selecionar, aplicar, avaliar e interpretar métodos de análise de séries temporais em diferentes contextos, incluindo cenários offline e online, bem como a desenvolver soluções computacionais aplicadas a dados temporais reais.

## Slides

1. [01-Fundamentos-de-Series-Temporais-e-Processos-Estocasticos.pdf](01-Fundamentos-de-Series-Temporais-e-Processos-Estocasticos.pdf) — fundamentos de séries temporais e processos estocásticos aplicados.
2. [02-Estrutura-Temporal-em-Series-Temporais.pdf](02-Estrutura-Temporal-em-Series-Temporais.pdf) — estrutura temporal e componentes de séries temporais.
3. [03-Modelos-Lineares-em-Series-Temporais.pdf](03-Modelos-Lineares-em-Series-Temporais.pdf) — modelos lineares e seus pressupostos em séries temporais.
4. [04-Previsao-em-Series-Temporais.pdf](04-Previsao-em-Series-Temporais.pdf) — técnicas de predição e avaliação preditiva.
5. [05-Por-que-Estender-os-Modelos-Lineares.pdf](05-Por-que-Estender-os-Modelos-Lineares.pdf) — limitações dos modelos lineares e motivações para extensões.
6. [06-Series-Temporais-como-Objeto-de-Processamento.pdf](06-Series-Temporais-como-Objeto-de-Processamento.pdf) — séries temporais como objetos de processamento e análise.
7. [07-Representacao-de-Eventos-em-Series-Temporais.pdf](07-Representacao-de-Eventos-em-Series-Temporais.pdf) — representação de eventos em dados temporais.
8. [08-Eventos-em-Series-Temporais.pdf](08-Eventos-em-Series-Temporais.pdf) — conceitos e tipos de eventos em séries temporais.
9. [09-Anomalias-em-Series-Temporais.pdf](09-Anomalias-em-Series-Temporais.pdf) — detecção de anomalias em séries temporais.
10. [10-Formulacao-do-Problema-de-Deteccao.pdf](10-Formulacao-do-Problema-de-Deteccao.pdf) — formulação do problema de detecção de eventos.
11. [11-Pontos-de-Mudanca-em-Series-Temporais.pdf](11-Pontos-de-Mudanca-em-Series-Temporais.pdf) — pontos de mudança e conceitos relacionados.
12. [12-Deteccao-de-Pontos-de-Mudanca.pdf](12-Deteccao-de-Pontos-de-Mudanca.pdf) — métodos de detecção de pontos de mudança.
13. [13-Motifs-em-Series-Temporais.pdf](13-Motifs-em-Series-Temporais.pdf) — descoberta de motifs em séries temporais.
14. [14-Discords-em-Series-Temporais.pdf](14-Discords-em-Series-Temporais.pdf) — identificação de discords e padrões raros.
15. [15-Paradigmas-de-Deteccao-Temporal.pdf](15-Paradigmas-de-Deteccao-Temporal.pdf) — paradigmas de detecção temporal.
16. [16-Classes-de-Metodos-Online.pdf](16-Classes-de-Metodos-Online.pdf) — classes de métodos online para detecção.
17. [17-Teoria-Geral-de-Eventos-em-Series-Temporais.pdf](17-Teoria-Geral-de-Eventos-em-Series-Temporais.pdf) — teoria geral de eventos em séries temporais.
18. [18-O-Problema-da-Avaliacao-de-Eventos.pdf](18-O-Problema-da-Avaliacao-de-Eventos.pdf) — avaliação de eventos e critérios de desempenho.
19. [19-Eventos-como-Pontos-Uma-Simplificacao.pdf](19-Eventos-como-Pontos-Uma-Simplificacao.pdf) — eventos como pontos: simplificação e implicações.
20. [20-Avaliacao-como-Problema-Cientifico.pdf](20-Avaliacao-como-Problema-Cientifico.pdf) — avaliação como problema científico em detecção temporal.
21. [21-A-Area-de-Deteccao-de-Eventos.pdf](21-A-Area-de-Deteccao-de-Eventos.pdf) — panorama da área de detecção de eventos.
22. [22-Deteccao-de-Eventos-como-Problema-Aberto.pdf](22-Deteccao-de-Eventos-como-Problema-Aberto.pdf) — detecção de eventos como problema aberto de pesquisa.

## Slides práticos

Os materiais práticos abaixo complementam os slides teóricos com fluxos de uso, exemplos guiados e uma visão aplicada de ferramentas para predição e detecção de eventos em séries temporais. Os slides de `tspredit` estão agrupados para facilitar o estudo sequencial, enquanto `harbinger` apresenta uma proposta de framework voltada à detecção de eventos.

### tspredit

tspredit é uma estrutura (framework) para predição de séries temporais. Ela oferece um ambiente integrado para modelagem e predição, disponibilizando uma ampla variedade de métodos, além de funções para visualização e avaliação das predições realizadas.

1. [t01-tspredit.pdf](t01-tspredit.pdf) — visão geral do framework `tspredit` para predição de séries temporais com ajuste integrado.
2. [t02-tutorial.pdf](t02-tutorial.pdf) — tutoriais práticos do `tspredit`, com casos de uso típicos e comparação de modelos.
3. [t03-data.pdf](t03-data.pdf) — utilitários de dados do `tspredit`, cobrindo representação tabular, projeção supervisionada e divisão temporal para avaliação.
4. [t04-datasets.pdf](t04-datasets.pdf) — uso de datasets e pipelines de ingestão para séries temporais.
5. [t05-filter.pdf](t05-filter.pdf) — técnicas de filtragem e seleção de dados temporais.
6. [t06-augment.pdf](t06-augment.pdf) — métodos de aumento de dados (data augmentation) e engenharia de atributos para séries temporais.
7. [t07-normalization.pdf](t07-normalization.pdf) — normalização e pré-processamento escalável.
8. [t08-prediction.pdf](t08-prediction.pdf) — modelos de predição e avaliação de desempenho.
9. [t09-custom.pdf](t09-custom.pdf) — customização de workflows e componentes do `tspredit`.

https://cefet-rj-dal.github.io/tspredit

### harbinger

Harbinger é uma estrutura (framework) para detecção de eventos em séries temporais. Ela oferece um ambiente integrado para detecção de anomalias, pontos de mudança e descoberta de padrões recorrentes. Disponibiliza uma ampla variedade de métodos de detecção, além de funções para visualização e avaliação das detecções realizadas.

1. [h1-harbinger.pdf](h1-harbinger.pdf) — apresentação do framework `harbinger` para detecção de eventos em séries temporais.

https://cefet-rj-dal.github.io/harbinger

## Playlist

A playlist reúne as aulas completas associadas aos slides, permitindo acompanhar tanto os conceitos teóricos quanto sua aplicação prática:

https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4
