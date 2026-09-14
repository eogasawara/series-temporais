# Prompts Gamma - Ajustes dos slides 06 a 13

Objetivo: atualizar os slides principais `06` a `13` usando como referência a versão mais revisada da pasta `tutorial`, sem transformar os decks completos em versões resumidas de minicurso.

Observação: após a renumeração, não existe mais `14-Harbinger.pdf` na raiz. O antigo Harbinger agora é `13-Harbinger.pdf`.

## Regra geral para todos os arquivos

Use a versão da pasta `tutorial` como referência de revisão textual, clareza didática, escolhas visuais e organização narrativa, mas mantenha a versão da raiz como deck completo.

Não compacte métodos ou técnicas centrais. Quando a versão do tutorial tiver fundido métodos por limitação de tempo, desfaça a fusão no deck principal. Cada método relevante deve continuar com seu próprio slide conceitual, exemplo ou formalização quando isso existir na versão completa.

Só faça fusão quando os slides forem de contexto, transição ou motivação e estiverem muito vazios ou redundantes. Não funda slides de métodos, formalizações autorais, exemplos importantes ou resultados comparativos.

Preserve formalizações autorais. Se houver conflito entre reduzir redundância e manter uma formalização criada para o material, preserve a formalização.

Quando um método ou técnica central ao tema da aula for melhor explicado por meio de um algoritmo, apresente-o em pseudocódigo seguindo este padrão:

```text
ENTRADA: ...
PRÉ-CONDIÇÃO: ...
PASSO 1 — ...
PASSO 2 — ...
...
SAÍDA: ...
PÓS-CONDIÇÃO: ...
```

O slide de algoritmo deve ter duas colunas:

- esquerda, aproximadamente 40%: teoria resumida, ideia central, fórmula essencial e interpretação dos parâmetros;
- direita, aproximadamente 60%: bloco de pseudocódigo.

Nem todo método precisa de pseudocódigo. Use pseudocódigo apenas quando o algoritmo clarificar o conceito melhor do que texto e fórmula isolados. Se já existir um slide conceitual imediatamente antes sobre o mesmo método, reduza esse slide ao mínimo ou remova-o, pois a coluna esquerda do slide de algoritmo assume esse papel. O objetivo é evitar redundância.

---

## Prompt para `06-EventDetectionOverview.pdf`

```text
Atualize o arquivo `06-EventDetectionOverview.pdf` usando `tutorial/02-Eventos-Taxonomia.pdf` como referência de revisão.

Objetivo: manter este deck como a apresentação completa de introdução à detecção de eventos, preservando formalizações, taxonomia e exemplos.

Incorpore da versão tutorial:
- revisão textual mais direta;
- melhor clareza das definições;
- manutenção das formalizações de série temporal, evento pontual, anomalia, change point e motif;
- fechamento mais enxuto baseado no slide "Como podemos organizar o tema".

Não remova nem simplifique as formalizações autorais.

Pode remover ou reduzir:
- slides de fechamento redundante;
- referências bibliográficas se o padrão dos demais decks não exigir slide final;
- slides de contexto que estejam vazios ou apenas repitam a organização do tema.

Não adicione pseudocódigo neste deck, salvo se for para ilustrar genericamente o pipeline de detecção. Este arquivo é conceitual e taxonômico; pseudocódigo detalhado deve ficar nos decks de métodos.
```

## Prompt para `07-AnomalyDetection.pdf`

```text
Atualize o arquivo `07-AnomalyDetection.pdf` usando `tutorial/03-Anomalias.pdf` como referência de revisão textual, visual e didática, mas preserve o deck principal como versão completa.

Objetivo: incorporar a clareza da versão tutorial sem fundir métodos. A versão tutorial reduziu e fundiu vários tópicos por tempo; aqui isso não deve acontecer para métodos centrais.

Pode fundir ou reduzir apenas slides de contexto muito vazios, por exemplo:
- objetivos do capítulo;
- introduções redundantes;
- transições entre famílias de métodos quando não contiverem formalização ou exemplo.

Não funda os seguintes tópicos/métodos:
- anomalias pontuais;
- anomalias sequenciais;
- anomalias contextuais;
- anomalias fora de contexto;
- cenários supervisionado, semissupervisionado e não supervisionado;
- regressão por janela deslizante;
- erro/escore de anomalia;
- limiar gaussiano;
- limiar por boxplot;
- teoria de valores extremos para resíduos;
- seguidores de tendência;
- modelos estatísticos de regressão;
- ARIMA como detector por desvio;
- regressores de aprendizado de máquina;
- regressores profundos;
- métodos recentes e híbridos;
- classificação;
- SVM;
- agrupamento;
- K-Means;
- métodos estatísticos;
- histograma;
- métodos espectrais;
- autoencoder;
- teoria da informação;
- volatilidade anômala;
- GARCH;
- valores extremos.

Inclua ou revise slides de pseudocódigo quando isso melhorar a compreensão. Priorize pseudocódigo para:
- regressão por janela deslizante para detecção de anomalias;
- cálculo de escore por resíduo e aplicação de limiar;
- ARIMA como detector por desvio;
- histograma como detector estatístico simples;
- K-Means como detector por distância;
- autoencoder por erro de reconstrução;
- GARCH para volatilidade anômala, se o slide atual estiver muito conceitual.

Para cada slide de pseudocódigo, use duas colunas:
- esquerda: ideia, fórmula essencial e parâmetros;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.

Se o pseudocódigo substituir um slide conceitual imediatamente anterior, reduza esse slide anterior ao mínimo ou remova-o para evitar redundância.
```

## Prompt para `08-ChangePointDetection.pdf`

```text
Atualize o arquivo `08-ChangePointDetection.pdf` usando `tutorial/04-Pontos-de-Mudanca.pdf` como referência de revisão, mas preserve a versão completa dos métodos.

Objetivo: melhorar clareza e fluxo sem compactar detectores de change point ou drift.

Pode fundir ou reduzir apenas:
- slides de motivação muito vazios;
- slides de taxonomia que apenas enumerem tópicos sem formalização;
- transições entre change point e drift quando forem repetitivas.

Não funda os seguintes métodos/tópicos:
- AMOC;
- hipótese nula e alternativa do AMOC;
- razão de verossimilhança;
- BinSeg;
- PELT;
- Chow Test;
- GFT/CUSUM;
- SCP;
- Change Finder;
- concept drift;
- drift real versus virtual;
- tipos de drift;
- tipos de detector de drift;
- estratégias de tratamento de drift;
- DDM;
- HDDM;
- Hoeffding bound;
- CUSUM;
- ECDD;
- MCDD;
- Page-Hinkley;
- KSWIN;
- KLD;
- ADWIN.

Inclua ou revise slides de pseudocódigo para os métodos em que o algoritmo é central:
- AMOC;
- BinSeg;
- PELT;
- CUSUM ou GFT/CUSUM;
- Change Finder;
- ADWIN;
- Page-Hinkley ou KSWIN, se houver espaço;
- DDM/HDDM, se o slide atual estiver excessivamente textual.

Use duas colunas no slide de algoritmo:
- esquerda: intuição, função objetivo ou estatística monitorada, parâmetros;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.

Preserve formalizações autorais. Não substitua fórmulas por texto genérico.
```

## Prompt para `09-MotifsAndDiscords.pdf`

```text
Atualize o arquivo `09-MotifsAndDiscords.pdf` usando `tutorial/05-Motifs-e-Discords.pdf` como referência de revisão visual e didática, mas mantenha a versão completa dos métodos.

Objetivo: melhorar a narrativa de motifs e discords sem compactar algoritmos de descoberta.

Pode fundir ou reduzir apenas:
- slides de contexto que apenas motivem recorrência ou isolamento;
- transições sem conteúdo técnico;
- slides de fechamento redundantes.

Não funda os seguintes tópicos/métodos:
- definição de motif;
- ocorrência;
- formalização de motif;
- motifs triviais e exclusion zone;
- normalização;
- PAA;
- SAX;
- similaridade;
- distância euclidiana;
- Hamming;
- DTW;
- lower bounds;
- brute-force discovery;
- index-based discovery;
- random projection;
- early-abandon distance;
- Matrix Profile;
- motifs por Matrix Profile;
- discords por Matrix Profile;
- motifs multivariados;
- tamanho variável;
- ranking de motifs;
- big data e streaming;
- STAMP, STOMP, SCRIMP, PMP e VALMOD quando aparecerem como variantes.

Inclua ou revise slides de pseudocódigo para:
- PAA;
- SAX;
- DTW;
- brute-force motif discovery;
- index-based discovery com PAA/SAX;
- random projection, se a explicação textual estiver abstrata;
- Matrix Profile;
- discord discovery por maiores valores do Matrix Profile.

Para cada algoritmo, use duas colunas:
- esquerda: teoria resumida, fórmula essencial e parâmetros como tamanho da janela, alfabeto, distância, limiar ou exclusion zone;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.

Não remova formalizações de ocorrência, motif ou distância; elas são centrais para a aula.
```

## Prompt para `10-OnlineDetection.pdf`

```text
Atualize o arquivo `10-OnlineDetection.pdf` usando `tutorial/06-Online-Drift.pdf` como referência de clareza e organização, mas mantenha a versão completa dos cenários e métodos.

Objetivo: melhorar a explicação de detecção online sem reduzir o deck a uma versão de minicurso.

Pode fundir ou reduzir apenas:
- slides de contexto muito vazios;
- transições entre offline, online e predição online;
- slides que repitam a mesma restrição operacional sem acrescentar fórmula, exemplo ou método.

Não funda os seguintes tópicos:
- detecção offline;
- detecção online;
- predição online;
- treino/teste tradicional;
- treino/teste em streaming;
- restrição de não olhar para o futuro;
- early detection;
- rapidez versus falso positivo;
- fast data;
- modelos estáticos versus dinâmicos;
- full-memory;
- no-memory;
- windowed memory;
- retreinamento por batches recentes;
- aprendizado incremental;
- concept drift online;
- estabilidade-plasticidade;
- active learning para drift;
- passive learning para drift;
- predição por classificação;
- predição por regressão;
- detecção de eventos na série prevista;
- online multivariate anomaly detection;
- métodos distance-based;
- métodos tree-based;
- métodos projection-based;
- latência e viés temporal;
- métodos híbridos.

Inclua ou revise slides de pseudocódigo para:
- loop geral de detecção online;
- gerenciamento por janela de memória;
- aprendizado incremental;
- adaptação ativa a drift;
- adaptação passiva a drift;
- predição online seguida de detecção de evento;
- cálculo de latência de detecção, se fizer sentido neste deck.

Use duas colunas:
- esquerda: restrição teórica, parâmetros e interpretação;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.
```

## Prompt para `11-TemporalEventEvaluation.pdf`

```text
Atualize o arquivo `11-TemporalEventEvaluation.pdf` usando `tutorial/07-Avaliacao-Temporal.pdf` como referência de revisão textual e clareza, mas preserve a versão completa das métricas e formalizações.

Objetivo: melhorar a didática da avaliação temporal sem apagar detalhes importantes de métricas.

Pode fundir ou reduzir apenas:
- slides introdutórios muito vazios;
- exemplos redundantes;
- transições entre blocos de métricas.

Não funda nem remova formalizações ou métricas centrais:
- matriz de confusão;
- accuracy;
- error rate;
- precision;
- recall;
- F1;
- Fβ;
- specificity;
- fallout;
- ROC;
- AUC;
- AUC-PR;
- time tolerance;
- hard evaluation;
- soft evaluation;
- SoftED;
- função de pertinência temporal;
- SoftED mapping;
- restrições do SoftED;
- TP, FP, TN e FN soft;
- soft precision, recall e F1;
- eventos pontuais versus intervalares;
- point-adjusted F-score;
- delay-thresholded point-adjusted F-score;
- segment-wise F-score;
- range-based F-score;
- avaliação online;
- detection probability;
- detection lag;
- batch size;
- benchmarks.

Inclua ou revise slides de pseudocódigo para:
- avaliação hard ponto a ponto;
- aplicação de tolerância temporal;
- SoftED mapping;
- cálculo de métricas soft;
- avaliação de eventos intervalares por cobertura/range-based;
- cálculo de detection lag em avaliação online.

Use duas colunas:
- esquerda: definição, fórmula e interpretação dos parâmetros;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.

Preserve a linguagem mais clara da versão tutorial para explicar por que avaliação de eventos não é classificação ponto a ponto.
```

## Prompt para `12-OpenIssuesInEventDetection.pdf`

```text
Atualize o arquivo `12-OpenIssuesInEventDetection.pdf` usando `tutorial/09-Agenda-de-Pesquisa.pdf` como referência de síntese e organização.

Objetivo: manter o deck como fechamento amplo de pesquisa, mas melhorar a fluidez e reduzir slides de contexto vazios.

Aqui a fusão é aceitável porque o deck é de agenda de pesquisa, não de métodos algorítmicos. Mesmo assim, não remova ideias centrais.

Pode fundir:
- slides bibliométricos muito detalhados, se a mensagem principal for preservada;
- slides de word clouds separados, se a comparação entre vocabulários continuar clara;
- desafios técnicos em blocos coerentes;
- tendências emergentes em blocos coerentes.

Preserve:
- área ampla e ativa;
- três áreas centrais;
- mapa sistemático da produção;
- evolução das publicações;
- interseções entre áreas;
- vocabulário das subáreas;
- séries multivariadas;
- escala e big data;
- detecção online;
- métricas para eventos;
- explicabilidade;
- visão unificada;
- transfer learning;
- LLMs;
- robustez;
- associação entre eventos;
- edge/eficiência energética;
- métodos híbridos;
- lacunas para aplicações reais;
- agenda prática.

Não é necessário adicionar pseudocódigo neste deck.

Use a versão tutorial para melhorar agrupamentos como:
- desafios técnicos;
- desafios metodológicos;
- tendências emergentes;
- oportunidades de pesquisa.

Mantenha tom de fechamento e agenda, não de revisão exaustiva.
```

## Prompt para `13-Harbinger.pdf`

```text
Atualize o arquivo `13-Harbinger.pdf` usando `tutorial/08-Harbinger.pdf` como referência de clareza e foco, mas preserve a versão completa como material prático do framework.

Objetivo: melhorar o fluxo do deck prático sem apagar etapas importantes do uso do Harbinger.

Pode fundir ou reduzir apenas:
- transições muito vazias;
- slides com imagens sem texto que não acrescentem informação;
- explicações repetidas de setup quando já estiverem claras.

Não funda os seguintes tópicos:
- workflow recorrente;
- setup mínimo;
- dados rotulados;
- visualização inicial;
- contrato comum do Harbinger;
- saída padronizada;
- inspeção de dados;
- resumo de dataset;
- benchmark Yahoo A1;
- `har_plot()` como diagnóstico;
- séries univariadas e multivariadas;
- detector por histograma;
- avaliação do baseline;
- ARIMA;
- resíduos e limiar;
- avaliação estrita e suave;
- AMOC;
- transformações;
- moving average smoother;
- SAX/XSAX;
- motifs e discords;
- detector simbólico de motifs.

Inclua ou revise slides de pseudocódigo quando eles ajudarem a explicar o workflow:
- workflow geral do Harbinger;
- detector por histograma;
- detector ARIMA por resíduo;
- avaliação hard/soft;
- AMOC no Harbinger;
- transformação SAX/XSAX seguida de motif discovery.

Use duas colunas:
- esquerda: ideia do método, chamada conceitual e parâmetros principais;
- direita: pseudocódigo no padrão ENTRADA, PRÉ-CONDIÇÃO, PASSOS, SAÍDA e PÓS-CONDIÇÃO.

Não transforme o deck em tutorial resumido. Ele deve continuar sendo uma referência prática completa.
```
