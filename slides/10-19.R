source("slides/utils.R")

# Aula 10 — Slide 19: Anomalias versus Pontos de Mudança
# Objetivo: comparar "desvio local" (anomalia) com "mudança persistente" (change point).
# Referência no PDF: Slide 19 ("Anomalias versus Pontos de Mudança")

suppressPackageStartupMessages({
  library(harbinger)
})

set.seed(1018)

# Série sintética: mudança de regime + uma anomalia pontual fora da transição
n1 <- 140
n2 <- 140
x <- c(
  as.numeric(arima.sim(model=list(ar=0.6), n=n1)) + 0,
  as.numeric(arima.sim(model=list(ar=0.6), n=n2)) + 4
)
cp_true <- n1 + 1

# Inserir uma anomalia pontual longe do change point
x[70] <- x[70] + 7
x[230] <- x[230] - 6
serie <- ts(x)

# (a) Detector de anomalias (modelo ARIMA residual)
mod_a <- hanr_arima()
mod_a <- fit(mod_a, serie)
det_a <- detect(mod_a, serie)

file_a <- har_slide_file(10, 19, "a")
har_save_plot(
  file      = file_a,
  obj       = mod_a,
  serie     = serie,
  idx       = det_a$idx,
  detection = det_a,
  event     = det_a$event,
  mark.cp   = FALSE
)

# (b) Detector de change point (binseg)
mod_b <- hcp_binseg(Q = 1)
mod_b <- fit(mod_b, serie)
det_b <- detect(mod_b, serie)

file_b <- har_slide_file(10, 19, "b")
har_save_plot(
  file      = file_b,
  obj       = mod_b,
  serie     = serie,
  idx       = det_b$idx,
  detection = det_b,
  event     = det_b$event,
  mark.cp   = TRUE
)

har_concat_png(har_slide_file(10, 19), c(file_a, file_b))


