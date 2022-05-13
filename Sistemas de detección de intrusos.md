IDS -> Intrusion detection system
- Interpreta logs de routers, firewalls, servidores, etc.
- Mantiene una DDBB de ataques conocidos y compara patrones de actividad.
- Un IDS puede tomar acciones automáticas
	- Enviar notificaciones
	- Bloquear conexiones
	- Identificar atacantes
- Busca firmas de virus por ejemplo.

## IDS vs Firewall
El firewall no puede hacer DPI (Deep Packet Inspection)
### DPI
Examina datos y cabeceras de un paquete, busca incumplimientos de protocolos, virus, spam, etc.

## Tipos de IDS por funcionalidad
[[Signature Based IDS]]
[[Anomaly Based IDS]]

# Tipos de IDS por arquitectura
Los IDS tienen unas funcionalidades concretas:
- Recopilación de informacion sobre hosts.
- Registro: Puede servir para válidar un intento de ataque e investigar accidentes.
- Detección: Combinación entre [[Signature Based IDS]] y [[Anomaly Based IDS]].
- Prevención: Una vez se detecta una alerta se pueden bloquear las que sean similares.
Hay los siguientes tipos:
- [[Network IDS]]
- [[Host IDS]]
- [[Distribuited IDS]]
