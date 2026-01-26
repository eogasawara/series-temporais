source("slides/utils.R")

set.seed(209)
n <- 180
t <- 1:n
s <- 12

Tt <- 50 + 0.15*t
St <- 4*sin(2*pi*t/s)
Ct <- 3*sin(2*pi*t/60) # ciclo lento (sem periodicidade sazonal curta)
eps <- rnorm(n, 0, 1.2)

x <- Tt + St + Ct + eps
x_ts <- ts(x, frequency = s)

p <- forecast::autoplot(x_ts) +
  ggplot2::labs(x=NULL, y=NULL, title="tendência + sazonalidade + ciclo + ruído")

out <- har_slide_file("02", "09")
har_ggsave_px(out, p)
