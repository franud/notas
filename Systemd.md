[[Systemd units]]
- Solo usado en **Linux**
- Gestiona hardware con daemon udev (mount new devices)
- Es el proceso padre de todo el sistema.
-  Paralelizable -> Mucho más rápido.
-  Sustituto de init
-  systemctl [[Systemctl commands]]]
-  Usa dependencias [[Systemd dependencies]]
-  Los gestores de paquetes suelen venir con sus propios unit files para que uno no tenga que hacerlo a mano.
- Controversial: Hace muchisimas cosas. 

## IPC implementation
La forma en la que maneja los sockets / network ports es la siguente.
1. Systemd escucha en los puertos a la espera de conexiones pero los proceosos quedan dormidos sin haberse iniciado
2. Una vez un cliente se materializa, systemd hace todo lo necesario para iniciar el servicio y le pasa el mensaje del cliente.

## Behaviour
- Systemd hace la assumption de que los Unit de distintos tipos tienen un comportamiento
	- Por ejemplo tipo **service** hace la assumption de que debe iniciarse en el boot.
		- Puede desactivarlo con ``DefaultDependencies=false
	- Más info en man systemd.type
