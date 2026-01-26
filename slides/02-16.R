source("slides/utils.R")

set.seed(216)
n <- 250
phi <- 0.8
x <- arima.sim(model = list(ar = phi), n = n)
x_ts <- ts(x)

p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title=paste0("Série AR(1) simulada (φ = ", phi, ")"))

fa <- har_slide_file("02", "16", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT)

fb <- har_slide_file("02", "16", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF do AR(1): decai geometricamente")
grDevices::dev.off()

out <- har_slide_file("02", "16")
har_concat_png(out, c(fa, fb))
