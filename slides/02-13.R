source("slides/utils.R")

set.seed(213)
n <- 120
t <- 1:n
s <- 12
x <- 80 + 5*sin(2*pi*t/s) + rnorm(n, 0, 1.2)
x_ts <- ts(x, frequency = s)

p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="Antes: série com sazonalidade")

fa <- har_slide_file("02", "13", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT/2)

st <- stl(x_ts, s.window = "periodic")
S_hat <- st$time.series[, "seasonal"]
y_ts <- ts(as.numeric(x_ts) - as.numeric(S_hat), frequency = s)

p_b <- forecast::autoplot(y_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="Depois: dessazonalização (X_t - Ŝ_t)")

fb <- har_slide_file("02", "13", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT/2)

out <- har_slide_file("02", "13")
har_concat_png(out, c(fa, fb))
