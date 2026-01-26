source("slides/utils.R")

set.seed(218)
n <- 220
t <- 1:n

# Série com estrutura simples + ruptura + anomalia
x <- 30 + 0.03*t + rnorm(n, 0, 0.8)

cp_idx <- 140
x[(cp_idx+1):n] <- x[(cp_idx+1):n] + 6  # ruptura na média (evento estrutural)

anom_idx <- 90
x[anom_idx] <- x[anom_idx] + 10        # anomalia local

serie <- ts(x)

# Tentamos usar o "idx" para marcar pontos relevantes no plot Harbinger.
# (Mesmo sem objeto de detecção, isso já entrega a estética consistente do material.)

detection <- detect(harbinger(), serie)
detection$event[c(90,140)] <- TRUE
detection$type[90] <- "anomaly"
detection$type[140] <- "changepoint"
out <- har_slide_file("02", "18")
har_save_plot(
  file = out,
  obj = NULL,
  serie = serie,
  idx = t,
  detection = detection,
  event = NULL,
  mark.cp = TRUE
)
