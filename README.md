# Séries Temporais para Predição e Detecção de Eventos

Repositório com materiais didáticos e científicos sobre séries temporais, desenvolvido no contexto das atividades de ensino e extensão do DAL (Data Analytics Lab).

O curso é organizado em torno de duas perguntas centrais:

1. O que acontecerá depois?
2. Quando algo relevante aconteceu ou está acontecendo?

A primeira pergunta conduz o bloco de **predição de séries temporais**. A segunda conduz o bloco de **detecção de eventos temporais**, incluindo anomalias, pontos de mudança, motifs, discords, drift, avaliação e problemas abertos. Os slides teóricos são complementados por vídeos e por materiais práticos dos frameworks [`tspredit`](https://cefet-rj-dal.github.io/tspredit/) e [`harbinger`](https://cefet-rj-dal.github.io/harbinger/).

## Ementa

Análise de Séries Temporais. Conceitos fundamentais e componentes estruturais das séries temporais. Técnicas de pré-processamento e representação de dados temporais. Modelos estatísticos e computacionais para predição temporal. Avaliação de previsões. Detecção de eventos, incluindo anomalias, pontos de mudança, motifs, discords e desvio de conceito. Detecção em fluxo, cenários online e problemas de avaliação temporal. Implementação prática de métodos e avaliação de desempenho em dados reais.

## Objetivos

Fundamentar os conhecimentos indispensáveis à análise e modelagem de dados temporais, com foco em duas tarefas complementares: prever valores futuros e detectar eventos relevantes ao longo do tempo. Para isso, é realizado um estudo sistemático dos conceitos fundamentais de séries temporais, das técnicas de pré-processamento e representação, dos modelos de predição e dos métodos de detecção de anomalias, pontos de mudança, padrões recorrentes, padrões raros e drift.

O curso busca proporcionar um sólido embasamento teórico aliado à prática computacional, capacitando o aluno a selecionar, aplicar, avaliar e interpretar métodos de análise de séries temporais em diferentes contextos, incluindo cenários offline e online, e a desenvolver soluções computacionais aplicadas a dados temporais reais.

## Slides

Os slides teóricos seguem três blocos: fundamentos e representação, modelos de predição e detecção de eventos temporais.

1. Séries Temporais para Predição e Detecção de Eventos - Fundamentos de séries temporais orientados às duas tarefas centrais do curso: prever valores futuros e detectar eventos relevantes. [PDF](https://github.com/eogasawara/series-temporais/blob/main/01-TimeSeriesForPredictionAndEvents.pdf)
2. Estrutura Temporal e Componentes da Série - Decomposição, tendência, sazonalidade, ciclos, ruído, estabilização da variância e autocorrelação. [PDF](https://github.com/eogasawara/series-temporais/blob/main/02-TemporalStructureAndComponents.pdf)
3. Preparação e Representação de Séries Temporais - Pré-processamento, normalização, transformações, representações locais, janelas, resíduos e modelagem preditiva. [PDF](https://github.com/eogasawara/series-temporais/blob/main/03-TimeSeriesPreparationAndRepresentation.pdf)
4. Modelos Lineares e Previsão Temporal - Ruído branco, processos lineares, operador de defasagem, AR, MA, ARMA, ARIMA, Box-Jenkins e previsão. [PDF](https://github.com/eogasawara/series-temporais/blob/main/04-LinearModelsAndForecasting.pdf)
5. Modelos Estendidos para Predição - SARIMA, regressão com erros temporais, SARIMAX, heterocedasticidade, ARCH/GARCH, modelos não lineares e avaliação de previsões. [PDF](https://github.com/eogasawara/series-temporais/blob/main/05-ExtendedForecastingModels.pdf)
6. Introdução à Detecção de Eventos - Conceitos, estrutura de dados, taxonomia, representação e classes principais de eventos em séries temporais. [PDF](https://github.com/eogasawara/series-temporais/blob/main/06-EventDetectionOverview.pdf)
7. Detecção de Anomalias - Comportamento típico, ruído, outliers, anomalias estruturais, limiares, densidade, representação e pipeline de detecção. [PDF](https://github.com/eogasawara/series-temporais/blob/main/07-AnomalyDetection.pdf)
8. Detecção de Pontos de Mudança - Mudanças estruturais, hipóteses estatísticas, segmentação ótima, estatísticas de mudança e métodos como Chow, CUSUM, Page-Hinkley, PELT, BOCPD, HMM e ML. [PDF](https://github.com/eogasawara/series-temporais/blob/main/08-ChangePointDetection.pdf)
9. Motifs e Discords - Padrões recorrentes e raros em subsequências, janela temporal, similaridade, distância, Matrix Profile, clustering e modelos probabilísticos. [PDF](https://github.com/eogasawara/series-temporais/blob/main/09-MotifsAndDiscords.pdf)
10. Detecção Online e Drift - Fluxo temporal, latência, restrições online, janelas, estatísticas incrementais, modelos adaptativos, métodos online e drift. [PDF](https://github.com/eogasawara/series-temporais/blob/main/10-OnlineDetectionAndDrift.pdf)
11. Avaliação de Eventos Temporais - Correspondência temporal, tolerância, métricas pontuais e intervalares, latência, benchmarks, ground truth e protocolo experimental. [PDF](https://github.com/eogasawara/series-temporais/blob/main/11-TemporalEventEvaluation.pdf)
12. Problemas Abertos em Detecção de Eventos - Fragmentação da área, interseções entre subáreas, tipicidade temporal, teoria geral, multiescala, semântica e desafios científicos. [PDF](https://github.com/eogasawara/series-temporais/blob/main/12-OpenIssuesInEventDetection.pdf)

## Playlist

A playlist do curso reúne as aulas em vídeo correspondentes aos slides teóricos e práticos:

[Análise de Séries Temporais](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

[![Assistir a playlist no YouTube](https://img.shields.io/badge/YouTube-Assistir%20playlist-red?logo=youtube&logoColor=white)](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

## Slides práticos

Os materiais práticos abaixo conectam a teoria às ferramentas desenvolvidas pelo DAL. Eles devem ser lidos como laboratórios aplicados dos dois eixos do curso:

- [`tspredit`](https://cefet-rj-dal.github.io/tspredit/) apoia o bloco de predição, com preparação de dados, modelagem, validação e comparação de previsões.
- [`harbinger`](https://cefet-rj-dal.github.io/harbinger/) apoia o bloco de detecção de eventos, com métodos para anomalias, pontos de mudança, motifs e avaliação.

### tspredit

`tspredit` é uma estrutura (framework) para predição de séries temporais. Ela oferece um ambiente integrado para modelagem e predição, disponibilizando uma ampla variedade de métodos, além de funções para visualização e avaliação das predições realizadas.

Página do projeto: <https://cefet-rj-dal.github.io/tspredit/>

1. [t01-tspredit.pdf](https://github.com/eogasawara/series-temporais/blob/main/t01-tspredit.pdf) - visão geral do framework `tspredit` para predição de séries temporais com ajuste integrado.
2. [t02-tutorial.pdf](https://github.com/eogasawara/series-temporais/blob/main/t02-tutorial.pdf) - tutoriais práticos do `tspredit`, com casos de uso típicos e comparação de modelos.
3. [t03-data.pdf](https://github.com/eogasawara/series-temporais/blob/main/t03-data.pdf) - utilitários de dados do `tspredit`, cobrindo representação tabular, projeção supervisionada e divisão temporal para avaliação.
4. [t04-datasets.pdf](https://github.com/eogasawara/series-temporais/blob/main/t04-datasets.pdf) - uso de datasets e pipelines de ingestão para séries temporais.
5. [t05-filter.pdf](https://github.com/eogasawara/series-temporais/blob/main/t05-filter.pdf) - técnicas de filtragem e seleção de dados temporais.
6. [t06-augment.pdf](https://github.com/eogasawara/series-temporais/blob/main/t06-augment.pdf) - métodos de augmentação e engenharia de features para séries temporais.
7. [t07-normalization.pdf](https://github.com/eogasawara/series-temporais/blob/main/t07-normalization.pdf) - normalização e pré-processamento escalável.
8. [t08-prediction.pdf](https://github.com/eogasawara/series-temporais/blob/main/t08-prediction.pdf) - modelos de previsão e avaliação de performance.
9. [t09-custom.pdf](https://github.com/eogasawara/series-temporais/blob/main/t09-custom.pdf) - customização de workflows e componentes do `tspredit`.

### harbinger

`harbinger` é uma estrutura (framework) para detecção de eventos em séries temporais. Ela oferece um ambiente integrado para a detecção de anomalias, a identificação de pontos de mudança e a descoberta de padrões recorrentes. Disponibiliza uma ampla variedade de métodos de detecção, além de funções para visualização e avaliação das detecções realizadas.

Página do projeto: <https://cefet-rj-dal.github.io/harbinger/>

1. [h01-harbinger.pdf](https://github.com/eogasawara/series-temporais/blob/main/h01-harbinger.pdf) - apresentação do framework `harbinger` para detecção de eventos em séries temporais.
2. [h02-tutorial.pdf](https://github.com/eogasawara/series-temporais/blob/main/h02-tutorial.pdf) - tutorial prático de uso do `harbinger`, com exemplos guiados de aplicação.
3. [h03-general.pdf](https://github.com/eogasawara/series-temporais/blob/main/h03-general.pdf) - visão geral dos componentes e fluxos gerais de trabalho do `harbinger`.
4. [h04-datasets.pdf](https://github.com/eogasawara/series-temporais/blob/main/h04-datasets.pdf) - uso de datasets e preparação de dados para tarefas de detecção temporal.
5. [h05-transformations.pdf](https://github.com/eogasawara/series-temporais/blob/main/h05-transformations.pdf) - transformações e pré-processamento de séries temporais no `harbinger`.
6. [h06-anomalies.pdf](https://github.com/eogasawara/series-temporais/blob/main/h06-anomalies.pdf) - detecção de anomalias com o `harbinger`.
7. [h07-changepoint.pdf](https://github.com/eogasawara/series-temporais/blob/main/h07-changepoint.pdf) - detecção de pontos de mudança com o `harbinger`.
8. [h08-motifs.pdf](https://github.com/eogasawara/series-temporais/blob/main/h08-motifs.pdf) - descoberta de motifs e padrões recorrentes com o `harbinger`.
9. [h09-custom.pdf](https://github.com/eogasawara/series-temporais/blob/main/h09-custom.pdf) - customização de workflows e componentes do `harbinger`.

## Repositório

<https://github.com/eogasawara/series-temporais>

## Issues

Deixe bugs, dúvidas e sugestões em <https://github.com/eogasawara/series-temporais/issues>.
