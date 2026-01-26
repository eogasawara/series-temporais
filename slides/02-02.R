# === SLIDES QUE EXIGEM FIGURA ===
#   Slide 02 — a decomposição multiplicativa pede exemplo visual com variância crescente e uso de log (ver Slide “Decomposição Multiplicativa”).
# Slide 04 — modelos de tendência ficam claros comparando tendência linear vs tendência estocástica em séries simuladas.
# Slide 05 — sazonalidade exige uma série com padrão periódico evidente.
# Slide 08 — ruído (εt) precisa de ilustração de “média ~ 0” e “variância constante” em uma série sem estrutura.
# Slide 09 — a interação T+S+C+ε fica mais didática com uma série composta e seus componentes (ou ao menos a série resultante).
# Slide 10 — comparação determinística vs estocástica pede duas séries contrastantes (f(t)+ε vs passeio aleatório).
# Slide 11 — não-estacionariedade por tendência/sazonalidade pede exemplo “original” vs “transformada”.
# Slide 12 — remoção da tendência pede figura “antes/depois” (subtração e/ou diferenciação).
# Slide 13 — remoção da sazonalidade pede “antes/depois” (dessazonalização).
# Slide 14 — autocorrelação/autocovariância pede ACF e PACF (base R).
# Slide 15 — curta vs longa duração pede comparação de ACF com decaimento rápido vs muito lento (ilustrativo).
# Slide 16 — AR(1) pede série AR e sua ACF (para conectar fórmula à dependência).
# Slide 17 — MA(1) pede série MA e sua ACF (para conectar “choques passados” ao padrão da ACF).
# Slide 18 — “estrutura temporal e eventos” pede série com ruptura/anomalia marcada (preferir estilo Harbinger).
# Slide 19 — síntese pede figura-resumo (uma série composta “estrutura + aleatoriedade”, reforçando a ideia final).

# === FIGURA PARA O SLIDE 02 ===
#   Tipo: decomposição multiplicativa + transformação log
# Descrição conceitual: Mostre uma série com sazonalidade e tendência onde a variância cresce com o nível (efeito multiplicativo). Em seguida, mostre a mesma série após log, evidenciando estabilização da variância e motivando a conversão multiplicativa→aditiva.
# 
# Arquivo(s) gerado(s):
#   - slides/02-02a.png
# - slides/02-02b.png
# - slides/02-02.png
# 
# Código (R) — salvar como slides/02-02.R:
#   ```r
source("slides/utils.R")

# --- Série multiplicativa: nível cresce e variância cresce junto ---
set.seed(202)
n  <- 120
t  <- 1:n
s  <- 12

trend  <- 50 + 0.4 * t
season <- 1 + 0.25 * sin(2*pi*t/s)
noise  <- exp(rnorm(n, mean = 0, sd = 0.10)) # ruído multiplicativo

x <- trend * season * noise
x_ts <- ts(x, frequency = s)

# a) Série original (variância crescente)
p_a <- forecast::autoplot(x_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Série com estrutura multiplicativa")

fa <- har_slide_file("02", 2, "a")
har_ggsave_px(fa, p_a, height_px = TSED_HEIGHT/2)

# b) Log transforma em aproximadamente aditiva e estabiliza variância
xlog_ts <- ts(log(x), frequency = s)
p_b <- forecast::autoplot(xlog_ts) +
  ggplot2::labs(x = NULL, y = NULL, title = "Após log: variância mais estável")

fb <- har_slide_file(2, 2, "b")
har_ggsave_px(fb, p_b, height_px = TSED_HEIGHT/2)

# concat final
out <- har_slide_file(2, 2)
har_concat_png(out, c(fa, fb))
