source("slides/utils.R")

# Aula 08 — Slide 07: Anomalias
# Objetivo: mostrar anomalias como desvios pontuais detectáveis no espaço residual com limiar estatístico.

suppressPackageStartupMessages({
  library(forecast)
})

set.seed(7)

# Série sintética: AR(1) estacionário com dois outliers aditivos (anomalias pontuais)
n <- 220
x <- as.numeric(arima.sim(model=list(ar=0.7), n=n))
ao_idx <- c(90, 160)
x[ao_idx] <- x[ao_idx] + c(8, -7)  # anomalias (additive outliers)
x_ts <- ts(x)

# Modelo de tipicidade (Cryer & Chan): AR(1) como baseline
fit <- Arima(x_ts, order=c(1,0,0))
res <- residuals(fit)

# Limiar simples (didático): 3 desvios-padrão dos resíduos
tau <- 3 * sd(res, na.rm=TRUE)
det_idx <- which(abs(res) > tau)

detections <- detect(harbinger(), res)
detections$event[det_idx] <- TRUE
detections$type[det_idx] <- "anomaly"


# Figura estilo Harbinger (eventos/anomalias)
# Observação: utilitário har_save_plot já define identidade visual do curso
har_save_plot(
  file     = har_slide_file(08, 07),
  obj      = fit,
  serie    = x_ts,
  idx      = detections$idx,
  detection = detections,
  event    = detections$event,
  mark.cp  = FALSE
)
