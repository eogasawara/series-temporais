# Séries Temporais

Repositório com materiais didáticos e científicos sobre séries temporais, desenvolvido no contexto das atividades de ensino e extensão do DAL (Data Analytics Lab). O material integra slides, vídeos e implementações práticas, abordando de forma unificada problemas de predição e detecção de eventos em dados temporais.

## Ementa

Análise de Séries Temporais. Conceitos fundamentais e componentes estruturais das séries temporais. Técnicas de pré-processamento e representação de dados temporais. Avaliação em tarefas temporais. Métodos estatísticos e computacionais para análise de séries temporais. Detecção de eventos, incluindo anomalias, pontos de mudança, desvio de conceito e padrões recorrentes. Análise de séries temporais em fluxo e em tempo real. Implementação prática de métodos e avaliação de desempenho em dados reais.

## Objetivos

Fundamentar os conhecimentos indispensáveis à análise e modelagem de dados temporais, com foco na identificação de padrões, eventos relevantes e comportamentos dinâmicos ao longo do tempo. Para isso, é realizado um estudo sistemático dos conceitos fundamentais de séries temporais, das técnicas de pré-processamento e representação, bem como dos métodos estatísticos e computacionais voltados à detecção de anomalias, pontos de mudança, desvio de conceito e predição.

O curso busca proporcionar um sólido embasamento teórico aliado à prática computacional, capacitando o aluno a selecionar, aplicar, avaliar e interpretar métodos de análise de séries temporais em diferentes contextos, incluindo cenários offline e online, e a desenvolver soluções computacionais aplicadas a dados temporais reais.

## Slides

1. Fundamentos de Séries Temporais - Sequências temporais, processos estocásticos, trajetória, média, variância, autocovariância, autocorrelação e estacionariedade. [PDF](https://github.com/eogasawara/series-temporais/blob/main/01-Fundamentals.pdf)
2. Estrutura Temporal - Decomposição, tendência, sazonalidade, ciclos, ruído, dependência temporal e transformações estruturais. [PDF](https://github.com/eogasawara/series-temporais/blob/main/02-TemporalStructure.pdf)
3. Processamento de Séries Temporais - Pré-processamento, remoção de tendência, estabilização da variância, decomposição, janelas e representações temporais. [PDF](https://github.com/eogasawara/series-temporais/blob/main/03-TimeSeriesProcessing.pdf)
4. Modelos Lineares - Ruído branco, processos lineares, operador de defasagem, modelos AR, MA, ARMA, ARIMA, ACF e PACF. [PDF](https://github.com/eogasawara/series-temporais/blob/main/04-LinearModels.pdf)
5. Previsão em Séries Temporais - Formulação matemática da previsão, inferência, erro de previsão, modelos autoregressivos, intervalos e avaliação. [PDF](https://github.com/eogasawara/series-temporais/blob/main/05-Forecasting.pdf)
6. Extensões de Modelos Temporais - Limitações dos modelos lineares, SARIMA, regressão com erros temporais, modelos dinâmicos, volatilidade e não linearidade. [PDF](https://github.com/eogasawara/series-temporais/blob/main/06-ModelExtensions.pdf)
7. Introdução à Detecção de Eventos - Conceitos de eventos temporais, estrutura de dados, taxonomia, representação e classes principais: anomalias, pontos de mudança, motifs e discords. [PDF](https://github.com/eogasawara/series-temporais/blob/main/07-EventDetection.pdf)
8. Anomalias em Séries Temporais - Comportamento típico, ruído, outliers, anomalias estruturais, limiares estatísticos, densidade condicional, representação e pipeline de detecção. [PDF](https://github.com/eogasawara/series-temporais/blob/main/08-Anomalies.pdf)
9. Pontos de Mudança - Mudanças estruturais, hipóteses estatísticas, segmentação ótima, estatísticas de mudança, pipeline e métodos como Chow, CUSUM, Page-Hinkley, verossimilhança, PELT, BOCPD, HMM e ML. [PDF](https://github.com/eogasawara/series-temporais/blob/main/09-ChangePoints.pdf)
10. Motifs e Discords - Subsequências, janela temporal, similaridade, padrões recorrentes, padrões raros, distância ao vizinho mais próximo, Matrix Profile, clustering e modelos probabilísticos. [PDF](https://github.com/eogasawara/series-temporais/blob/main/10-MotifsAndDiscords.pdf)
11. Detecção Online e Drift - Modos de operação, latência, restrições online, janela deslizante, estatísticas incrementais, modelos adaptativos, score de detecção e drift. [PDF](https://github.com/eogasawara/series-temporais/blob/main/11-OnlineDetectionAndDrift.pdf)
12. Avaliação de Eventos Temporais - Correspondência temporal, tolerância, precision, recall, F1, erro temporal, métricas como função da tolerância, avaliação contínua e benchmarks. [PDF](https://github.com/eogasawara/series-temporais/blob/main/12-EventEvaluation.pdf)
13. Tendências e Problemas Abertos - Fragmentação da área, interseções entre subáreas, arquitetura da detecção de eventos, tipicidade temporal, teoria geral e desafios científicos. [PDF](https://github.com/eogasawara/series-temporais/blob/main/13-OpenIssues.pdf)

## Playlist

[Análise de Séries Temporais](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

[![Assistir a playlist no YouTube](https://img.shields.io/badge/YouTube-Assistir%20playlist-red?logo=youtube&logoColor=white)](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

## Slides práticos

Os materiais práticos abaixo complementam os slides teóricos com fluxos de uso, exemplos guiados e uma visão aplicada de ferramentas para predição e detecção de eventos em séries temporais. Os slides de `tspredit` estão agrupados para facilitar o estudo sequencial, enquanto `harbinger` apresenta a proposta de framework voltada à detecção de eventos.

### tspredit

`tspredit` é uma estrutura (framework) para predição de séries temporais. Ela oferece um ambiente integrado para modelagem e predição, disponibilizando uma ampla variedade de métodos, além de funções para visualização e avaliação das predições realizadas.

1. [t01-tspredit.pdf](https://github.com/eogasawara/series-temporais/blob/main/t01-tspredit.pdf) - visão geral do framework `tspredit` para predição de séries temporais com ajuste integrado.
2. [t02-tutorial.pdf](https://github.com/eogasawara/series-temporais/blob/main/t02-tutorial.pdf) - tutoriais práticos do `tspredit`, com casos de uso típicos e comparação de modelos.
3. [t03-data.pdf](https://github.com/eogasawara/series-temporais/blob/main/t03-data.pdf) - utilitários de dados do `tspredit`, cobrindo representação tabular, projeção supervisionada e divisão temporal para avaliação.
4. [t04-datasets.pdf](https://github.com/eogasawara/series-temporais/blob/main/t04-datasets.pdf) - uso de datasets e pipelines de ingestão para séries temporais.
5. [t05-filter.pdf](https://github.com/eogasawara/series-temporais/blob/main/t05-filter.pdf) - técnicas de filtragem e seleção de dados temporais.
6. [t06-augment.pdf](https://github.com/eogasawara/series-temporais/blob/main/t06-augment.pdf) - métodos de augmentação e engenharia de features para séries temporais.
7. [t07-normalization.pdf](https://github.com/eogasawara/series-temporais/blob/main/t07-normalization.pdf) - normalização e pré-processamento escalável.
8. [t08-prediction.pdf](https://github.com/eogasawara/series-temporais/blob/main/t08-prediction.pdf) - modelos de previsão e avaliação de performance.
9. [t09-custom.pdf](https://github.com/eogasawara/series-temporais/blob/main/t09-custom.pdf) - customização de workflows e componentes do `tspredit`.

<https://cefet-rj-dal.github.io/tspredit/>

### harbinger

`harbinger` é uma estrutura (framework) para detecção de eventos em séries temporais. Ela oferece um ambiente integrado para a detecção de anomalias, a identificação de pontos de mudança e a descoberta de padrões recorrentes. Disponibiliza uma ampla variedade de métodos de detecção, além de funções para visualização e avaliação das detecções realizadas.

1. [h01-harbinger.pdf](https://github.com/eogasawara/series-temporais/blob/main/h01-harbinger.pdf) - apresentação do framework `harbinger` para detecção de eventos em séries temporais.
2. [h02-tutorial.pdf](https://github.com/eogasawara/series-temporais/blob/main/h02-tutorial.pdf) - tutorial prático de uso do `harbinger`, com exemplos guiados de aplicação.
3. [h03-general.pdf](https://github.com/eogasawara/series-temporais/blob/main/h03-general.pdf) - visão geral dos componentes e fluxos gerais de trabalho do `harbinger`.
4. [h04-datasets.pdf](https://github.com/eogasawara/series-temporais/blob/main/h04-datasets.pdf) - uso de datasets e preparação de dados para tarefas de detecção temporal.
5. [h05-transformations.pdf](https://github.com/eogasawara/series-temporais/blob/main/h05-transformations.pdf) - transformações e pré-processamento de séries temporais no `harbinger`.
6. [h06-anomalies.pdf](https://github.com/eogasawara/series-temporais/blob/main/h06-anomalies.pdf) - detecção de anomalias com o `harbinger`.
7. [h07-changepoint.pdf](https://github.com/eogasawara/series-temporais/blob/main/h07-changepoint.pdf) - detecção de pontos de mudança com o `harbinger`.
8. [h08-motifs.pdf](https://github.com/eogasawara/series-temporais/blob/main/h08-motifs.pdf) - descoberta de motifs e padrões recorrentes com o `harbinger`.
9. [h09-custom.pdf](https://github.com/eogasawara/series-temporais/blob/main/h09-custom.pdf) - customização de workflows e componentes do `harbinger`.

<https://cefet-rj-dal.github.io/harbinger/>

## Repositório

<https://github.com/eogasawara/series-temporais>

## Issues

Deixe bugs, dúvidas e sugestões em <https://github.com/eogasawara/series-temporais/issues>.
