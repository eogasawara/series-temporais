# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

# Aula 10 — Slide 05: Espaço de Decisão do Detector
# Objetivo: ilustrar score g(x_t), limiar τ e decisão binária δ(x_t)=I(g(x_t)>τ).
# Referência no PDF: Slide 05 ("Espaço de Decisão do Detector")

suppressPackageStartupMessages({
  library(forecast)
  library(ggplot2)
})

set.seed(1004)

# Série sintética: AR(1) + 2 anomalias pontuais (para produzir scores altos)
n <- 260
x <- as.numeric(arima.sim(model=list(ar=0.7), n=n))
idx_inj <- c(90, 200)
x[idx_inj] <- x[idx_inj] + c(7, -6)
serie <- ts(x)

# Modelo de tipicidade (Cryer & Chan): ARIMA simples como baseline
fit <- forecast::Arima(serie, order=c(1,0,0))
res <- as.numeric(residuals(fit))          # score base: |erro|
g   <- abs(res)

# Limiar τ (didático): quantil alto do score (controla sensibilidade)
tau <- as.numeric(stats::quantile(g, 0.995, na.rm=TRUE))
delta <- as.integer(g > tau)

df <- data.frame(
  t = seq_along(g),
  g = g,
  delta = delta
)

# (a) Score e limiar
p_a <- ggplot(df, aes(x=t, y=g)) +
  geom_line() +
  geom_hline(yintercept=tau, linetype="dashed") +
  geom_point(data=subset(df, delta==1), aes(x=t, y=g), size=2) +
  labs(
    x="t", y="g(x_t)=|r_t|",
    title="Score de anomalia e limiar τ (decisão δ=I(g>τ))"
  )

# (b) Decisão binária ao longo do tempo
p_b <- ggplot(df, aes(x=t, y=delta)) +
  geom_step() +
  scale_y_continuous(breaks=c(0,1)) +
  labs(
    x="t", y="δ(x_t)",
    title="Decisão binária: normal (0) vs anômalo (1)"
  )

file_a <- har_slide_file(10, 5, "a")
file_b <- har_slide_file(10, 5, "b")
file_out <- har_slide_file(10, 5)

har_ggsave_px(file_a, p_a, height_px = TSED_HEIGHT)
har_ggsave_px(file_b, p_b, height_px = TSED_HEIGHT)
har_concat_png(file_out, c(file_a, file_b))
