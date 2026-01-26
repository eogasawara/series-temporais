source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(210)

n <- 160
t <- 1:n

# (a) Serie deterministica
x_det <- 5 + 0.08 * t + rnorm(n, 0, 1)
p_a <- forecast::autoplot(ts(x_det)) +
  ggplot2::labs(x = NULL, y = NULL, title = "Deterministica: X_t = f(t) + e_t")

fa <- har_slide_file("02", "10", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT / 2)

# (b) Serie estocastica (random walk)
u <- rnorm(n, 0, 1)
x_rw <- cumsum(u)
p_b <- forecast::autoplot(ts(x_rw)) +
  ggplot2::labs(x = NULL, y = NULL, title = "Estocastica: X_t = X_{t-1} + u_t")

fb <- har_slide_file("02", "10", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT / 2)

# Composicao final do slide
out <- har_slide_file("02", "10")
har_concat_png(out, c(fa, fb))
