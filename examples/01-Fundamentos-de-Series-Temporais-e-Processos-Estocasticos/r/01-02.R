# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(1)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Serie com tendencia leve e ruido
T <- 120
t <- 1:T
x <- 0.03 * t + rnorm(T, sd = 0.8)

# Harbinger precisa de um objeto para plotagem
obj <- harbinger::harbinger()

har_save_plot(
  file = "figures/01-01.png",
  obj = obj,
  serie = x,
  idx = t,
  mark.cp = FALSE,
  width = TSED_WIDTH,
  height = TSED_HEIGHT
)
