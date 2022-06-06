- Amplitude of movement is the signal  
- Human motor system is the communication channel  
- Target width is the noise

$MT := Movement Time$
$MT = a + bID$
$a,b$ tiempo de parar y empezar

$ID := IndiceDificultad$
$ID = log_2{\frac{2A}{W}}$
$A := AmplitudMovimiento$
$W := TargetWidth$

## Variantes
### Welford
$MT = a + blog_2{\frac{D + 0.5W}{W}}$
#### McKenzie
$MT = a + blog_2{(\frac{D}{W} + 1)}$

### Extensiones
![Diagrama D/W](https://i.imgur.com/g7VCbaA.png)

#### 2D
Los movimientos realmente no son en una sola dimensión, tenemos que adaptar la [[Fitts Law]] a movimientos en 2D.
![Diagrama Fitts Law en 2D](https://i.imgur.com/SD8M7MU.png)

#### Problemas de precisión
En dispositivos pequeños esta ley no funciona tan bien.
##### Finger Fitts
$FFits = a + bID + dID_{2}$
$FFits = a + b [log_2{\frac{cD}{W}}] + d[log_2{\frac{e}{W}}]$
![Explicación variables Finger Fitts](https://i.imgur.com/vJ36yyG.png)

### Aplicaciones
- Further distance -> Harder to select  
- Larger target -> Easier to select
Si queremos mejorar algo: Cambiar el width a más grande, cambiar su virtual distance.

![Explicación de esquinas en ley de fitts](https://i.imgur.com/5CU9DgG.png)

- Mantén las cosas cerca.
	- Los botoncitos de arriba/abajo están juntos, en cambio en windows están en extremos opuestos.
	- Tambien la barra es más grande
![](https://i.imgur.com/obmLHKV.png)

- Similares <=> cerca && Opuestos <=> lejos
![](https://i.imgur.com/r5URTMc.png)

- Pop-ups menus -> Reducen $D$
	- Solo lo usan expertos
- Pie menu -> Dificil de diseñar
#### Accelerating target
##### Expanding target
- Aumentar el tamaño de los targets si pasas por ellos.
	- Augmenta $W$
![](https://i.imgur.com/FsCboGK.png)
- Bubble targets
	- Regiones que pese a no haber llegado, ya puedes hacer algo.
![](https://i.imgur.com/5qbNnb4.png)

##### Moving targets
- Los popups menus
- Sticky targets
	- Atraes el puntero
	- Utiles en 3D
	- ![](https://i.imgur.com/Jcr0R7w.png)
##### Control display ratio
- Basicamente el DPI