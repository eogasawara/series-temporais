# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(8)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 200
t <- 1:T

# Serie 1: variancia constante (homocedastica)
x_homo <- rnorm(T, mean = 0, sd = 1)
x_homo_ts <- ts(x_homo, start = 1, frequency = 1)

p1 <- forecast::autoplot(x_homo_ts) +
  ggplot2::labs(
    title = "homocedasticidade",
    x = "t",
    y = expression(X[t])
  )

# Serie 2: variancia variavel (heterocedastica)
sigma_t <- 0.4 + 1.6 * (t - 1) / (T - 1)
x_hetero <- rnorm(T, mean = 0, sd = sigma_t)
x_hetero_ts <- ts(x_hetero, start = 1, frequency = 1)

p2 <- forecast::autoplot(x_hetero_ts) +
  ggplot2::labs(
    title = "heterocedasticidade",
    x = "t",
    y = expression(X[t])
  )

har_ggsave_px(
  file = har_slide_file(1, 8, "a"),
  plot = p1,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_ggsave_px(
  file = har_slide_file(1, 8, "b"),
  plot = p2,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_concat_png(
  out_file = har_slide_file(1, 8),
  files = c(
    har_slide_file(1, 8, "a"),
    har_slide_file(1, 8, "b")
  )
)
