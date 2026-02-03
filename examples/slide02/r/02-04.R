source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(204)

# Tamanho da serie
n <- 200
t <- 1:n

# (a) Tendencia deterministica linear
x_det <- 10 + 0.05 * t + rnorm(n, 0, 1.2)
x_det_ts <- ts(x_det)

p_a <- forecast::autoplot(x_det_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Tendencia deterministica (linear) + ruido")

fa <- har_slide_file("02", "04", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT / 2)

# (b) Tendencia estocastica (passeio aleatorio)
u <- rnorm(n, 0, 1)
x_sto <- cumsum(u)
x_sto_ts <- ts(x_sto)

p_b <- forecast::autoplot(x_sto_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Tendencia estocastica (passeio aleatorio)")

fb <- har_slide_file("02", "04", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT / 2)

# Composicao final do slide
out <- har_slide_file("02", "04")
har_concat_png(out, c(fa, fb))
