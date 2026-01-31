# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

# Aula 10 — Slide 08: Detecção Baseada em Modelos Temporais
# Objetivo: mostrar que o score pode ser o erro de previsão g_t = |x_t - x̂_t|.
# Referência no PDF: Slide 08 ("Detecção Baseada em Modelos Temporais")

suppressPackageStartupMessages({
  library(harbinger)
})

set.seed(1007)

# Série sintética: AR(1) + 2 anomalias (additive outliers)
n <- 240
x <- as.numeric(arima.sim(model=list(ar=0.75), n=n))
idx_inj <- c(80, 170)
x[idx_inj] <- x[idx_inj] + c(8, -7)
serie <- ts(x)

# Harbinger: detector por modelo temporal (ARIMA) — baseline + score residual
model <- hanr_arima()
model <- fit(model, serie)
det <- detect(model, serie)

har_save_plot(
  file      = har_slide_file(10, 8),
  obj       = model,
  serie     = serie,
  idx       = det$idx,
  detection = det,
  event     = det$event,
  mark.cp   = FALSE
)
