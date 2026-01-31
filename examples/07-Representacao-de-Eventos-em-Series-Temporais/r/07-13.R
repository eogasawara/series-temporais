# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Aula 07 — Slide 13
# Outliers temporais: Aditivo (AO), Inovacional (IO) e Mudança de Nível (LS)
# Gera: slides/07-13.png

source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

set.seed(7)

n <- 240
base <- as.numeric(arima.sim(model=list(ar=0.7), n=n, sd=0.5))

t0 <- 140

# AO: afeta só uma observação
x_ao <- base
x_ao[t0] <- x_ao[t0] + 3.0

# IO: choque no erro que se propaga (simulado via resposta AR(1))
phi <- 0.7
shock <- rep(0, n); shock[t0] <- 3.0
prop <- numeric(n)
for (tt in 2:n) prop[tt] <- phi*prop[tt-1] + shock[tt]
x_io <- base + prop

# LS: muda nível permanentemente após t0
x_ls <- base
x_ls[t0:n] <- x_ls[t0:n] + 1.5

out_png <- har_slide_file("07", "13")

png(filename = out_png, width = TSED_WIDTH, height = 3*TSED_HEIGHT, res = TSED_DPI)
par(mfrow=c(3,1), mar=c(3,4,2,1))

plot(ts(x_ao), type="l", main="Outlier Aditivo (AO): afeta um único ponto", ylab="X_t", xlab="")
abline(v=t0, lty=2)

plot(ts(x_io), type="l", main="Outlier Inovacional (IO): choque que se propaga", ylab="X_t", xlab="")
abline(v=t0, lty=2)

plot(ts(x_ls), type="l", main="Mudança de Nível (LS): alteração permanente após t0", ylab="X_t", xlab="t")
abline(v=t0, lty=2)

dev.off()

message("PNG gerado em: ", out_png)
