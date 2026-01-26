source("slides/utils.R")

set.seed(3)
n <- 500

# 1) AR(2)
x_ar <- ts(stats::arima.sim(model = list(ar = c(0.6, -0.25)), n = n))
# 2) MA(2)
x_ma <- ts(stats::arima.sim(model = list(ma = c(0.6, -0.3)), n = n))
# 3) ARMA(1,1)
x_arma <- ts(stats::arima.sim(model = list(ar = 0.6, ma = 0.5), n = n))

save_acf_pacf_panel <- function(x, title, file) {
  grDevices::png(filename = file, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
  oldpar <- graphics::par(no.readonly = TRUE)
  on.exit({graphics::par(oldpar); grDevices::dev.off()}, add = TRUE)

  graphics::par(mfrow = c(1, 1), mar = c(4, 4, 3, 1))
  stats::acf(x, main = paste0("ACF — ", title))
  #stats::pacf(x, main = paste0("PACF — ", title))
}

f_a <- har_slide_file(3, 15, "a")
f_b <- har_slide_file(3, 15, "b")
f_c <- har_slide_file(3, 15, "c")

save_acf_pacf_panel(x_ar,   "AR(2): PACF corta; ACF decai",   f_a)
save_acf_pacf_panel(x_ma,   "MA(2): ACF corta; PACF decai",   f_b)
save_acf_pacf_panel(x_arma, "ARMA(1,1): nenhum corta",        f_c)

# Empilhar (a, b, c) em um único PNG — concatenação em duas etapas
f_tmp <- har_slide_file(3, 15, "tmp")
har_concat_png(f_tmp, c(f_a, f_b))
f_out <- har_slide_file(3, 15)
har_concat_png(f_out, c(f_tmp, f_c))
