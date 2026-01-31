# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(216)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
n <- 250
phi <- 0.8

x <- arima.sim(model = list(ar = phi), n = n)
x_ts <- ts(x)

# (a) Serie AR(1)
p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = paste0("Serie AR(1) simulada (phi = ", phi, ")"))

fa <- har_slide_file("02", "16", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT)

# (b) ACF
fb <- har_slide_file("02", "16", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF do AR(1): decai geometricamente")
grDevices::dev.off()

# Composicao final do slide
out <- har_slide_file("02", "16")
har_concat_png(out, c(fa, fb))
