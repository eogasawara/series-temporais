# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(4)

# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
T <- 120
t <- 1:T
n_paths <- 20
phi <- 0.6

# Simula varias trajetorias de um AR(1)
paths <- replicate(n_paths, as.numeric(arima.sim(model = list(ar = phi), n = T)))

# Realizacao observada (primeira trajetoria)
x_obs <- paths[, 1]
x_obs_ts <- ts(x_obs, start = 1, frequency = 1)

# Data frame com as demais trajetorias
df_other <- data.frame(
  time = rep(t, times = n_paths - 1),
  value = as.vector(paths[, 2:n_paths]),
  path = factor(rep(2:n_paths, each = T))
)

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
    title = "Processo estocastico e trajetoria",
    x = "t",
    y = expression(X[t])
  )

har_ggsave_px(
  file = har_slide_file(1, 6),
  plot = p
)
