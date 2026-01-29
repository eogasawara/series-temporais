source("slides/utils.R")

# Aula 08 — Slide 08: Pontos de Mudança
# Objetivo: ilustrar mudança estrutural (mudança de regime) como evento global persistente.

suppressPackageStartupMessages({
  library(forecast)
})

set.seed(8)

# Série sintética: dois regimes com médias distintas (mudança de nível)
n1 <- 120
n2 <- 120
x1 <- as.numeric(arima.sim(model=list(ar=0.6), n=n1)) + 0
x2 <- as.numeric(arima.sim(model=list(ar=0.6), n=n2)) + 4
x <- c(x1, x2)
x_ts <- ts(x)
cp <- n1 + 1  # ponto de mudança (conhecido na simulação)

# Baseline simples (para produzir resíduos/ajuste): AR(1) global
fit <- Arima(x_ts, order=c(1,0,0))

# Criar estrutura de detecção compatível com har_plot
detections <- data.frame(
  idx = seq_along(x_ts),
  event = FALSE,
  type = NA_character_
)
detections$event[cp] <- TRUE
detections$type[cp] <- "change_point"

# Usar har_save_plot para marcar o change point
har_save_plot(
  file     = har_slide_file(08, 08),
  obj      = fit,
  serie    = x_ts,
  idx      = detections$idx,
  detection= detections,
  event    = detections$event,
  mark.cp  = TRUE
)
