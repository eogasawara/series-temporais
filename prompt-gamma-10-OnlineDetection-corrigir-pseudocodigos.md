# Prompt Gamma - corrigir pseudocodigos em 10-OnlineDetection.pdf

Atualize apenas os slides indicados, mantendo o estilo visual.

## Slide 11 - Windowed memory

Problema: o pseudocodigo atual adiciona `x_t` ao buffer, treina/atualiza o modelo com a janela contendo `x_t` e so depois detecta `x_t`. Para deteccao online causal, a decisao sobre `x_t` deve ser tomada antes de incorporar `x_t` ao estado usado para detectar esse mesmo ponto.

Substitua por:

```text
ENTRADA: fluxo X = <x1, x2, ...>, tamanho de janela w
PRE-CONDICAO: w >= 1; buffer inicializado com historico disponivel
PASSO 1 - Ao receber x_t:
          W_{t-1} <- buffer
PASSO 2 - Treinar ou atualizar modelo M usando W_{t-1}
PASSO 3 - Detectar o ponto atual:
          delta_t <- M.detectar(x_t)
PASSO 4 - Atualizar memoria:
          buffer.append(x_t)
          se len(buffer) > w:
              buffer.remove_first()
PASSO 5 - Emitir delta_t
SAIDA: sequencia de decisoes delta_1, delta_2, ...
POS-CONDICAO: delta_t usa apenas informacao disponivel antes ou no instante t,
              sem treinar no proprio ponto antes da decisao
```

## Slide 17 - Passive learning para drift

Problema: `w_t <- lambda^(t - t0)` faz a observacao corrente entrar com peso decrescente conforme o tempo absoluto cresce. Em esquecimento exponencial, o peso depende da idade da observacao.

Substitua a parte do peso por:

```text
PASSO 2 - Atribuir pesos por idade:
          para cada observacao antiga x_i no historico:
             peso_i <- lambda^(t - i)
          a nova observacao x_t entra com peso 1
PASSO 3 - Atualizar modelo:
          M_{t+1} <- update(M_t, x_t, peso=1,
                            historico ponderado por peso_i)
```

Na teoria, escreva:

- `lambda` proximo de 1 preserva memoria longa.
- `lambda` menor acelera esquecimento.
- O peso decai com a idade da observacao, nao com o tempo absoluto da observacao corrente.
