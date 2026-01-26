source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(218)

n <- 220
t <- 1:n

# Serie base com tendencia leve
x <- 30 + 0.03 * t + rnorm(n, 0, 0.8)

# Ruptura na media (evento estrutural)
cp_idx <- 140
x[(cp_idx + 1):n] <- x[(cp_idx + 1):n] + 6

# Anomalia local
anom_idx <- 90
x[anom_idx] <- x[anom_idx] + 10

serie <- ts(x)

# Usa o estilo Harbinger para destacar eventos
obj <- harbinger::harbinger()
detection <- detect(obj, serie)
detection$event[c(90, 140)] <- TRUE
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
