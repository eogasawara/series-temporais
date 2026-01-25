# ============================================================
# Aula 01 — Slide 08
# Variância do Processo Temporal
# Saída final: slides/01-08.png (concatenação vertical)
# ============================================================

source("slides/utils.R")

set.seed(8)

T <- 200
t <- 1:T

# --- Série 1: variância constante (homocedástica) ---
x_homo <- rnorm(T, mean = 0, sd = 1)
x_homo_ts <- ts(x_homo, start = 1, frequency = 1)

p1 <- forecast::autoplot(x_homo_ts) +
  ggplot2::labs(
    title = "homocedasticidade",
    x = "t",
    y = expression(X[t])
  )

# --- Série 2: variância variável (heterocedástica) ---
# Exemplo simples: desvio-padrão cresce ao longo do tempo (σ_t aumenta com t)
sigma_t <- 0.4 + 1.6 * (t - 1) / (T - 1)  # vai de 0.4 até 2.0
x_hetero <- rnorm(T, mean = 0, sd = sigma_t)
x_hetero_ts <- ts(x_hetero, start = 1, frequency = 1)

p2 <- forecast::autoplot(x_hetero_ts) +
  ggplot2::labs(
    title = "heterocedasticidade",
    x = "t",
    y = expression(X[t])
  )

# Salva subfiguras (metade da altura cada)
har_ggsave_px(
  file = har_slide_file(1, 8, "a"),
  plot = p1,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT 
)

har_ggsave_px(
  file = har_slide_file(1, 8, "b"),
  plot = p2,
  width_px  = TSED_WIDTH,
  height_px = TSED_HEIGHT 
)

# Concatena verticalmente no arquivo final do slide
har_concat_png(
  out_file = har_slide_file(1, 8),
  files = c(
    har_slide_file(1, 8, "a"),
    har_slide_file(1, 8, "b")
  )
)
