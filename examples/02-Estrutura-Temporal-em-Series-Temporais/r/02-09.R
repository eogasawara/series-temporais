# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(209)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Parametros basicos
n <- 180
t <- 1:n
s <- 12

# Componentes
Tt <- 50 + 0.15 * t
St <- 4 * sin(2 * pi * t / s)
Ct <- 3 * sin(2 * pi * t / 60)
eps <- rnorm(n, 0, 1.2)

x <- Tt + St + Ct + eps
x_ts <- ts(x, frequency = s)

p <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Interacao: tendencia + sazonalidade + ciclo + ruido")

out <- har_slide_file("02", "09")
har_ggsave_px(out, p)
