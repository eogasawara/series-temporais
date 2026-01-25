# ============================================================
# Aula 01 — Slide 07
# Média do Processo Temporal
# Saída final: slides/01-07.png (concatenação vertical)
# ============================================================

source("slides/utils.R")

set.seed(7)

T <- 200
t <- 1:T

# --- Série 1: média constante ---
x_const <- rnorm(T, mean = 0, sd = 1)
x_const_ts <- ts(x_const, start = 1, frequency = 1)

p1 <- forecast::autoplot(x_const_ts) +
  ggplot2::labs(
    title = "Média constante",
    x = "t",
    y = expression(X[t])
  )

# --- Série 2: média variável (mudança de nível/regime) ---
mu <- ifelse(t <= T/2, -1.0, 1.5)
x_var <- rnorm(T, mean = mu, sd = 1)
x_var_ts <- ts(x_var, start = 1, frequency = 1)

p2 <- forecast::autoplot(x_var_ts) +
  ggplot2::geom_vline(xintercept = T/2, linetype = "dashed", alpha = 0.6) +
  ggplot2::labs(
    title = "Média variável",
    x = "t",
    y = expression(X[t])
  )

# Salva subfiguras (metade da altura cada)
har_ggsave_px(
  file = har_slide_file(1, 7, "a"),
  plot = p1,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT
)

har_ggsave_px(
  file = har_slide_file(1, 7, "b"),
  plot = p2,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT 
)

# Concatena verticalmente no arquivo final do slide
har_concat_png(
  out_file = har_slide_file(1, 7),
  files = c(
    har_slide_file(1, 7, "a"),
    har_slide_file(1, 7, "b")
  )
)
