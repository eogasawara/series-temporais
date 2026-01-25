# ============================================================
# Aula 01 — Slide 04
# Dependência Temporal entre Observações
# Saída final: slides/01-04.png (concatenação vertical)
# ============================================================

source("slides/utils.R")

set.seed(3)

T <- 200
t <- 1:T

# --- Série 1: ruído branco (sem dependência temporal) ---
x_wn <- rnorm(T, mean = 0, sd = 1)
x_wn_ts <- ts(x_wn, start = 1, frequency = 1)

p1 <- forecast::autoplot(x_wn_ts) +
  ggplot2::labs(
    title = "Ruído branco",
    x = "t",
    y = expression(X[t])
  )

# --- Série 2: AR(1) (com dependência temporal) ---
phi <- 0.8
x_ar1 <- as.numeric(arima.sim(model = list(ar = phi), n = T))
x_ar1_ts <- ts(x_ar1, start = 1, frequency = 1)

p2 <- forecast::autoplot(x_ar1_ts) +
  ggplot2::labs(
    title = bquote("AR(1): " ~ phi == .(phi)),
    x = "t",
    y = expression(X[t])
  )

# Salva subfiguras (metade da altura cada)
har_ggsave_px(
  file = har_slide_file(1, 4, "a"),
  plot = p1,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_ggsave_px(
  file = har_slide_file(1, 4, "b"),
  plot = p2,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

# Concatena verticalmente no arquivo final do slide
har_concat_png(
  out_file = har_slide_file(1, 4),
  files = c(
    har_slide_file(1, 4, "a"),
    har_slide_file(1, 4, "b")
  )
)
