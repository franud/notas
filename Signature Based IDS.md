Funcionan de forma similar a los antivirus, los IDS basados en firmas tienen acceso a una DDBB de ataques conocidos.
Ejemplo: Una peticion HTTP con esta cabecera: ```GET /etc/passwd/```
Si se detecta una petición que cumple un criterio de nuestro Signatura Based IDS, rechazamos la petición o se toma la acción que corresponda.

**Problemas**: No detecta ataques recien descubiertos o casos extremos.