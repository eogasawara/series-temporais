# Aula 06 — Slide 09
# Gerar figuras (PNG) para o slide e criar uma versão .Rmd documentada.

source("slides/utils.R")

# Pacotes (apenas quando necessário)
if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(6)

# Série com variância crescente (heteroscedasticidade)
n <- 240
t <- 1:n
level <- exp(0.005 * t)
eps <- rnorm(n, sd = 0.25 * level)
x <- level + eps
x_ts <- ts(as.numeric(x))

# Transformação de escala (log) para estabilizar variância
y_log <- log(x_ts - min(x_ts) + 1)

# Subfigura A: série original
pa <- autoplot(x_ts) +
  ggtitle("Variância não-estacionária") +
  ylab("Nível")

# Subfigura B: série transformada (log)
pb <- autoplot(y_log) +
  ggtitle("Transformação de escala") +
  ylab("log(X_t)")

out_a <- har_slide_file("06", "09", "a")
out_b <- har_slide_file("06", "09", "b")
out_main <- har_slide_file("06", "09")

har_ggsave_px(out_a, pa, height_px = TSED_HEIGHT)
har_ggsave_px(out_b, pb, height_px = TSED_HEIGHT)
har_concat_png(out_main, c(out_a, out_b))

message("PNGs gerados em: ", out_a, " | ", out_b, " | ", out_main)

