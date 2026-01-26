source("slides/utils.R")

set.seed(210)
n <- 160
t <- 1:n

# a) determinística
x_det <- 5 + 0.08*t + rnorm(n, 0, 1)
p_a <- forecast::autoplot(ts(x_det)) +
  ggplot2::labs(x=NULL, y=NULL, title="Determinística: X_t = f(t) + ε_t")

fa <- har_slide_file("02", "10", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT/2)

# b) estocástica (random walk)
u <- rnorm(n, 0, 1)
x_rw <- cumsum(u)
p_b <- forecast::autoplot(ts(x_rw)) +
  ggplot2::labs(x=NULL, y=NULL, title="Estocástica: X_t = X_{t-1} + u_t")

fb <- har_slide_file("02", "10", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT/2)

out <- har_slide_file("02", "10")
har_concat_png(out, c(fa, fb))
