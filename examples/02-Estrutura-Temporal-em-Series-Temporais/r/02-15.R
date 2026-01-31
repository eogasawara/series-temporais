# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(215)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
n <- 400

# Serie com dependencia curta
x_short <- arima.sim(model = list(ar = 0.5), n = n)

# Serie com dependencia longa
x_slow <- arima.sim(model = list(ar = 0.98), n = n)

fa <- har_slide_file("02", "15", "a")
grDevices::png(fa, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x_short, main = "Decaimento rapido (AR(1), phi = 0.5)")
grDevices::dev.off()

fb <- har_slide_file("02", "15", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x_slow, main = "Decaimento muito lento (AR(1), phi = 0.98)")
grDevices::dev.off()

# Composicao final do slide
out <- har_slide_file("02", "15")
har_concat_png(out, c(fa, fb))
