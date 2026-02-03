# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

set.seed(3)
n <- 250
mu <- 0

# Pesos psi_j (exemplo causal com decaimento geométrico)
J <- 40
phi <- 0.7
psi <- phi^(0:J)  # psi_0 = 1, psi_j decresce

# Choques e construção do processo linear causal: X_t = mu + sum_{j>=0} psi_j * eps_{t-j}
eps <- rnorm(n + J + 1)
x <- rep(NA_real_, n)

for (t in 1:n) {
  # alinhar eps para evitar índices negativos
  e_window <- eps[(t + J + 1):(t + 1)]
  x[t] <- mu + sum(psi * e_window)
}
x <- ts(x)

# a) pesos psi_j
df_psi <- data.frame(j = 0:J, psi = psi)
p1 <- ggplot2::ggplot(df_psi, ggplot2::aes(x = j, y = psi)) +
  ggplot2::geom_line() +
  ggplot2::geom_point(size = 1) +
  ggplot2::labs(
    title = "Pesos ψj com decaimento",
    x = "Defasagem j",
    y = "Peso ψj"
  )

f_a <- har_slide_file(3, 3, "a")
har_ggsave_px(f_a, p1, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# b) série resultante
p2 <- forecast::autoplot(x) +
  ggplot2::labs(title = "Processo linear causal", x = "Tempo", y = "Xt")

f_b <- har_slide_file(3, 3, "b")
har_ggsave_px(f_b, p2, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# concat final
f_out <- har_slide_file(3, 3)
har_concat_png(f_out, c(f_a, f_b))
