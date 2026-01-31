# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

set.seed(3)
n <- 200
eps <- rnorm(n, mean = 0, sd = 1)
x <- ts(eps)

# a) Série (forecast style)
p1 <- forecast::autoplot(x) +
  ggplot2::labs(title = "Ruído branco (realização)", x = "Tempo", y = "Valor")

f_a <- har_slide_file(3, 2, "a")
har_ggsave_px(f_a, p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# b) ACF (base R) — exportando PNG no tamanho half-height
f_b <- har_slide_file(3, 2, "b")
grDevices::png(filename = f_b, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF do ruído branco (esperado ~ 0)")
grDevices::dev.off()

# concat final (vertical)
f_out <- har_slide_file(3, 2)
har_concat_png(f_out, c(f_a, f_b))
