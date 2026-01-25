# ============================================================
# Aula 01 — Slide 16
# Diferenciação para estacionarizar: antes vs depois
# Saída final: slides/01-16.png
# ============================================================

source("slides/utils.R")

set.seed(16)

T <- 250

# Série não estacionária (passeio aleatório)
x <- cumsum(rnorm(T))
dx <- diff(x)

p1 <- forecast::autoplot(ts(x)) +
  ggplot2::labs(
    title = "Antes: passeio aleatório (não estacionário)",
    x = "t", y = expression(X[t])
  )

p2 <- forecast::autoplot(ts(dx)) +
  ggplot2::labs(
    title = "Depois: série diferenciada ΔX_t = X_t − X_{t-1} (mais próxima de estacionária)",
    x = "t", y = expression(Delta*X[t])
  )

har_ggsave_px(har_slide_file(1, 16, "a"), p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT)
har_ggsave_px(har_slide_file(1, 16, "b"), p2, width_px = TSED_WIDTH, height_px = TSED_HEIGHT)

har_concat_png(
  out_file = har_slide_file(1, 16),
  files = c(har_slide_file(1, 16, "a"),
            har_slide_file(1, 16, "b"))
)
