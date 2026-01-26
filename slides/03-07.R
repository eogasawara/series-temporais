source("slides/utils.R")

set.seed(3)
n <- 300
phi <- 0.8
x <- stats::arima.sim(model = list(ar = phi), n = n)
x <- ts(x)

# a) série
p1 <- forecast::autoplot(x) +
  ggplot2::labs(title = sprintf("Série AR(1) simulada (ϕ = %.1f)", phi), x = "Tempo", y = "Xt")
f_a <- har_slide_file(3, 7, "a")
har_ggsave_px(f_a, p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# b) ACF (base R)
f_b <- har_slide_file(3, 7, "b")
grDevices::png(filename = f_b, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
stats::acf(x, main = "ACF do AR(1): decaimento gradual")
grDevices::dev.off()

# concat final
f_out <- har_slide_file(3, 7)
har_concat_png(f_out, c(f_a, f_b))
