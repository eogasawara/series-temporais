source("slides/utils.R")

set.seed(214)
n <- 300
x <- arima.sim(model = list(ar = 0.7), n = n)

# ACF (a)
fa <- har_slide_file("02", "14", "a")
grDevices::png(fa, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF: dependência temporal AR(1)")
grDevices::dev.off()

# PACF (b)
fb <- har_slide_file("02", "14", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::pacf(x, main = "PACF: assinatura do AR(1)")
grDevices::dev.off()

out <- har_slide_file("02", "14")
har_concat_png(out, c(fa, fb))
