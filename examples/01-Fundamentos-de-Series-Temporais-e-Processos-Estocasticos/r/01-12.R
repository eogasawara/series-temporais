# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(11)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 300
phi <- 0.7
x <- as.numeric(arima.sim(model = list(ar = phi), n = T))

file <- har_slide_file(1, 11)
dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)

png(file, width = TSED_WIDTH, height = 640, res = 150)
acf(
  x,
  lag.max = 40,
  main = "ACF",
  xlab = "defasagem (h)",
  ylab = "autocorrelacao"
)
grid()
dev.off()
