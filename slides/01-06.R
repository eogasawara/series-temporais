# ============================================================
# Aula 01 — Slide 05
# Figura: Processo estocástico (múltiplas trajetórias) e uma realização
# Saída: slides/01-05.png
# ============================================================

source("slides/utils.R")

TSED_WIDTH <- 640
TSED_HEIGHT <- 480

set.seed(4)

# parâmetros
T <- 120
t <- 1:T
n_paths <- 20
phi <- 0.6

# simula várias trajetórias de um AR(1)
paths <- replicate(n_paths, as.numeric(arima.sim(model = list(ar = phi), n = T)))

# realização observada (primeira trajetória)
x_obs <- paths[, 1]
x_obs_ts <- ts(x_obs, start = 1, frequency = 1)

# data frame das outras trajetórias
df_other <- data.frame(
  time  = rep(t, times = n_paths - 1),
  value = as.vector(paths[, 2:n_paths]),
  path  = factor(rep(2:n_paths, each = T))
)

# gráfico (forecast/ggplot)
p <- forecast::autoplot(x_obs_ts) +
  ggplot2::geom_line(
    data = df_other,
    ggplot2::aes(x = time, y = value, group = path),
    linewidth = 0.4,
    alpha = 0.35
  ) +
  ggplot2::geom_line(
    data = data.frame(time = t, value = x_obs),
    ggplot2::aes(x = time, y = value),
    linewidth = 1.2
  ) +
  ggplot2::labs(
    title = "Processo estocástico e trajetória",
    x = "t",
    y = expression(X[t])
  )

# salva no padrão do slide (pixels controláveis via TSED_WIDTH/TSED_HEIGHT em header.R)
har_ggsave_px(
  file = har_slide_file(1, 6),
  plot = p
)
