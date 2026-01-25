# ============================================================
# Aula 01 — Slide 12
# Autocorrelação Amostral: Série + ACF (empilhadas)
# Saída final: slides/01-12.png
# ============================================================

source("slides/utils.R")

set.seed(12)

T <- 200
t <- 1:T
phi <- 0.6
x <- as.numeric(arima.sim(model = list(ar = phi), n = T))

# (a) Série no estilo forecast
p_series <- forecast::autoplot(ts(x)) +
  ggplot2::labs(
    title = bquote("Série simulada (AR(1), " ~ phi == .(phi) ~ ")"),
    x = "t", y = expression(X[t])
  )

har_ggsave_px(
  file = har_slide_file(1, 12, "a"),
  plot = p_series,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT 
)

# (b) ACF em base R
file_acf <- har_slide_file(1, 12, "b")
png(file_acf, width = TSED_WIDTH, height = TSED_HEIGHT, res = 150)
acf(x, lag.max = 40,
    main = "ACF amostral (com bandas de confiança)",
    xlab = "defasagem (h)", ylab = "autocorrelação")
grid()
dev.off()

# concatena (a)+(b)
har_concat_png(
  out_file = har_slide_file(1, 12),
  files = c(har_slide_file(1, 12, "a"),
            har_slide_file(1, 12, "b"))
)
