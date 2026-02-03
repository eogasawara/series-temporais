# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(214)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
n <- 300
x <- arima.sim(model = list(ar = 0.7), n = n)

# (a) ACF
fa <- har_slide_file("02", "14", "a")
grDevices::png(fa, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF: dependencia temporal AR(1)")
grDevices::dev.off()

# (b) PACF
fb <- har_slide_file("02", "14", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::pacf(x, main = "PACF: assinatura do AR(1)")
grDevices::dev.off()

# Composicao final do slide
out <- har_slide_file("02", "14")
har_concat_png(out, c(fa, fb))
