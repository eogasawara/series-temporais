# Prompt Gamma - corrigir pseudocodigos em 08-ChangePointDetection.pdf

Atualize apenas os slides indicados. Mantenha o estilo visual e a intencao didatica.

## Slide 12 - AMOC

Problema: o slide usa `lambda` como limiar e tambem como estatistica calculada. Isso cria ambiguidade. Use `Lambda` para a estatistica e `gamma` para o limiar.

Troque o pseudocodigo por:

```text
ENTRADA: serie X_1:n, limiar gamma
PRE-CONDICAO: n >= 2; espera-se no maximo uma mudanca dominante
PASSO 1 - Para cada candidato k de 2 ate n-1:
          calcular L_k = logLik(X_1:k) + logLik(X_{k+1}:n)
PASSO 2 - Calcular L_0 = logLik(X_1:n) sem segmentacao
PASSO 3 - Calcular estatistica:
          Lambda = 2 * (max_k L_k - L_0)
PASSO 4 - Se Lambda > gamma:
          k* = argmax_k L_k
          retornar k* como change point
          caso contrario: retornar "sem mudanca"
SAIDA: posicao k* ou ausencia de mudanca
POS-CONDICAO: AMOC detecta no maximo 1 change point
```

## Slide 16 - PELT

Problema: a poda esta escrita de forma forte demais. Ajuste para deixar claro que a poda depende da condicao teorica de PELT.

Substitua a parte de poda por:

```text
PASSO 3 - Podar candidatos:
          R_novo = {}
          Para cada s em R:
             Se s ainda satisfaz a desigualdade de poda
             para tempos futuros:
                manter s em R_novo
          R <- R_novo unido {t}
```

Na explicacao teorica, inclua:

- PELT preserva otimalidade quando a funcao de custo satisfaz a condicao de poda.
- A regra de poda elimina candidatos que nao podem melhorar solucoes futuras sob essa condicao.
- Evite a frase "nunca sera otimo" baseada apenas na comparacao local simplificada `F(s)+C(s+1:t)+beta > F(t)`.

## Slide 21 - Change Finder

Ajuste menor de notacao: nao reutilize `r_t` para escore bruto e suavizado. Use:

- `a_t` para escore da segunda fase.
- `abar_t` para escore suavizado da segunda fase.

Mantenha a estrutura de duas fases.
