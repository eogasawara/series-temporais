# Aula 05 — Slide 06
# ACF e PACF em Séries Sazonais
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

set.seed(5)

# Série sazonal simples (m=12) com ruído moderado
n <- 12 * 10
t <- 1:n
x <- 1.5*sin(2*pi*t/12) + rnorm(n, sd=0.6)
x_ts <- ts(x, frequency = 12)

out_png <- har_slide_file("05", "06")

# ACF/PACF em base R (duas janelas no mesmo PNG)
png(filename = out_png,
    width = TSED_WIDTH, height = 2*TSED_HEIGHT, res = TSED_DPI)

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
acf(x_ts, lag.max = 48, main = "ACF: picos em múltiplos de s=12")
abline(v = seq(12, 48, by=12), lty=3)
pacf(x_ts, lag.max = 48, main = "PACF: picos em múltiplos de s=12")
abline(v = seq(12, 48, by=12), lty=3)

dev.off()
message("PNG gerado em: ", out_png)

# --- (VSCode) Gerar versão .Rmd documentada (não apaga o .R) ---
rmd_file <- har_slide_file("05", "06", suffix=NULL)
rmd_file <- sub("\\.png$", ".Rmd", rmd_file)  # reaproveita base NN-XX
writeLines(strsplit("---\ntitle: \"Aula 05 — Slide 06\"\noutput: html_document\n---\n\n## Objetivo da figura\n\nMostrar picos na ACF/PACF em múltiplos do período sazonal (s), reforçando a leitura para identificar componentes sazonais AR/MA.\n\n## Como executar\n\n1. Abra este arquivo no VS Code.\n2. Instale os pacotes necessários (se ainda não tiver): `forecast`, `ggplot2`.\n3. Execute os chunks (Ctrl+Enter) ou use **Knit**.\n\n## Referência ao PDF\n\nEste código gera as figuras do **Slide 06** do PDF `05-Por-que-Estender-os-Modelos-Lineares.pdf`.\n\n```{r setup, message=FALSE, warning=FALSE}\nsource(\"https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R\")\n```\n\n```{r fig, message=FALSE, warning=FALSE}\nset.seed(5)\n\n# Série sazonal simples (m=12) com ruído moderado\nn <- 12 * 10\nt <- 1:n\nx <- 1.5*sin(2*pi*t/12) + rnorm(n, sd=0.6)\nx_ts <- ts(x, frequency = 12)\n\nout_png <- har_slide_file(\"05\", \"06\")\n\n# ACF/PACF em base R (duas janelas no mesmo PNG)\npng(filename = out_png,\n    width = TSED_WIDTH, height = TSED_HEIGHT, res = TSED_DPI)\n\npar(mfrow = c(2, 1), mar = c(4, 4, 2, 1))\nacf(x_ts, lag.max = 48, main = \"ACF: picos em múltiplos de s=12\")\nabline(v = seq(12, 48, by=12), lty=3)\npacf(x_ts, lag.max = 48, main = \"PACF: picos em múltiplos de s=12\")\nabline(v = seq(12, 48, by=12), lty=3)\n\ndev.off()\nmessage(\"PNG gerado em: \", out_png)\n```\n", "\\n")[[1]], con = rmd_file)
message("Rmd gerado em: ", rmd_file)
