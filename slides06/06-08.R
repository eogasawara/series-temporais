# Aula 06 — Slide 08
# Gerar figuras (PNG) para o slide e criar uma versão .Rmd documentada.

source("slides/utils.R")

# Pacotes (apenas quando necessário)
if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(6)

# Série com tendência + variações locais
n <- 250
t <- 1:n
x <- 0.03 * t + arima.sim(model=list(ar=0.6), n=n, sd=0.8)
x_ts <- ts(as.numeric(x))

# Estimar tendência simples (média móvel)
trend_hat <- stats::filter(x_ts, rep(1/21, 21), sides = 2)

# Remover tendência: Y_t = X_t - T_hat_t
y_detr <- x_ts - trend_hat

# Subfigura A: original + tendência estimada
dfa <- data.frame(t=1:n, x=as.numeric(x_ts), trend=as.numeric(trend_hat))
pa <- ggplot(dfa, aes(x=t)) +
  geom_line(aes(y=x)) +
  geom_line(aes(y=trend)) +
  ggtitle("série original + tendência estimada") +
  ylab("Nível")

# Subfigura B: série sem tendência (variações locais)
pb <- autoplot(y_detr) +
  ggtitle("Y_t = X_t - T̂_t (variações locais)") +
  ylab("Resíduo de tendência")

out_a <- har_slide_file("06", "08", "a")
out_b <- har_slide_file("06", "08", "b")
out_main <- har_slide_file("06", "08")

har_ggsave_px(out_a, pa, height_px = TSED_HEIGHT)
har_ggsave_px(out_b, pb, height_px = TSED_HEIGHT)
har_concat_png(out_main, c(out_a, out_b))

message("PNGs gerados em: ", out_a, " | ", out_b, " | ", out_main)

