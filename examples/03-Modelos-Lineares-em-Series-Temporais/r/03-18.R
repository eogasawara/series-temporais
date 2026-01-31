# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

set.seed(3)
n <- 300
eps <- rnorm(n)
x_rw <- ts(cumsum(eps))
dx <- ts(diff(x_rw))

p1 <- forecast::autoplot(x_rw) +
  ggplot2::labs(title = "Passeio aleatório (raiz unitária)", x = "Tempo", y = "Xt")

p2 <- forecast::autoplot(dx) +
  ggplot2::labs(title = "Primeira diferença: ΔXt = Xt - Xt-1", x = "Tempo", y = "ΔXt")

f_a <- har_slide_file(3, 18, "a")
f_b <- har_slide_file(3, 18, "b")
har_ggsave_px(f_a, p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT/2, dpi = TSED_DPI)
har_ggsave_px(f_b, p2, width_px = TSED_WIDTH, height_px = TSED_HEIGHT/2, dpi = TSED_DPI)

f_out <- har_slide_file(3, 18)
har_concat_png(f_out, c(f_a, f_b))
