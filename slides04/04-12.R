source("slides/utils.R")

# Slide 04-12 — Métricas de erro: MSE, MAE, MAPE (comparação em um mesmo exemplo)
# (a) Série + divisão treino/teste (holdout temporal)
# (b) Barras com métricas por método (naive vs meanf vs ARIMA)

set.seed(2026)

suppressPackageStartupMessages({
  library(forecast)
  library(ggplot2)
})

n_aula  <- 4
n_slide <- 12

# Série simulada com sazonalidade + ruído (didática para MAPE fazer sentido)
n <- 120
freq <- 12
t <- 1:n
y <- 50 + 0.2*t + 8*sin(2*pi*t/freq) + rnorm(n, 0, 2)
y <- ts(y, frequency = freq)

h <- 24
train <- window(y, end = time(y)[length(y) - h])
test  <- window(y, start = time(y)[length(y) - h + 1])

# Modelos simples (clássicos)
fc_naive <- naive(train, h = h)
fc_mean  <- meanf(train,  h = h)
fc_arima <- forecast(auto.arima(train), h = h)

# Métricas (forecast::accuracy já calcula várias, incluindo MAE, RMSE, MAPE)
acc_naive <- accuracy(fc_naive, test)[2, c("MAE","RMSE","MAPE")]
acc_mean  <- accuracy(fc_mean,  test)[2, c("MAE","RMSE","MAPE")]
acc_arima <- accuracy(fc_arima, test)[2, c("MAE","RMSE","MAPE")]

dfm <- rbind(
  data.frame(model="Naive", metric=names(acc_naive), value=as.numeric(acc_naive)),
  data.frame(model="Mean",  metric=names(acc_mean),  value=as.numeric(acc_mean)),
  data.frame(model="ARIMA", metric=names(acc_arima), value=as.numeric(acc_arima))
)

fa <- har_slide_file(n_aula, n_slide, "a")
fb <- har_slide_file(n_aula, n_slide, "b")
fo <- har_slide_file(n_aula, n_slide)

# (a) Série + marcação treino/teste
dfa <- data.frame(
  t = as.numeric(time(y)),
  y = as.numeric(y),
  part = ifelse(as.numeric(time(y)) <= max(time(train)), "Treino", "Teste")
)

pa <- ggplot(dfa, aes(x = t, y = y)) +
  geom_line() +
  geom_vline(xintercept = max(time(train)), linetype = 2) +
  ggtitle("Holdout temporal: treino vs teste") +
  xlab("Tempo") + ylab("Y_t") +
  labs(caption = "Linha tracejada: ponto de corte.")

har_ggsave_px(fa, pa, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

# (b) Comparação de métricas por modelo
# Observação: RMSE é raiz do MSE, mas fica mais interpretável na mesma unidade.
pb <- ggplot(dfm, aes(x = model, y = value)) +
  geom_col() +
  facet_wrap(~metric, scales = "free_y", ncol = 3) +
  ggtitle("Comparação de erros (teste)") +
  xlab("Método") + ylab("Valor da métrica")

har_ggsave_px(fb, pb, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI)

har_concat_png(fo, c(fa, fb))
