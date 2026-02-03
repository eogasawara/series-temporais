# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

# Aula 09 — Slide 03: Comportamento Típico e Anomalia
# Figura: série + anomalias detectadas via Harbinger (ARIMA residual-based)
# Referência no PDF: Slide 03 ("Comportamento Típico e Anomalia")

suppressPackageStartupMessages({
  library(harbinger)
})

set.seed(903)

# Série sintética: AR(1) estacionário + 2 anomalias pontuais (outliers aditivos)
n <- 220
x <- as.numeric(arima.sim(model=list(ar=0.7), n=n))
ao_idx <- c(70, 155)
x[ao_idx] <- x[ao_idx] + c(7, -6)
serie <- ts(x)

# Detector Harbinger (anomalias via ARIMA)
model <- hanr_arima()
model <- fit(model, serie)
detection <- detect(model, serie)

idx <- detection$idx

# Plot estilo Harbinger, marcando as anomalias detectadas
har_save_plot(
  file      = har_slide_file(9, 3),
  obj       = model,
  serie     = serie,
  idx       = idx,
  detection = detection,
  event     = detection$event,
  mark.cp   = FALSE
)
