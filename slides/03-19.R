source("slides/utils.R")

set.seed(3)
n <- 320
drift <- 0.05
eps <- rnorm(n, sd = 1)

x <- ts(cumsum(drift + eps))
dx <- ts(diff(x))
d2x <- ts(diff(x, differences = 2))

p1 <- forecast::autoplot(x)  + ggplot2::labs(title = "Série original (não estacionária)", x = "Tempo", y = "Xt")
p2 <- forecast::autoplot(dx) + ggplot2::labs(title = "Primeira diferença (ΔXt)", x = "Tempo", y = "ΔXt")
p3 <- forecast::autoplot(d2x)+ ggplot2::labs(title = "Segunda diferença (Δ²Xt)", x = "Tempo", y = "Δ²Xt")

f_a <- har_slide_file(3, 19, "a")
f_b <- har_slide_file(3, 19, "b")
f_c <- har_slide_file(3, 19, "c")

har_ggsave_px(f_a, p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)
har_ggsave_px(f_b, p2, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)
har_ggsave_px(f_c, p3, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# Empilhar em duas etapas
f_tmp <- har_slide_file(3, 19, "tmp")
har_concat_png(f_tmp, c(f_a, f_b))
f_out <- har_slide_file(3, 19)
har_concat_png(f_out, c(f_tmp, f_c))
