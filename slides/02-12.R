source("slides/utils.R")

set.seed(212)
n <- 180
t <- 1:n
x <- 20 + 0.12*t + rnorm(n, 0, 1.0)
x_ts <- ts(x)

p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="Antes: série com tendência")

fa <- har_slide_file("02", "12", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT/2)

# Remoção por regressão (subtração da tendência estimada)
fit <- lm(as.numeric(x_ts) ~ t)
T_hat <- fitted(fit)
y <- as.numeric(x_ts) - T_hat
y_ts <- ts(y)

p_b <- forecast::autoplot(y_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="Depois: subtração da tendência")

fb <- har_slide_file("02", "12", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT/2)

out <- har_slide_file("02", "12")
har_concat_png(out, c(fa, fb))
