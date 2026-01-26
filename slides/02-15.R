source("slides/utils.R")

set.seed(215)
n <- 400

x_short <- arima.sim(model = list(ar = 0.5), n = n)
x_slow  <- arima.sim(model = list(ar = 0.98), n = n)

fa <- har_slide_file("02", "15", "a")
grDevices::png(fa, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x_short, main = "Decaimento rápido (AR(1), φ = 0.5)")
grDevices::dev.off()

fb <- har_slide_file("02", "15", "b")
grDevices::png(fb, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x_slow, main = "Decaimento muito lento (AR(1), φ = 0.98)")
grDevices::dev.off()

out <- har_slide_file("02", "15")
har_concat_png(out, c(fa, fb))
