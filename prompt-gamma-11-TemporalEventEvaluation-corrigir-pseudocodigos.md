# Prompt Gamma - corrigir pseudocodigo em 11-TemporalEventEvaluation.pdf

Atualize apenas o slide 24. Mantenha a mesma estrutura visual.

## Slide 24 - SoftED mapping

Problema: o pseudocodigo atual descreve uma associacao gulosa da deteccao para o evento mais proximo. A implementacao usada no Harbinger (`har_eval_soft`) calcula pertinencias, agrupa eventos cujas janelas de tolerancia se sobrepoem e usa associacao otima por HungarianSolver em casos complexos. O slide deve refletir isso para nao ensinar um algoritmo diferente.

Substitua o pseudocodigo por:

```text
ENTRADA: eventos E[1..m], deteccoes D[1..p], tolerancia k
PRE-CONDICAO: k > 0; E e D sao listas de instantes
PASSO 1 - Para cada evento e_j:
          criar janela [e_j - k, e_j + k]
PASSO 2 - Unir janelas de eventos que se sobrepoem,
          formando grupos temporais independentes
PASSO 3 - Para cada grupo:
          D_g <- deteccoes dentro da janela unida
          E_g <- eventos dentro da janela unida
PASSO 4 - Calcular matriz de pertinencia:
          Mu[i,j] = max(0, min((d_i-(e_j-k))/k,
                               ((e_j+k)-d_i)/k))
PASSO 5 - Associar deteccoes e eventos:
          se |D_g|=1 ou |E_g|=1, manter maior pertinencia
          se |D_g|>1 e |E_g|>1, resolver associacao otima
          maximizando soma de Mu com HungarianSolver
PASSO 6 - Somar scores associados:
          TPs = soma das pertinencias associadas
          FPs = soma(1 - score) sobre deteccoes avaliadas
          FNs = |E| - TPs
SAIDA: TPs, FPs, FNs soft e mapeamento temporal
POS-CONDICAO: associacoes respeitam conflitos dentro de cada grupo temporal
```

Na teoria resumida, troque "evento mais proximo" por "associacao que maximiza a pertinencia temporal em grupos de janelas sobrepostas".
