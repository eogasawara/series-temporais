# ============================================================
# Aula 01 — Slide 20
# AR(1): série + assinatura na ACF (decaimento)
# Saída final: slides/01-20.png
# ============================================================

source("slides/utils.R")

set.seed(20)

T <- 250
phi <- 0.8
x <- as.numeric(arima.sim(model = list(ar = phi), n = T))

# (a) Série no estilo forecast
p_series <- forecast::autoplot(ts(x)) +
  ggplot2::labs(
    title = bquote("Série AR(1)"),
    x = "t",
    y = expression(X[t])
  )

har_ggsave_px(
  file = har_slide_file(1, 20, "a"),
  plot = p_series,
  width_px = TSED_WIDTH,
  height_px = TSED_HEIGHT 
)

# (b) ACF em base R (assinatura do AR(1): decaimento aproximadamente geométrico)
file_acf <- har_slide_file(1, 20, "b")
png(file_acf, width = TSED_WIDTH, height = TSED_HEIGHT, res = 150)
acf(x, lag.max = 40,
    main = bquote("ACF amostral do AR(1)"),
    xlab = "defasagem (h)", ylab = "autocorrelação")
grid()
dev.off()

# concatena
har_concat_png(
  out_file = har_slide_file(1, 20),
  files = c(har_slide_file(1, 20, "a"),
            har_slide_file(1, 20, "b"))
)
