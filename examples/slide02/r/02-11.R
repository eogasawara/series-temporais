source("https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R")
set.seed(211)

n <- 144
t <- 1:n
s <- 12

# Serie original com tendencia e sazonalidade
x <- (100 + 0.2 * t) + 6 * sin(2 * pi * t / s) + rnorm(n, 0, 1.5)
x_ts <- ts(x, frequency = s)

p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Serie original: tendencia e sazonalidade")

fa <- har_slide_file("02", "11", "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT / 2)

# Transformacao: diferenca sazonal e diferenca regular
y <- diff(diff(x_ts, lag = s), lag = 1)
p_b <- forecast::autoplot(y) +
  ggplot2::labs(x = NULL, y = NULL, title = "Apos diferencas (sazonal e regular)")

fb <- har_slide_file("02", "11", "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT / 2)

# Composicao final do slide
out <- har_slide_file("02", "11")
har_concat_png(out, c(fa, fb))
