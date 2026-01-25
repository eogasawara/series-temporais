source("slides/utils.R")

set.seed(2)

T <- 150
t <- 1:T
x <- sin(2*pi*t/30) + 0.01*t + rnorm(T, sd = 0.5)

perm <- sample(T)
x_perm <- x[perm]


TSED_WIDTH <- 640
TSED_HEIGHT <- 480

obj <- harbinger::harbinger()

har_save_plot(
  file = "slides/01-03a.png",
  obj, x, idx = t, mark.cp = FALSE,
  width = TSED_WIDTH,
  height = TSED_HEIGHT
)

har_save_plot(
  file = "slides/01-03b.png",
  obj, x_perm, idx = t, mark.cp = FALSE,
  width = TSED_WIDTH,
  height = TSED_HEIGHT
)


har_concat_png("slides/01-03.png", c("slides/01-03a.png", "slides/01-03b.png"))

