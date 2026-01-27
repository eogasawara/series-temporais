# Aula 05 — Slide 08
# Exemplo de SARIMA
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Simular um processo com componente AR regular e sazonal (m=12)
# (didático) Geramos AR(1) + sazonalidade determinística e depois ajustamos SARIMA
n <- 12 * 8
t <- 1:n
ar_part <- arima.sim(model = list(ar = 0.6), n = n)
season <- 1.0 * sin(2*pi*t/12)
x <- as.numeric(ar_part) + season
x_ts <- ts(x, frequency = 12)

# Ajuste SARIMA didático: (1,1,1)(1,1,1)[12]
fit <- Arima(x_ts, order=c(1,1,1), seasonal=c(1,1,1))

fc <- forecast(fit, h=24)
p <- autoplot(fc) + ggtitle("SARIMA(1,1,1)(1,1,1)[12] — ajuste e previsão")

out_png <- har_slide_file("05", "08")
har_ggsave_px(out_png, p)
message("PNG gerado em: ", out_png)

# --- (VSCode) Gerar versão .Rmd documentada (não apaga o .R) ---
rmd_file <- har_slide_file("05", "08", suffix=NULL)
rmd_file <- sub("\\.png$", ".Rmd", rmd_file)  # reaproveita base NN-XX
writeLines(strsplit("---\ntitle: \"Aula 05 — Slide 08\"\noutput: html_document\n---\n\n## Objetivo da figura\n\nIlustrar uma série SARIMA simulada e um ajuste/forecast, conectando com a intuição de dependência regular + sazonal + diferenciações.\n\n## Como executar\n\n1. Abra este arquivo no VS Code.\n2. Instale os pacotes necessários (se ainda não tiver): `forecast`, `ggplot2`.\n3. Execute os chunks (Ctrl+Enter) ou use **Knit**.\n\n## Referência ao PDF\n\nEste código gera as figuras do **Slide 08** do PDF `05-Por-que-Estender-os-Modelos-Lineares.pdf`.\n\n```{r setup, message=FALSE, warning=FALSE}\nsource(\"https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R\")\n```\n\n```{r fig, message=FALSE, warning=FALSE}\nif (!requireNamespace(\"forecast\", quietly = TRUE)) install.packages(\"forecast\")\nif (!requireNamespace(\"ggplot2\", quietly = TRUE)) install.packages(\"ggplot2\")\n\nlibrary(forecast)\nlibrary(ggplot2)\n\nset.seed(5)\n\n# Simular um processo com componente AR regular e sazonal (m=12)\n# (didático) Geramos AR(1) + sazonalidade determinística e depois ajustamos SARIMA\nn <- 12 * 8\nt <- 1:n\nar_part <- arima.sim(model = list(ar = 0.6), n = n)\nseason <- 1.0 * sin(2*pi*t/12)\nx <- as.numeric(ar_part) + season\nx_ts <- ts(x, frequency = 12)\n\n# Ajuste SARIMA didático: (1,1,1)(1,1,1)[12]\nfit <- Arima(x_ts, order=c(1,1,1), seasonal=c(1,1,1))\n\nfc <- forecast(fit, h=24)\np <- autoplot(fc) + ggtitle(\"Exemplo SARIMA(1,1,1)(1,1,1)[12] — ajuste e previsão\")\n\nout_png <- har_slide_file(\"05\", \"08\")\nhar_ggsave_px(out_png, p)\nmessage(\"PNG gerado em: \", out_png)\n```\n", "\\n")[[1]], con = rmd_file)
message("Rmd gerado em: ", rmd_file)
