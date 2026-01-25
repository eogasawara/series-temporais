library(ggplot2)
library(RColorBrewer)
library(daltoolbox)
library(harbinger)
library(forecast)

TSED_WIDTH <- 640
TSED_HEIGHT <- 480
TSED_DPI    <- 150

source("https://raw.githubusercontent.com/eogasawara/TSED/refs/heads/main/code/header.R")

# ============================================================
# Função utilitária para salvar figuras no padrão Harbinger
# ============================================================
har_save_plot <- function(file, obj, serie, idx = NULL,
                          detection = NULL, event = NULL,
                          mark.cp = TRUE, ylim = NULL, yline = NULL, width = 1200, height = 700) {
  
  # Cria diretório se não existir
  dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)
  
  # Gera o objeto gráfico do Harbinger
  grf <- harbinger::har_plot(
    obj = obj,
    serie = serie,
    detection = detection,
    event = event,
    idx = idx,
    mark.cp = mark.cp,
    ylim = ylim,
    yline = yline
  )
  
  # Salva em PNG
  png(filename = file, width = width, height = height, res = 150)
  plot(grf)
  dev.off()
  
  invisible(file)
}

# ============================================================
# Função: concatena imagens PNG verticalmente (Harbinger/TSED)
# ============================================================
har_concat_png <- function(out_file, files) {
  # dependência
  if (!requireNamespace("magick", quietly = TRUE)) {
    stop("Pacote 'magick' não está instalado. Execute: install.packages('magick')")
  }
  
  # validação básica
  if (length(files) < 2) {
    stop("É necessário informar pelo menos dois arquivos para concatenar.")
  }
  
  # lê imagens
  imgs <- magick::image_read(files)
  
  # empilha verticalmente
  img_final <- magick::image_append(imgs, stack = TRUE)
  

  # salva imagem final
  magick::image_write(img_final, path = out_file)
  
  invisible(out_file)
}


har_slide_file <- function(n_aula, n_slide, suffix = NULL) {
  
  aula  <- sprintf("%02d", n_aula)
  slide <- sprintf("%02d", n_slide)
  
  if (!is.null(suffix)) {
    file <- sprintf("slides/%s-%s%s.png", aula, slide, suffix)
  } else {
    file <- sprintf("slides/%s-%s.png", aula, slide)
  }
  
  return(file)
}

har_ggsave_px <- function(file, plot, width_px = TSED_WIDTH, height_px = TSED_HEIGHT, dpi = TSED_DPI) {
  dir.create(dirname(file), showWarnings = FALSE, recursive = TRUE)
  
  ggsave(
    filename = file,
    plot = plot,
    width  = width_px  / dpi,
    height = height_px / dpi,
    dpi = dpi
  )
}
