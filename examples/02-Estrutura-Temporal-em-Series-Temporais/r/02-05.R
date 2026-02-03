# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(205)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Parametros da serie sazonal
n <- 120
t <- 1:n
s <- 12

season <- 5 * sin(2 * pi * t / s) + 2 * cos(2 * pi * t / s)
x <- 100 + season + rnorm(n, 0, 1.0)
x_ts <- ts(x, frequency = s)

p <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Sazonalidade: padrao periodico (s = 12)")

out <- har_slide_file("02", "05")
har_ggsave_px(out, p)
