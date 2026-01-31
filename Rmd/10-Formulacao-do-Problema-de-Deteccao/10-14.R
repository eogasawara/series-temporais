source("slides/utils.R")

# Aula 10 — Slide 14: Papel das Janelas Temporais
# Objetivo: mostrar que o tamanho da janela w altera a sensibilidade e o conjunto A(w) detectado.
# Referência no PDF: Slide 14 ("Papel das Janelas Temporais")

suppressPackageStartupMessages({
  library(forecast)
  library(ggplot2)
})

set.seed(1013)

# Série sintética: baseline + anomalias curtas (blips) + ruído
n <- 320
t <- 1:n
x <- as.numeric(arima.sim(model=list(ar=0.6), n=n)) + 0.02*t
# Duas anomalias curtas (3 pontos cada)
x[120:122] <- x[120:122] + 5
x[220:222] <- x[220:222] - 5
serie <- ts(x)

# Score simples baseado em resíduos de um AR(1) (baseline fixo)
fit <- forecast::Arima(serie, order=c(1,0,0))
res <- as.numeric(residuals(fit))
g <- abs(res)

# Detector por janela: threshold adaptativo = quantil da janela
detect_window <- function(g, w, q=0.99) {
  n <- length(g)
  tau <- rep(NA_real_, n)
  delta <- rep(0L, n)
  for (i in 1:n) {
    lo <- max(1, i-w+1)
    hi <- i
    tau[i] <- as.numeric(stats::quantile(g[lo:hi], q, na.rm=TRUE))
    delta[i] <- as.integer(g[i] > tau[i])
  }
  list(tau=tau, delta=delta)
}

# Janela pequena vs grande
w_small <- 20
w_large <- 120
d1 <- detect_window(g, w_small, 0.99)
d2 <- detect_window(g, w_large, 0.99)

df <- data.frame(t=t, g=g, dsmall=d1$delta, dlarge=d2$delta)

p_a <- ggplot(df, aes(x=t, y=g)) +
  geom_line() +
  geom_point(data=subset(df, dsmall==1), aes(x=t, y=g), size=1.8) +
  labs(
    x="t", y="g(x_t)",
    title=paste0("(a) Janela pequena (w=", w_small, "): reage rápido (mais sensível)")
  )

p_b <- ggplot(df, aes(x=t, y=g)) +
  geom_line() +
  geom_point(data=subset(df, dlarge==1), aes(x=t, y=g), size=1.8) +
  labs(
    x="t", y="g(x_t)",
    title=paste0("(b) Janela grande (w=", w_large, "): estabiliza (maior robustez / latência)")
  )

file_a <- har_slide_file(10, 14, "a")
file_b <- har_slide_file(10, 14, "b")
file_out <- har_slide_file(10, 14)

har_ggsave_px(file_a, p_a, height_px = TSED_HEIGHT)
har_ggsave_px(file_b, p_b, height_px = TSED_HEIGHT)
har_concat_png(file_out, c(file_a, file_b))


