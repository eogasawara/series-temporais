source("slides/utils.R")

set.seed(219)
n <- 180
t <- 1:n
s <- 12

# "Estrutura": tendência + sazonalidade + dependência (AR leve)
eps <- arima.sim(model = list(ar = 0.4), n = n)  # aleatoriedade com dependência leve (ruído estruturado)
Tt  <- 40 + 0.10*t
St  <- 3*sin(2*pi*t/s)
x   <- Tt + St + as.numeric(eps)

x_ts <- ts(x, frequency = s)

p <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="Síntese: X_t = estrutura + aleatoriedade")

out <- har_slide_file("02", "19")
har_ggsave_px(out, p)
