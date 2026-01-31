# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(202)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Serie multiplicativa: nivel cresce e a variancia cresce junto
n  <- 120
t  <- 1:n
s  <- 12

trend  <- 50 + 0.4 * t
season <- 1 + 0.25 * sin(2 * pi * t / s)
noise  <- exp(rnorm(n, mean = 0, sd = 0.10))

x <- trend * season * noise
x_ts <- ts(x, frequency = s)

# (a) Serie original com variancia crescente
p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Serie com estrutura multiplicativa")

fa <- har_slide_file(2, 2, "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT / 2)

# (b) Log estabiliza a variancia e aproxima estrutura aditiva
xlog_ts <- ts(log(x), frequency = s)
p_b <- forecast::autoplot(xlog_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Apos log: variancia mais estavel")

fb <- har_slide_file(2, 2, "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT / 2)

# Composicao final do slide
out <- har_slide_file(2, 2)
har_concat_png(out, c(fa, fb))
