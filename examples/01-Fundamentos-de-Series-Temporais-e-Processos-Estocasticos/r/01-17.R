# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(16)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 250

# Serie nao estacionaria (passeio aleatorio)
x <- cumsum(rnorm(T))
dx <- diff(x)

p1 <- forecast::autoplot(ts(x)) +
  ggplot2::labs(
    title = "Antes: passeio aleatorio (nao estacionario)",
    x = "t",
    y = expression(X[t])
  )

p2 <- forecast::autoplot(ts(dx)) +
  ggplot2::labs(
    title = "Depois: serie diferenciada \u0394X_t = X_t \u2212 X_{t-1}",
    x = "t",
    y = expression(Delta * X[t])
  )

har_ggsave_px(
  har_slide_file(1, 16, "a"),
  p1,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_ggsave_px(
  har_slide_file(1, 16, "b"),
  p2,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_concat_png(
  out_file = har_slide_file(1, 16),
  files = c(
    har_slide_file(1, 16, "a"),
    har_slide_file(1, 16, "b")
  )
)
