# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Aula 07 — Slide 08
# Resíduos Temporais: observação, previsão e resíduo (com evento no resíduo)
# Gera: slides/07-08.png

source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(7)

# Série com padrão AR(1) + evento (pulso) para aparecer nos resíduos
n <- 240
x <- as.numeric(arima.sim(model=list(ar=0.7), n=n, sd=0.6))
event_idx <- 150
x[event_idx] <- x[event_idx] + 3.0
x_ts <- ts(x)

# Modelo de "normalidade": ARIMA simples (Box-Jenkins / Cryer & Chan)
fit <- Arima(x_ts, order=c(1,0,0))
xhat <- fitted(fit)
res <- residuals(fit)

out_png <- har_slide_file("07", "08")

# Plot em 3 painéis: Observação / Previsão / Resíduo
png(filename = out_png, width = TSED_WIDTH, height = 3*TSED_HEIGHT, res = TSED_DPI)
par(mfrow=c(3,1), mar=c(3,4,2,1))

plot(x_ts, type="l", main="Observação X_t", ylab="X_t", xlab="")
abline(v=event_idx, lty=2)

plot(xhat, type="l", main="Previsão/Normalidade Ŷ_t (modelo AR(1))", ylab="Ŷ_t", xlab="")
abline(v=event_idx, lty=2)

plot(res, type="l", main="Resíduo R_t = X_t - Ŷ_t (evento = desvio)", ylab="R_t", xlab="t")
abline(v=event_idx, lty=2)
abline(h=0, lty=3)

dev.off()

message("PNG gerado em: ", out_png)
