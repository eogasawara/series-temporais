source("slides/utils.R")

set.seed(3)
n <- 250

# AR(2): X_t = 0.6 X_{t-1} - 0.2 X_{t-2} + eps_t
x <- stats::arima.sim(model = list(ar = c(0.6, -0.2)), n = n)
x <- ts(x)

p <- forecast::autoplot(x) +
  ggplot2::labs(title = "Série AR(2) simulada", x = "Tempo", y = "Xt")

f_out <- har_slide_file(3, 5)
har_ggsave_px(f_out, p, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)
