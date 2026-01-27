source("slides/utils.R")

set.seed(3)
n <- 400
x <- stats::arima.sim(model = list(ar = c(0.6, -0.25)), n = n)
x <- ts(x)

# a) ACF para contraste (opcional didático)
f_a <- har_slide_file(3, 10, "a")
grDevices::png(filename = f_a, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF (AR(2): decaimento)")
grDevices::dev.off()

# b) PACF (corte em p=2)
f_b <- har_slide_file(3, 10, "b")
grDevices::png(filename = f_b, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::pacf(x, main = "PACF (AR(2): corte após a defasagem 2)")
grDevices::dev.off()

# concat final
f_out <- har_slide_file(3, 10)
har_concat_png(f_out, c(f_a, f_b))
