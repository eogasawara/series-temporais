source("slides/utils.R")

# Slide 04-03 — Dupla incerteza na previsão (processo + estimação)
# Ideia didática:
# (a) repetir previsões com parâmetros "conhecidos" (simulação) -> incerteza do processo
# (b) repetir ajustando parâmetros em cada amostra -> incerteza adicional por estimação

set.seed(2026)

suppressPackageStartupMessages({
  library(forecast)
  library(ggplot2)
})

n_aula  <- 4
n_slide <- 3

# Parâmetros verdadeiros (AR(1) estacionário)
phi_true <- 0.7
sig_true <- 1.0
n <- 120
h <- 10
R <- 300

# Simula uma única série observada (o "mundo real")
x_obs <- ts(arima.sim(model = list(ar = phi_true), n = n, sd = sig_true))

# (a) Incerteza do processo: gerar futuros com parâmetros verdadeiros, condicionando em X_n
# Aproximação: simular trajetórias futuras a partir do último estado via arima.sim com 'n.start'
# Vamos usar forecast::simulate do modelo ajustado com parâmetros fixos para manter didático.
fit_fixed <- Arima(x_obs, order = c(1,0,0), include.mean = FALSE, fixed = phi_true)
fit_fixed$sigma2 <- sig_true^2

paths_proc <- replicate(R, as.numeric(simulate(fit_fixed, nsim = h, future = TRUE)))
# (b) Incerteza total: reamostrar séries, reestimar e simular futuros
paths_total <- matrix(NA_real_, nrow = h, ncol = R)
for (r in 1:R) {
  xr <- ts(arima.sim(model = list(ar = phi_true), n = n, sd = sig_true))
  fit_r <- Arima(xr, order = c(1,0,0), include.mean = FALSE)
  paths_total[, r] <- as.numeric(simulate(fit_r, nsim = h, future = TRUE))
}

# Resumos
q <- c(0.1, 0.5, 0.9)
sum_proc  <- t(apply(paths_proc,  1, quantile, probs = q, na.rm = TRUE))
sum_total <- t(apply(paths_total, 1, quantile, probs = q, na.rm = TRUE))

df_proc <- data.frame(h = 1:h, lo = sum_proc[,1], med = sum_proc[,2], hi = sum_proc[,3], tipo="Processo (parâmetros fixos)")
df_tot  <- data.frame(h = 1:h, lo = sum_total[,1], med = sum_total[,2], hi = sum_total[,3], tipo="Processo + Estimação")
df <- rbind(df_proc, df_tot)

fa <- har_slide_file(n_aula, n_slide, "a")
fb <- har_slide_file(n_aula, n_slide, "b")
fo <- har_slide_file(n_aula, n_slide)

# (a) Faixa de previsão só do processo
pa <- ggplot(df_proc, aes(x = h)) +
  geom_ribbon(aes(ymin = lo, ymax = hi), alpha = 0.25) +
  geom_line(aes(y = med)) +
  ggtitle("Dupla incerteza: apenas variabilidade") +
  xlab("Horizonte (h)") + ylab("Distribuição condicional (quantis 10/50/90%)") +
  labs(caption = "Parâmetros fixos (conhecidos): incerteza vem do ruído futuro.")

har_ggsave_px(fa, pa, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# (b) Faixa de previsão com reestimação (mais larga)
pb <- ggplot(df_tot, aes(x = h)) +
  geom_ribbon(aes(ymin = lo, ymax = hi), alpha = 0.25) +
  geom_line(aes(y = med)) +
  ggtitle("Dupla incerteza: processo + estimação") +
  xlab("Horizonte (h)") + ylab("Distribuição (quantis 10/50/90%)") +
  labs(caption = "Reestimação adiciona variabilidade: intervalos tendem a ficar mais largos.")

har_ggsave_px(fb, pb, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

har_concat_png(fo, c(fa, fb))
