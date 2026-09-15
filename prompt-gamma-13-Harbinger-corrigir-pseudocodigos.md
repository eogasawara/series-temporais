# Prompt Gamma - corrigir pseudocodigos em 13-Harbinger.pdf

Atualize apenas os slides indicados. O objetivo e alinhar o tutorial ao comportamento real de `C:\Git\dal\harbinger` e `C:\Git\dal\tspredit`, sem fundir metodos.

## Slide 10 - Contrato comum do Harbinger

Problema: `harbinger()` base retorna um data frame padronizado, mas nao detecta evento. O exemplo atual mostra uma linha com `TRUE/anomaly`, o que sugere que a classe base detecta evento.

Corrija o exemplo para:

```text
model <- harbinger()
detection <- detect(model, dataset$serie)
head(detection)
# idx | event | type
#   1 | FALSE |
#   2 | FALSE |
#   3 | FALSE |
```

Acrescente uma frase: eventos aparecem quando usamos detectores concretos, como `hanr_arima()`, `hcp_amoc()` ou `hmo_sax()`.

## Slide 13 - Histograma

Problema: a pos-condicao diz que a proporcao de anomalias e aproximadamente `density_threshold`. Isso nao e verdade. O parametro e um limiar de densidade do bin.

Substitua a pos-condicao por:

```text
POS-CONDICAO: pontos em bins com densidade abaixo de density_threshold
              sao marcados como anomaly; a proporcao final de anomalias
              depende da distribuicao e dos bins
```

Mantenha a ideia de que e baseline interpretavel.

## Slide 16 - Avaliacao estrita e avaliacao suave

Problema: nao afirme `F1 hard <= F1 soft`. A avaliacao soft e mais permissiva temporalmente, mas a implementacao pode produzir resultados que dependem do padrao de deteccoes, eventos e associacoes.

Substitua a pos-condicao por:

```text
POS-CONDICAO: har_eval_soft atribui credito parcial a deteccoes proximas
              no tempo; os valores dependem da janela sw_size e das associacoes
              entre eventos e deteccoes
```

## Slide 18 - ARIMA

Problema: `hanr_arima()` nao usa simplesmente `threshold = k * sd(e_t)`. A implementacao seleciona ordem com `forecast::auto.arima`, reajusta com `forecast::Arima`, calcula residuos, transforma residuos por `har_distance`, aplica `har_outliers` e refina candidatos com `har_outliers_check`.

Substitua o pseudocodigo por:

```text
ENTRADA: serie temporal dataset$serie
PRE-CONDICAO: serie numerica sem NA apos tratamento interno
PASSO 1 - Ajustar modelo:
          model <- fit(hanr_arima(), dataset$serie)
          ordem (p,d,q) selecionada por auto.arima
PASSO 2 - Detectar:
          reajustar ARIMA com ordem armazenada
          calcular residuos e_t
PASSO 3 - Converter residuos em distancia:
          score_t <- har_distance(e_t)
PASSO 4 - Aplicar filtro de outliers:
          candidatos <- har_outliers(score_t)
          candidatos <- har_outliers_check(candidatos, score_t, serie)
PASSO 5 - Ignorar janela inicial sw_size
          e restaurar indices originais
SAIDA: detection com idx, event, type = "anomaly"
POS-CONDICAO: limiar e candidatos seguem os utilitarios internos do Harbinger,
              nao um k fixo universal
```

## Slide 22 - AMOC no Harbinger

Problema: `hcp_amoc()` usa `changepoint::cpt.meanvar(..., method="AMOC", penalty="MBIC", test.stat="Normal")` e pode retornar ausencia de ponto marcado. Nao prometa exatamente um change point.

Substitua o pseudocodigo por:

```text
ENTRADA: serie temporal dataset$serie
PRE-CONDICAO: serie numerica sem NA; espera-se no maximo uma mudanca dominante
PASSO 1 - Normalizar indices e remover NA internamente
PASSO 2 - Executar:
          cpt.meanvar(serie, method="AMOC",
                      penalty="MBIC", test.stat="Normal")
PASSO 3 - Extrair change point retornado pelo objeto cpt,
          excluindo o marcador final da serie quando existir
PASSO 4 - Marcar indices extraidos como event = TRUE,
          type = "changepoint"
SAIDA: detection com idx, event, type
POS-CONDICAO: detecta no maximo um change point relevante;
              pode nao marcar evento se o teste/penalizacao nao sustentar mudanca
```

## Slide 24 - Moving average smoother

Problema: `mas()` nao calcula media centrada e nao retorna vetor do mesmo comprimento. Ela usa janelas para frente `x[t:(t+order-1)]` e retorna tamanho `n-order+1`.

Substitua o pseudocodigo por:

```text
ENTRADA: serie temporal x de tamanho n; ordem k = order
PRE-CONDICAO: serie numerica; 1 <= k <= n
PASSO 1 - Para t de 1 ate n-k+1:
          xt[t] <- media(x[t], x[t+1], ..., x[t+k-1])
PASSO 2 - Converter xt para objeto ts
PASSO 3 - Guardar atributos:
          order = k
          xi = primeiros k-1 valores de x
          xf = ultimos k-1 valores de x
SAIDA: serie suavizada de tamanho n-k+1
POS-CONDICAO: a serie resultante fica mais curta;
              rotulos/eventos precisam ser realinhados ao usar mas()
```

## Slide 25 - SAX e XSAX no workflow

Problema: `trans_sax()` e `trans_xsax()` no Harbinger nao fazem PAA internamente e nao usam breakpoints fixos da normal. Eles normalizam a serie e fazem bins por quantis dos dados. XSAX usa alfabeto alfanumerico de ate 36 simbolos, nao `alpha^2`.

Substitua o pseudocodigo por:

```text
ENTRADA: serie temporal dataset$serie; alpha
PRE-CONDICAO: serie numerica; SAX: 2 <= alpha <= 26;
              XSAX: 2 <= alpha <= 36
PASSO 1 - Normalizar serie por z-score
PASSO 2 - Calcular quantis da propria serie normalizada
          para dividir os valores em alpha bins
PASSO 3 - Atribuir cada ponto ao seu bin
PASSO 4 - Mapear bins para codigos simbolicos:
          SAX usa A-Z
          XSAX usa 0-9A-Z
SAIDA: vetor simbolico com um simbolo por observacao
POS-CONDICAO: discretizacao preserva o comprimento da serie;
              janelas simbolicas sao criadas depois, por detectores como hmo_sax()
```

## Slide 27 - Detector simbolico de motifs

Problema: `hmo_sax()` recebe serie numerica, aplica `trans_sax()` internamente e detecta motifs. Ele nao recebe serie simbolica pre-computada e nao detecta discords. Discords devem ser apresentados com detector proprio, como `hdis_sax()`.

Substitua por:

```text
ENTRADA: serie numerica dataset$serie; alfabeto a; janela w; suporte qtd
PRE-CONDICAO: a entre 1 e 26; w >= 1; qtd >= 2
PASSO 1 - Aplicar trans_sax(a) internamente sobre dataset$serie
PASSO 2 - Criar janelas simbolicas com tspredit::ts_data(tss, w)
PASSO 3 - Concatenar simbolos de cada janela para formar sequencias
PASSO 4 - Agrupar sequencias iguais e manter grupos com total_count >= qtd
PASSO 5 - Remover motifs triviais proximos usando faixa em torno de w/2
PASSO 6 - Marcar primeiras ocorrencias validas como event = TRUE,
          type = "motif", com colunas seq e seqlen
SAIDA: detection com idx, event, type = "motif", seq, seqlen
POS-CONDICAO: hmo_sax detecta motifs recorrentes;
              discords exigem detector especifico
```
