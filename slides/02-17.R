source("slides/utils.R")

set.seed(217)
n <- 250
theta <- 0.7
x <- arima.sim(model = list(ma = theta), n = n)
x_ts <- ts(x)

p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title=paste0("Série MA(1) simulada (θ = ", theta, ")"))

fa <- har_slide_file("02", "17", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT)

fb <- har_slide_file("02", "17", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF do MA(1)")
grDevices::dev.off()

out <- har_slide_file("02", "17")
har_concat_png(out, c(fa, fb))
