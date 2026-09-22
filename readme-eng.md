# Time Series for Forecasting and Event Detection

<p align="right">
  <a href="README.md">🇧🇷 Português</a> · <strong>🇺🇸 English</strong>
</p>

Repository with teaching and scientific materials on time series, developed in the context of teaching and outreach activities at DAL (Data Analytics Lab).

The course is organized around two central questions:

1. What will happen next?
2. When did something relevant happen, or when is it happening?

The first question leads the **time series forecasting** block. The second leads the **temporal event detection** block, including anomalies, change points, motifs, discords, drift, evaluation, and open problems. The theoretical slides are complemented by videos and by practical materials from the [`tspredit`](https://cefet-rj-dal.github.io/tspredit/) and [`harbinger`](https://cefet-rj-dal.github.io/harbinger/) frameworks.

## Syllabus

Time Series Analysis. Fundamental concepts and structural components of time series. Preprocessing and representation techniques for temporal data. Statistical and computational models for temporal forecasting. Forecast evaluation. Event detection, including anomalies, change points, motifs, discords, and concept drift. Stream detection, online scenarios, and temporal evaluation problems. Practical implementation of methods and performance evaluation on real data.

## Objectives

To provide the essential knowledge for analyzing and modeling temporal data, focusing on two complementary tasks: forecasting future values and detecting relevant events over time. To this end, the course presents a systematic study of the fundamental concepts of time series, preprocessing and representation techniques, forecasting models, and methods for detecting anomalies, change points, recurring patterns, rare patterns, and drift.

The course aims to provide a solid theoretical foundation combined with computational practice, enabling students to select, apply, evaluate, and interpret time series analysis methods in different contexts, including offline and online scenarios, and to develop computational solutions applied to real temporal data.

## Slides

The theoretical slides follow three blocks: foundations and representation, forecasting models, and temporal event detection.

1. Time Series for Forecasting and Event Detection - Foundations of time series oriented toward the two central tasks of the course: forecasting future values and detecting relevant events. [PDF](https://github.com/eogasawara/series-temporais/blob/main/01-TimeSeriesForPredictionAndEvents.pdf)
2. Temporal Structure and Series Components - Decomposition, trend, seasonality, cycles, noise, variance stabilization, and autocorrelation. [PDF](https://github.com/eogasawara/series-temporais/blob/main/02-TemporalStructureAndComponents-Eng.pdf)
3. Time Series Preparation and Representation - Preprocessing, normalization, transformations, local representations, windows, residuals, and predictive modeling. [PDF](https://github.com/eogasawara/series-temporais/blob/main/03-TimeSeriesPreparationAndRepresentation-Eng.pdf)
4. Linear Models and Time Forecasting - White noise, linear processes, lag operator, AR, MA, ARMA, ARIMA, Box-Jenkins, and forecasting. [PDF](https://github.com/eogasawara/series-temporais/blob/main/04-LinearModelsAndForecasting-Eng.pdf)
5. Extended Models for Forecasting - SARIMA, regression with temporal errors, SARIMAX, heteroscedasticity, ARCH/GARCH, nonlinear models, and forecast evaluation. [PDF](https://github.com/eogasawara/series-temporais/blob/main/05-ExtendedForecastingModels-Eng.pdf)
6. Introduction to Event Detection - Concepts, data structure, taxonomy, representation, and main classes of events in time series. [PDF](https://github.com/eogasawara/series-temporais/blob/main/06-EventDetectionOverview-Eng.pdf)
7. Anomaly Detection - Typical behavior, noise, outliers, structural anomalies, thresholds, density, representation, learning, and methods based on regression, classification, clustering, and reconstruction. [PDF](https://github.com/eogasawara/series-temporais/blob/main/07-AnomalyDetection-Eng.pdf)
8. Change Point Detection - Structural changes, statistical hypotheses, segmentation, AMOC, BinSeg, PELT, Chow, CUSUM, SCP, concept drift, and online detectors. [PDF](https://github.com/eogasawara/series-temporais/blob/main/08-ChangePointDetection-Eng.pdf)
9. Motifs and Discords - Recurring and rare patterns in subsequences, indexing, PAA, SAX, similarity, DTW, Matrix Profile, motifs, discords, and advanced topics. [PDF](https://github.com/eogasawara/series-temporais/blob/main/09-MotifsAndDiscords-Eng.pdf)
10. Online Detection and Event Forecasting - Temporal streams, latency, online constraints, memory, adaptive models, concept drift, online forecasting, and methods for streaming data. [PDF](https://github.com/eogasawara/series-temporais/blob/main/10-OnlineDetection-Eng.pdf)
11. Temporal Event Evaluation - Classical metrics, temporal tolerance, SoftED, interval metrics, online evaluation, Detection Probability, Detection Lag, and benchmarks. [PDF](https://github.com/eogasawara/series-temporais/blob/main/11-TemporalEventEvaluation-Eng.pdf)
12. Open Problems in Event Detection - Overview of the area, intersections among subareas, multivariate data, big data, online settings, metrics, explainability, unified view, and research agenda. [PDF](https://github.com/eogasawara/series-temporais/blob/main/12-OpenIssuesInEventDetection-Eng.pdf)
13. Harbinger as an Experimental Environment - Practical block for event detection with `harbinger`, covering workflow, labeled data, visualization, anomaly detectors, residual-based models, evaluation, change points, smoothing, SAX, motifs, and discords. [PDF](https://github.com/eogasawara/series-temporais/blob/main/13-Harbinger.pdf)

## Playlist

The course playlist gathers the video lectures corresponding to the theoretical and practical slides:

[Time Series Analysis](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

[![Watch the playlist on YouTube](https://img.shields.io/badge/YouTube-Watch%20playlist-red?logo=youtube&logoColor=white)](https://www.youtube.com/playlist?list=PLTy3TWJeueGxOv-GZCkNch7pB1pGkhVb4)

## SBBD 2026 Tutorial

The **Event Detection in Time Series** tutorial organizes an integrated selection of course and `harbinger` materials for a session of up to 3h30min, covering foundations, taxonomy, detection strategies, experimental environment, anomalies, change points, motifs, discords, temporal evaluation, and research agenda.

[Access the tutorial slides](https://github.com/eogasawara/series-temporais/tree/main/tutorial)

## Practical Slides

The practical materials below connect theory to tools developed by DAL. They should be read as applied laboratories for the two axes of the course:

- [`tspredit`](https://cefet-rj-dal.github.io/tspredit/) supports the forecasting block, with data preparation, modeling, validation, and comparison of forecasts.
- [`harbinger`](https://cefet-rj-dal.github.io/harbinger/) supports the event detection block, with methods for anomalies, change points, motifs, and evaluation.

At the moment, the practical `tspredit` and `harbinger` materials are available only in English, so this README points to the same files as the Portuguese version. In the future, the English versions of these practical files may follow a separate `_eng` naming convention.

### tspredit

`tspredit` is a framework for time series forecasting. It provides an integrated environment for modeling and forecasting, offering a wide variety of methods, as well as functions for visualization and evaluation of the forecasts produced.

Project page: <https://cefet-rj-dal.github.io/tspredit/>

Full slide decks: [`examples/slides`](https://github.com/cefet-rj-dal/tspredit/tree/main/examples/slides/) · Videos: [tspredit playlist on YouTube](https://youtube.com/playlist?list=PLKGnd3Kb5RZg).

1. overview of the `tspredit` framework for time series forecasting with integrated tuning.
2. practical `tspredit` tutorials, with typical use cases and model comparison.
3. `tspredit` data utilities, covering tabular representation, supervised projection, and temporal splitting for evaluation.
4. filtering and selection techniques for temporal data.
5. augmentation and feature engineering methods for time series.
6. scalable normalization and preprocessing.
7. forecasting models and performance evaluation.
8. customization of `tspredit` workflows and components.

### harbinger

`harbinger` is a framework for event detection in time series. It provides an integrated environment for anomaly detection, change point identification, and discovery of recurring patterns. It offers a wide variety of detection methods, as well as functions for visualization and evaluation of the detections produced.

Project page: <https://cefet-rj-dal.github.io/harbinger/>

Full slide decks: [`examples/slides`](https://github.com/cefet-rj-dal/harbinger/tree/main/examples/slides/) · Videos: [harbinger playlist on YouTube](https://youtube.com/playlist?list=PLLXCJ2dysFtw).

1. presentation of the `harbinger` framework for event detection in time series.
2. practical tutorial on using `harbinger`, with guided application examples.
3. practical examples of using `harbinger` in event detection workflows.
4. thresholding, evaluation, and result analysis in temporal detection tasks.
5. use of datasets and data preparation for temporal detection tasks.
6. time series transformations and preprocessing in `harbinger`.
7. methods for anomaly detection with `harbinger`.
8. methods for change point detection.
9. discovery of motifs, discords, and patterns in time series.
10. customization of detectors and workflows in `harbinger`.

## Repository

<https://github.com/eogasawara/series-temporais>

## Issues

Leave bugs, questions, and suggestions at <https://github.com/eogasawara/series-temporais/issues>.
