> La medida de la cantidad de información se mide a través de la entropia, la cantidad de información a ser transmitida en un mensaje.

![Diagrama de transmisión de información](https://www.researchgate.net/profile/Fareed-Al-Hindawi/publication/313928362/figure/fig2/AS:493421879140353@1494652351277/Figure-no-2-Shannon-Weaver-Information-Theory-1949-This-diagram-refers-to-the.png)

### Ejemplo 1:
Tenemos 4 símbolos (A,B,C,D) -> La probabilidad de tener cada símbolo es 1/4.

La incerteza se mide con log2(M) -> log2(4) -> **2 bits**

### Ejemplo 2:
Si tenemos 1 símbolo -> Incerteza = log2(1) -> **0 bits**

### Ejemplo 3:
Si tenemos 2 dispositivos con estos posibles outputs.
d -> A,B,C
e -> 1,2
Combinamos ambos y tenemos 6 tipos de simbolos A1, A2, B1, B2, etc. -> Incerteza log2(6) -> log2(2) + log2(3) <=> log2(6)
inc(d)   +  inc(e)

> La incertez de dos dispositivos es igual a la suma de sus logaritmos

La afirmación anterior se da por la propiedad de los logaritmos:
$\log_2(a) + \log_2(b) = log_2({ab})$

Si tenemos M símbolos con la misma probabilidad => Cada símbolo tiene P=1/M

#### Reescribimos incerteza:
$\log_2{M} = log_2(\frac{1}{M}^{-1})=log_2(P^{-1})=-log_2(P)$
$-log_2{(P)}$<=> **Sorpresa**

### Entropia
La entropia es la cantidad de información que se recibe/transmite en el canal.

$H = \sum_{i=1}^N P_{i} \times log_2{(\frac{1}{P_{i}})} = - \sum_{i=1}^N P_{i} \times log_2{P_{i}}$
### Interferencia
No toda la información puede llegar.
$R = H(x) - H_{y}(x)$
$H_{y}(x)$ es la equivoación de x cuando se sabe y.
![](https://i.imgur.com/Qx9bU8r.png)



[[Hick-Hyman Law]]
[[Fitts Law]]
[[Law of Crossing]]
[[Steering Law]]

