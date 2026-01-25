source("slides/utils.R")

set.seed(1)

T <- 120
t <- 1:T
x <- 0.03 * t + rnorm(T, sd = 0.8)

# Harbinger precisa de um "obj" (pode ser a base class harbinger())
obj <- harbinger::harbinger()

har_save_plot(
  file = "slides/01-01.png",
  obj  = obj,
  serie = x,
  idx  = t,
  mark.cp = FALSE,
  width = TSED_WIDTH,
  height = TSED_HEIGHT
)