# Tutorial SBBD 2026 - Detecção de Eventos em Séries Temporais

Material do tutorial **Detecção de Eventos em Séries Temporais**, organizado para uma sessão de 3h a 3h30min. O roteiro integra fundamentos de séries temporais, taxonomia de eventos, métodos de detecção, avaliação temporal, uso do framework `harbinger` e agenda de pesquisa.

## Slides

1. [00 - Introdução](https://github.com/eogasawara/series-temporais/blob/main/tutorial/00-Introducao.pdf) - apresentação do instrutor, linha de pesquisa, DAL Toolbox, TSPredIT, Harbinger, livro e mapa do tutorial.
2. [01 - Fundamentos](https://github.com/eogasawara/series-temporais/blob/main/tutorial/01-Fundamentos.pdf) - conceitos essenciais de séries temporais para detecção de eventos: componentes, decomposição, estacionaridade, autocorrelação, pré-processamento, janelas, normalização e divisão temporal.
3. [02 - Eventos e Taxonomia](https://github.com/eogasawara/series-temporais/blob/main/tutorial/02-Eventos-Taxonomia.pdf) - definição de eventos, formalizações, taxonomia, anomalias, pontos de mudança, motifs, discords, estrutura dos dados, cenários de detecção e avaliação.
4. [03 - Anomalias](https://github.com/eogasawara/series-temporais/blob/main/tutorial/03-Anomalias.pdf) - anomalias pontuais, sequenciais e contextuais, dados rotulados, detecção por modelos esperados, janelas deslizantes, resíduos, limiares e famílias de métodos.
5. [04 - Pontos de Mudança](https://github.com/eogasawara/series-temporais/blob/main/tutorial/04-Pontos-de-Mudanca.pdf) - mudança estrutural, change points, AMOC, BinSeg, PELT, concept drift, tipos de drift, adaptação e detectores online.
6. [05 - Motifs e Discords](https://github.com/eogasawara/series-temporais/blob/main/tutorial/05-Motifs-e-Discords.pdf) - subsequências recorrentes e raras, motifs triviais, PAA, SAX, similaridade, DTW, Matrix Profile, motifs, discords e conexões com detecção de eventos.
7. [06 - Online e Drift](https://github.com/eogasawara/series-temporais/blob/main/tutorial/06-Online-Drift.pdf) - detecção online, predição online, restrições de fluxo, impossibilidade de olhar o futuro, latência, memória, drift e adaptação.
8. [07 - Avaliação Temporal](https://github.com/eogasawara/series-temporais/blob/main/tutorial/07-Avaliacao-Temporal.pdf) - limitações de métricas ponto a ponto, tolerância temporal, hard e soft evaluation, SoftED, eventos intervalares, avaliação online e atraso de detecção.
9. [08 - Harbinger](https://github.com/eogasawara/series-temporais/blob/main/tutorial/08-Harbinger.pdf) - síntese experimental com o `harbinger`: workflow, contrato comum, visualização, detectores, resíduos, avaliação, AMOC, SAX, motifs e discords.
10. [09 - Agenda de Pesquisa](https://github.com/eogasawara/series-temporais/blob/main/tutorial/09-Agenda-de-Pesquisa.pdf) - fechamento com panorama da área, interseções entre subáreas, desafios em multivariância, online, métricas, visão unificada e oportunidades de pesquisa.

## Sequência recomendada

O Harbinger aparece após a avaliação temporal para funcionar como síntese prática. Assim, o participante primeiro vê o vocabulário, os tipos de evento, os métodos e os critérios de avaliação; depois observa como esses elementos se organizam em um workflow experimental.

## Repositório

<https://github.com/eogasawara/series-temporais>
