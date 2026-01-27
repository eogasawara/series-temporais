# Aula 05 — Slide 04
# Diferenciação Sazonal
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Série sazonal + tendência (m=12)
n <- 8 * 12
t <- 1:n
trend <- 0.05 * t
season <- 2 * sin(2*pi*t/12)
x <- trend + season + rnorm(n, sd=0.7)
x_ts <- ts(x, frequency = 12)

# Diferença regular e diferença sazonal
dx <- diff(x_ts, lag = 1)
dsx <- diff(x_ts, lag = 12)

# Subfigura A: diferença regular (remove tendência)
pa <- autoplot(dx) + ggtitle("Dif. regular: ΔX_t = X_t - X_{t-1}") +
  ylab("ΔX_t")

# Subfigura B: diferença sazonal (remove padrão periódico)
pb <- autoplot(dsx) + ggtitle("Dif. sazonal: Δ_s X_t = X_t - X_{t-s} (s=12)") +
  ylab("Δ_s X_t")

out_a <- har_slide_file("05", "04", "a")
out_b <- har_slide_file("05", "04", "b")
out_main <- har_slide_file("05", "04")

# Cada uma com metade da altura, depois concatenação vertical
har_ggsave_px(out_a, pa, height_px = TSED_HEIGHT)
har_ggsave_px(out_b, pb, height_px = TSED_HEIGHT)

har_concat_png(out_main, c(out_a, out_b))

message("PNGs gerados em: ", out_a, " | ", out_b, " | ", out_main)

# --- (VSCode) Gerar versão .Rmd documentada (não apaga o .R) ---
rmd_file <- har_slide_file("05", "04", suffix=NULL)
rmd_file <- sub("\\.png$", ".Rmd", rmd_file)  # reaproveita base NN-XX
writeLines(strsplit("---\ntitle: \"Aula 05 — Slide 04\"\noutput: html_document\n---\n\n## Objetivo da figura\n\nComparar o efeito da diferença regular ($\\Delta X_t$) e da diferença sazonal ($\\Delta_s X_t$) em uma série com tendência e sazonalidade.\n\n## Como executar\n\n1. Abra este arquivo no VS Code.\n2. Instale os pacotes necessários (se ainda não tiver): `forecast`, `ggplot2`.\n3. Execute os chunks (Ctrl+Enter) ou use **Knit**.\n\n## Referência ao PDF\n\nEste código gera as figuras do **Slide 04** do PDF `05-Por-que-Estender-os-Modelos-Lineares.pdf`.\n\n```{r setup, message=FALSE, warning=FALSE}\nsource(\"https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R\")\n```\n\n```{r fig, message=FALSE, warning=FALSE}\nif (!requireNamespace(\"forecast\", quietly = TRUE)) install.packages(\"forecast\")\nif (!requireNamespace(\"ggplot2\", quietly = TRUE)) install.packages(\"ggplot2\")\n\nlibrary(forecast)\nlibrary(ggplot2)\n\nset.seed(5)\n\n# Série sazonal + tendência (m=12)\nn <- 8 * 12\nt <- 1:n\ntrend <- 0.05 * t\nseason <- 2 * sin(2*pi*t/12)\nx <- trend + season + rnorm(n, sd=0.7)\nx_ts <- ts(x, frequency = 12)\n\n# Diferença regular e diferença sazonal\ndx <- diff(x_ts, lag = 1)\ndsx <- diff(x_ts, lag = 12)\n\n# Subfigura A: diferença regular (remove tendência)\npa <- autoplot(dx) + ggtitle(\"Diferença regular: ΔX_t = X_t - X_{t-1}\") +\n  ylab(\"ΔX_t\")\n\n# Subfigura B: diferença sazonal (remove padrão periódico)\npb <- autoplot(dsx) + ggtitle(\"Diferença sazonal: Δ_s X_t = X_t - X_{t-s} (s=12)\") +\n  ylab(\"Δ_s X_t\")\n\nout_a <- har_slide_file(\"05\", \"04\", \"a\")\nout_b <- har_slide_file(\"05\", \"04\", \"b\")\nout_main <- har_slide_file(\"05\", \"04\")\n\n# Cada uma com metade da altura, depois concatenação vertical\nhar_ggsave_px(out_a, pa, height_px = TSED_HEIGHT/2)\nhar_ggsave_px(out_b, pb, height_px = TSED_HEIGHT/2)\n\nhar_concat_png(out_main, c(out_a, out_b))\n\nmessage(\"PNGs gerados em: \", out_a, \" | \", out_b, \" | \", out_main)\n```\n", "\\n")[[1]], con = rmd_file)
message("Rmd gerado em: ", rmd_file)
