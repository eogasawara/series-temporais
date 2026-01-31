source("slides/utils.R")

# Aula 10 — Slide 09: Detecção Baseada em Distância (discords)
# Objetivo: ilustrar o score como distância ao vizinho mais próximo no espaço de subsequências.
# Referência no PDF: Slide 09 ("Detecção Baseada em Distância")

suppressPackageStartupMessages({
  library(ggplot2)
})

set.seed(1008)

# Série sintética com padrão recorrente (motif) e um padrão raro (discord)
n <- 360
t <- 1:n
x <- rnorm(n, sd=0.7)

# Motif repetido (duas ocorrências)
m <- 40
motif <- sin(2*pi*(1:m)/m) * 2
s1 <- 80
s2 <- 220
x[s1:(s1+m-1)] <- x[s1:(s1+m-1)] + motif
x[s2:(s2+m-1)] <- x[s2:(s2+m-1)] + motif

# Discord (janela rara)
discord <- c(seq(0, 4, length.out=m), seq(4, 0, length.out=m)) / 2 + rnorm(2*m, sd=0.2)
w <- 50
discord <- discord[1:w]
sd0 <- 150
x[sd0:(sd0+w-1)] <- x[sd0:(sd0+w-1)] + discord

# Construir subsequências (janelas) e calcular score: distância ao vizinho mais próximo
# Distância Euclidiana (didático)
S <- lapply(1:(n-w+1), function(i) x[i:(i+w-1)])
S <- do.call(rbind, S)

# Normalizar por janela para reduzir efeito de nível (didático)
S_sc <- t(apply(S, 1, function(v) (v - mean(v)) / (sd(v) + 1e-8)))

# Distância ao vizinho mais próximo (bruta O(N^2), mas N é pequeno aqui)
N <- nrow(S_sc)
nn_dist <- rep(NA_real_, N)
for (i in 1:N) {
  d <- sqrt(rowSums((S_sc - S_sc[i, ])^2))
  d[i] <- Inf
  nn_dist[i] <- min(d)
}

# Identificar discord estimado
i_star <- which.max(nn_dist)
idx_star <- i_star:(i_star+w-1)

df <- data.frame(t=t, x=x)
dfd <- data.frame(i=1:N, score=nn_dist)

p_a <- ggplot(df, aes(x=t, y=x)) +
  geom_line() +
  geom_rect(aes(xmin=min(idx_star), xmax=max(idx_star), ymin=-Inf, ymax=Inf), alpha=0.25) +
  labs(x="t", y="x_t", title="Série com uma janela rara (discord) destacada")

p_b <- ggplot(dfd, aes(x=i, y=score)) +
  geom_line() +
  geom_point(data=dfd[i_star, , drop=FALSE], aes(x=i, y=score), size=2) +
  labs(x="início da janela i", y="g(s_i)=min_u d(s_i,u)", title="Score por distância ao vizinho mais próximo")

file_a <- har_slide_file(10, 9, "a")
file_b <- har_slide_file(10, 9, "b")
file_out <- har_slide_file(10, 9)

har_ggsave_px(file_a, p_a, height_px = TSED_HEIGHT)
har_ggsave_px(file_b, p_b, height_px = TSED_HEIGHT)
har_concat_png(file_out, c(file_a, file_b))


