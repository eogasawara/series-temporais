# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(20)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 250
phi <- 0.8
x <- as.numeric(arima.sim(model = list(ar = phi), n = T))

# (a) Serie
p_series <- forecast::autoplot(ts(x)) +
  ggplot2::labs(
    title = "Serie AR(1)",
    x = "t",
    y = expression(X[t])
  )

har_ggsave_px(
  file = har_slide_file(1, 20, "a"),
  plot = p_series,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

# (b) ACF em base R
file_acf <- har_slide_file(1, 20, "b")
png(file_acf, width = TSED_WIDTH, height = TSED_HEIGHT, res = 150)
acf(
  x,
  lag.max = 40,
  main = "ACF amostral do AR(1)",
  xlab = "defasagem (h)",
  ylab = "autocorrelacao"
)
grid()
dev.off()

har_concat_png(
  out_file = har_slide_file(1, 20),
  files = c(
    har_slide_file(1, 20, "a"),
    har_slide_file(1, 20, "b")
  )
)
