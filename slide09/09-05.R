source("slides/utils.R")

# Aula 09 — Slide 05: Outliers clássicos vs anomalias temporais
# (a) Outlier clássico: z-score global no valor observado
# (b) Anomalia temporal: Harbinger (ARIMA) no espaço residual
# Referência no PDF: Slide 05 ("Outliers e Anomalias Temporais")

suppressPackageStartupMessages({
  library(ggplot2)
  library(harbinger)
})

set.seed(905)

n <- 240
x <- as.numeric(arima.sim(model=list(ar=0.6), n=n))
# Inserir 3 desvios pontuais (para visualização clara)
idx_out <- c(60, 140, 200)
x[idx_out] <- x[idx_out] + c(6, -7, 5)
serie <- ts(x)

t <- 1:n
df <- data.frame(t=t, x=x)

# --- (a) Outlier clássico (global) ---
mu <- mean(x)
s  <- sd(x)
k  <- 3
is_out <- abs(x - mu) > k*s

p_a <- ggplot(df, aes(x=t, y=x)) +
  geom_line() +
  geom_point(data=df[is_out, , drop=FALSE], aes(x=t, y=x), size=2) +
  geom_hline(yintercept = mu + k*s, linetype="dashed") +
  geom_hline(yintercept = mu - k*s, linetype="dashed") +
  labs(
    x="t", y="x_t",
    title="(a) Outlier clássico: |x_t - μ| > k·σ (global)"
  )

file_a <- har_slide_file(9, 5, "a")
har_ggsave_px(file_a, p_a, height_px = TSED_HEIGHT/2)

# --- (b) Anomalia temporal (residual) ---
model <- hanr_arima()
model <- fit(model, serie)
det <- detect(model, serie)

file_b <- har_slide_file(9, 5, "b")
har_save_plot(
  file      = file_b,
  obj       = model,
  serie     = serie,
  idx       = det$idx,
  detection = det,
  event     = det$event,
  mark.cp   = FALSE
)

# Concatenar (a) e (b) verticalmente
har_concat_png(har_slide_file(9, 5), c(file_a, file_b))
