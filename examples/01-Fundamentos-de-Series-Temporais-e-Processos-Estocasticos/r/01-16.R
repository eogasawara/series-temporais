# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(15)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 250

# Ruido branco (estacionario)
x_wn <- rnorm(T)
p1 <- forecast::autoplot(ts(x_wn)) +
  ggplot2::labs(
    title = "Ruido branco (estacionario)",
    x = "t",
    y = expression(X[t])
  )

# Passeio aleatorio (nao estacionario)
x_rw <- cumsum(rnorm(T))
p2 <- forecast::autoplot(ts(x_rw)) +
  ggplot2::labs(
    title = "Passeio aleatorio (nao estacionario)",
    x = "t",
    y = expression(X[t])
  )

har_ggsave_px(
  har_slide_file(1, 15, "a"),
  p1,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_ggsave_px(
  har_slide_file(1, 15, "b"),
  p2,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_concat_png(
  out_file = har_slide_file(1, 15),
  files = c(
    har_slide_file(1, 15, "a"),
    har_slide_file(1, 15, "b")
  )
)
