# Prompt Gamma - corrigir pseudocodigo em 04-LinearModelsAndForecasting.pdf

Atualize apenas o slide 6, mantendo estilo visual, titulo e objetivo didatico.

## Slide 6 - AR(1)

Problema a corrigir: o pseudocodigo atual usa a inovacao `epsilon_t` dentro do valor ajustado:

`xhat_t <- phi * x_{t-1} + epsilon_t`

Isso esta conceitualmente errado para previsao/valor ajustado, porque `epsilon_t` e o erro/residuo desconhecido no instante da previsao. A inovacao deve aparecer na definicao do modelo, nao na formula operacional da previsao.

Substitua o pseudocodigo por esta versao:

```text
ENTRADA: serie X = <x1, ..., xn>
PRE-CONDICAO: serie estacionaria ou centrada; n >= 2
PASSO 1 - Estimar a media mu da serie
PASSO 2 - Centralizar a serie: y_t <- x_t - mu
PASSO 3 - Estimar phi:
          phi <- sum_{t=2..n}(y_t * y_{t-1}) /
                 sum_{t=2..n}(y_{t-1}^2)
PASSO 4 - Para t = 2 ate n:
          yhat_t <- phi * y_{t-1}
          xhat_t <- mu + yhat_t
          epsilon_t <- x_t - xhat_t
PASSO 5 - Diagnosticar residuos epsilon_t
SAIDA: phi, valores ajustados xhat_t e residuos epsilon_t
POS-CONDICAO: residuos devem se comportar como ruido branco
```

Na coluna teorica, deixe claro:

- Modelo: `x_t - mu = phi (x_{t-1} - mu) + epsilon_t`.
- Previsao de um passo: `xhat_t = mu + phi (x_{t-1} - mu)`.
- `epsilon_t` e residuo observado depois que `x_t` e conhecido.
