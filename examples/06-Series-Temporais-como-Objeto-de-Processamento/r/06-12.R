# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Aula 06 — Slide 12
# Gerar figuras (PNG) para o slide e criar uma versão .Rmd documentada.

source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

# Pacotes (apenas quando necessário)
if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(6)

# Série com tendência + sazonalidade + ruído + evento (pulso)
n <- 12 * 10
t <- 1:n
trend <- 0.02 * t
season <- 1.4 * sin(2*pi*t/12)
x <- trend + season + rnorm(n, sd=0.6)
event_idx <- 80
x[event_idx] <- x[event_idx] + 4.0
x_ts <- ts(x, frequency=12)

# Decomposição STL e resíduo
fit <- stl(x_ts, s.window = "periodic")
resid <- fit$time.series[, "remainder"]
resid_ts <- ts(as.numeric(resid), frequency=12)

out_png <- har_slide_file("06", "12")

# Preferência: Harbinger para marcar o evento no resíduo (se disponível)
ok <- FALSE
try({
  har_save_plot(
    file = out_png,
    obj = NULL,
    serie = resid_ts,
    idx = event_idx,
    detection = "manual",
    event = "pulse",
    mark.cp = TRUE
  )
  ok <- TRUE
}, silent = TRUE)

# Fallback: ggplot com evento marcado
if (!ok) {
  df <- data.frame(t=1:length(resid_ts), r=as.numeric(resid_ts))
  p <- ggplot(df, aes(x=t, y=r)) +
    geom_line() +
    geom_vline(xintercept = event_idx, linetype=2) +
    ggtitle("Decomposição: resíduo (evento marcado)") +
    ylab("R_t (remainder)")
  har_ggsave_px(out_png, p)
}
