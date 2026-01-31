# Didatico: roteiro em 3 passos
# 1) Carregar dependencias/rotinas auxiliares.
# 2) Preparar dados e parametros do exemplo.
# 3) Gerar a figura/resultado esperado.
# Aula 07 — Slide 15
# Motifs e Discords (eventos como padrões raros em subsequências)
# Gera: slides/07-15.png

source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")

set.seed(7)

n <- 400
t <- 1:n
x <- rnorm(n, sd=0.4)

# Motif recorrente
motif <- sin(2*pi*(1:30)/30)
starts_m <- c(60, 160, 260)
for (s in starts_m) x[s:(s+29)] <- x[s:(s+29)] + 1.2*motif

# Discord (padrão raro)
discord <- c(rep(0,10), seq(0,2,length.out=10), seq(2,-1,length.out=10))
start_d <- 330
x[start_d:(start_d+29)] <- x[start_d:(start_d+29)] + discord

out_png <- har_slide_file("07", "15")

png(filename = out_png, width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)
par(mar=c(4,4,2,1))
plot(t, x, type="l", xlab="t", ylab="X_t",
     main="Motifs (recorrentes) e Discord (raro) como eventos em subsequências")

# Destacar motifs (retângulos)
for (s in starts_m) {
  rect(s, par("usr")[3], s+29, par("usr")[4], border=NA, density=18, angle=45)
  abline(v=s, lty=3); abline(v=s+29, lty=3)
}
text(starts_m+15, max(x), labels="motif", cex=0.8, pos=3)

# Destacar discord
rect(start_d, par("usr")[3], start_d+29, par("usr")[4], border=NA, density=18, angle=135)
abline(v=start_d, lty=2); abline(v=start_d+29, lty=2)
text(start_d+15, min(x), labels="discord", cex=0.8, pos=1)

dev.off()

message("PNG gerado em: ", out_png)
