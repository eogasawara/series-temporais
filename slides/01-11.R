# ============================================================
# Aula 01 — Slide 11
# Função de Autocorrelação (ACF) — ilustração
# Saída: slides/01-11.png
# ============================================================

source("slides/utils.R")

set.seed(11)
TSED_HEIGHT <- 640
T <- 300
phi <- 0.7
x <- as.numeric(arima.sim(model = list(ar = phi), n = T))

file <- har_slide_file(1, 11)
dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)

png(file, width = TSED_WIDTH, height = TSED_HEIGHT, res = 150)
acf(x, lag.max = 40,
    main = sprintf("ACF", phi),
    xlab = "defasagem (h)", ylab = "autocorrelação")
grid()
dev.off()
