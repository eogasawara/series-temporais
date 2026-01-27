# Aula 05 — Slide 03
# Sazonalidade como Estrutura Periódica
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Série simulada com tendência + sazonalidade + ruído (m=12)
n <- 10 * 12
t <- 1:n
trend <- 0.03 * t
season <- 1.2 * sin(2*pi*t/12) + 0.5 * cos(2*pi*t/12)
x <- trend + season + rnorm(n, sd=0.5)
x_ts <- ts(x, frequency = 12)

# Decomposição clássica via STL (tendência/sazonalidade/ruído)
fit <- stl(x_ts, s.window = "periodic")

# Figura: decomposição (estética forecast/Hyndman)
p <- autoplot(fit) + ggtitle("Decomposição STL")

out_png <- har_slide_file("05", "03")
har_ggsave_px(out_png, p)
message("PNG gerado em: ", out_png)

# --- (VSCode) Gerar versão .Rmd documentada (não apaga o .R) ---
rmd_file <- har_slide_file("05", "03", suffix=NULL)
rmd_file <- sub("\\.png$", ".Rmd", rmd_file)  # reaproveita base NN-XX
writeLines(strsplit("---\ntitle: \"Aula 05 — Slide 03\"\noutput: html_document\n---\n\n## Objetivo da figura\n\nVisualizar uma série sazonal e sua decomposição (tendência, sazonalidade e ruído), conectando com $X_t = T_t + S_t + \\varepsilon_t$.\n\n## Como executar\n\n1. Abra este arquivo no VS Code.\n2. Instale os pacotes necessários (se ainda não tiver): `forecast`, `ggplot2`.\n3. Execute os chunks (Ctrl+Enter) ou use **Knit**.\n\n## Referência ao PDF\n\nEste código gera as figuras do **Slide 03** do PDF `05-Por-que-Estender-os-Modelos-Lineares.pdf`.\n\n```{r setup, message=FALSE, warning=FALSE}\nsource(\"https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R\")\n```\n\n```{r fig, message=FALSE, warning=FALSE}\nif (!requireNamespace(\"forecast\", quietly = TRUE)) install.packages(\"forecast\")\nif (!requireNamespace(\"ggplot2\", quietly = TRUE)) install.packages(\"ggplot2\")\n\nlibrary(forecast)\nlibrary(ggplot2)\n\nset.seed(5)\n\n# Série simulada com tendência + sazonalidade + ruído (m=12)\nn <- 10 * 12\nt <- 1:n\ntrend <- 0.03 * t\nseason <- 1.2 * sin(2*pi*t/12) + 0.5 * cos(2*pi*t/12)\nx <- trend + season + rnorm(n, sd=0.5)\nx_ts <- ts(x, frequency = 12)\n\n# Decomposição clássica via STL (tendência/sazonalidade/ruído)\nfit <- stl(x_ts, s.window = \"periodic\")\n\n# Figura: decomposição (estética forecast/Hyndman)\np <- autoplot(fit) + ggtitle(\"Decomposição STL: tendência, sazonalidade e ruído\")\n\nout_png <- har_slide_file(\"05\", \"03\")\nhar_ggsave_px(out_png, p)\nmessage(\"PNG gerado em: \", out_png)\n```\n", "\\n")[[1]], con = rmd_file)
message("Rmd gerado em: ", rmd_file)
