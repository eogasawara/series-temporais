# Aula 05 — Slide 20
# Regimes e Eventos
# Este script gera a(s) figura(s) em PNG na pasta slides/ e também cria um .Rmd documentado.

source("slides/utils.R")

if (!requireNamespace("forecast", quietly = TRUE)) install.packages("forecast")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

library(forecast)
library(ggplot2)

set.seed(5)

# Série simulada com três regimes (mudança de média e variância) — eventos em cp1 e cp2
n <- 300
cp1 <- 110
cp2 <- 210

x1 <- arima.sim(model = list(ar = 0.5), n = cp1, sd = 0.6) + 0.0
x2 <- arima.sim(model = list(ar = 0.2), n = cp2-cp1, sd = 1.2) + 2.0  # "crise"
x3 <- arima.sim(model = list(ar = 0.6), n = n-cp2, sd = 0.7) + 0.5     # "recuperação"

x <- c(x1, x2, x3)
x_ts <- ts(x)

out_png <- har_slide_file("05", "20")

# Preferência: Harbinger (quando disponível via utils/instalação do aluno).
# Como não assumimos a presença de uma detecção específica, marcamos os pontos de mudança que simulamos.
idx <- c(cp1, cp2)

ok <- FALSE
try({
  har_save_plot(
    file = out_png,
    obj = NULL,
    serie = x_ts,
    idx = idx,
    detection = "manual",
    event = "regime-change",
    mark.cp = TRUE
  )
  ok <- TRUE
}, silent = TRUE)

# Fallback (sempre funciona): ggplot com marcação de eventos
if (!ok) {
  df <- data.frame(t = 1:length(x_ts), x = as.numeric(x_ts))
  p <- autoplot(x_ts) +
    ggtitle("Regimes e eventos: transições entre dinâmicas") +
    geom_vline(xintercept = idx, linetype = 2) +
    annotate("text", x = idx, y = max(df$x), label = c("evento 1", "evento 2"),
             vjust = -0.5, hjust = 0, size = 3)
  har_ggsave_px(out_png, p)
}

message("PNG gerado em: ", out_png)

# --- (VSCode) Gerar versão .Rmd documentada (não apaga o .R) ---
rmd_file <- har_slide_file("05", "20", suffix=NULL)
rmd_file <- sub("\\.png$", ".Rmd", rmd_file)  # reaproveita base NN-XX
writeLines(strsplit("---\ntitle: \"Aula 05 — Slide 20\"\noutput: html_document\n---\n\n## Objetivo da figura\n\nVisualizar uma série com dois pontos de mudança (mudança de regime) e marcar esses eventos, conectando evento = transição entre dinâmicas.\n\n## Como executar\n\n1. Abra este arquivo no VS Code.\n2. Instale os pacotes necessários (se ainda não tiver): `forecast`, `ggplot2`.\n3. Execute os chunks (Ctrl+Enter) ou use **Knit**.\n\n## Referência ao PDF\n\nEste código gera as figuras do **Slide 20** do PDF `05-Por-que-Estender-os-Modelos-Lineares.pdf`.\n\n```{r setup, message=FALSE, warning=FALSE}\nsource(\"https://raw.githubusercontent.com/eogasawara/series-temporais/main/code/utils.R\")\n```\n\n```{r fig, message=FALSE, warning=FALSE}\nif (!requireNamespace(\"forecast\", quietly = TRUE)) install.packages(\"forecast\")\nif (!requireNamespace(\"ggplot2\", quietly = TRUE)) install.packages(\"ggplot2\")\n\nlibrary(forecast)\nlibrary(ggplot2)\n\nset.seed(5)\n\n# Série simulada com três regimes (mudança de média e variância) — eventos em cp1 e cp2\nn <- 300\ncp1 <- 110\ncp2 <- 210\n\nx1 <- arima.sim(model = list(ar = 0.5), n = cp1, sd = 0.6) + 0.0\nx2 <- arima.sim(model = list(ar = 0.2), n = cp2-cp1, sd = 1.2) + 2.0  # \"crise\"\nx3 <- arima.sim(model = list(ar = 0.6), n = n-cp2, sd = 0.7) + 0.5     # \"recuperação\"\n\nx <- c(x1, x2, x3)\nx_ts <- ts(x)\n\nout_png <- har_slide_file(\"05\", \"20\")\n\n# Preferência: Harbinger (quando disponível via utils/instalação do aluno).\n# Como não assumimos a presença de uma detecção específica, marcamos os pontos de mudança que simulamos.\nidx <- c(cp1, cp2)\n\nok <- FALSE\ntry({\n  har_save_plot(\n    file = out_png,\n    obj = NULL,\n    serie = x_ts,\n    idx = idx,\n    detection = \"manual\",\n    event = \"regime-change\",\n    mark.cp = TRUE\n  )\n  ok <- TRUE\n}, silent = TRUE)\n\n# Fallback (sempre funciona): ggplot com marcação de eventos\nif (!ok) {\n  df <- data.frame(t = 1:length(x_ts), x = as.numeric(x_ts))\n  p <- autoplot(x_ts) +\n    ggtitle(\"Regimes e eventos: transições entre dinâmicas\") +\n    geom_vline(xintercept = idx, linetype = 2) +\n    annotate(\"text\", x = idx, y = max(df$x), label = c(\"evento 1\", \"evento 2\"),\n             vjust = -0.5, hjust = 0, size = 3)\n  har_ggsave_px(out_png, p)\n}\n\nmessage(\"PNG gerado em: \", out_png)\n```\n", "\\n")[[1]], con = rmd_file)
message("Rmd gerado em: ", rmd_file)
