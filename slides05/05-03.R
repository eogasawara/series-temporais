# Aula 05 — Slide 03
# Sazonalidade como Estrutura Periódica
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Série simulada com tendência + sazonalidade + ruído (m=12)
n <- 10 * 12
t <- 1:n
trend <- 0.03 * t
season <- 1.2 * sin(2*pi*t/12) + 0.5 * cos(2*pi*t/12)
x <- trend + season + rnorm(n, sd=0.5)
x_ts <- ts(x, frequency = 12)

# Decomposição clássica via STL (tendência/sazonalidade/ruído)
fit <- stl(x_ts, s.window = "periodic")

# Figura: decomposição (estética forecast/Hyndman)
p <- autoplot(fit) + ggtitle("Decomposição STL")

out_png <- har_slide_file("05", "03")
har_ggsave_px(out_png, p)
message("PNG gerado em: ", out_png)
