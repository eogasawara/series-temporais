# ============================================================
# Aula 01 — Slide 15
# Estacionário vs Não estacionário: Ruído branco vs Passeio Aleatório
# Saída final: slides/01-15.png
# ============================================================

source("slides/utils.R")

set.seed(15)

T <- 250
t <- 1:T

# Ruído branco (estacionário)
x_wn <- rnorm(T)
p1 <- forecast::autoplot(ts(x_wn)) +
  ggplot2::labs(
    title = "Ruído branco (estacionário)",
    x = "t", y = expression(X[t])
  )

# Passeio aleatório (não estacionário)
x_rw <- cumsum(rnorm(T))
p2 <- forecast::autoplot(ts(x_rw)) +
  ggplot2::labs(
    title = "Passeio aleatório (não estacionário)",
    x = "t", y = expression(X[t])
  )

har_ggsave_px(har_slide_file(1, 15, "a"), p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT)
har_ggsave_px(har_slide_file(1, 15, "b"), p2, width_px = TSED_WIDTH, height_px = TSED_HEIGHT)

har_concat_png(
  out_file = har_slide_file(1, 15),
  files = c(har_slide_file(1, 15, "a"),
            har_slide_file(1, 15, "b"))
)
