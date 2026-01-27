# Aula 05 — Slide 04
# Diferenciação Sazonal
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Série sazonal + tendência (m=12)
n <- 8 * 12
t <- 1:n
trend <- 0.05 * t
season <- 2 * sin(2*pi*t/12)
x <- trend + season + rnorm(n, sd=0.7)
x_ts <- ts(x, frequency = 12)

# Diferença regular e diferença sazonal
dx <- diff(x_ts, lag = 1)
dsx <- diff(x_ts, lag = 12)

# Subfigura A: diferença regular (remove tendência)
pa <- autoplot(dx) + ggtitle("Dif. regular: ΔX_t = X_t - X_{t-1}") +
  ylab("ΔX_t")

# Subfigura B: diferença sazonal (remove padrão periódico)
pb <- autoplot(dsx) + ggtitle("Dif. sazonal: Δ_s X_t = X_t - X_{t-s} (s=12)") +
  ylab("Δ_s X_t")

out_a <- har_slide_file("05", "04", "a")
out_b <- har_slide_file("05", "04", "b")
out_main <- har_slide_file("05", "04")

# Cada uma com metade da altura, depois concatenação vertical
har_ggsave_px(out_a, pa, height_px = TSED_HEIGHT)
har_ggsave_px(out_b, pb, height_px = TSED_HEIGHT)

har_concat_png(out_main, c(out_a, out_b))

message("PNGs gerados em: ", out_a, " | ", out_b, " | ", out_main)
