[[Systemd units]]

Anteriormente en init, existia algo llamado run levels 

![](https://miro.medium.com/max/1400/1*L6XWZw57ePlbgnGrNra-XA.png)


>The original Linux init program was based on the Unix System V init program, and it became commonly called SysV. The SysV init program uses a series of shell scripts, divided into separate runlevels, to determine what programs run at what times. Each program uses a separate shell script to start and stop the program. Furthermore, the init daemon is responsible for starting and stopping daemons after system initialization.

>On boot systemd activates the target unit `default.target` whose job is to activate on-boot services and other on-boot units by pulling them in via dependencies. Usually, the unit name is just an alias (symlink) for either `graphical.target`  or `multi-user.target` 

Systemd lo sustituye con los units, que ya traen de por si un modelo de dependencias [[Systemd dependencies]], por lo tanto los run levels quedan obsoletos.

> A systemd unit defines a service or action on the system which consists of a name, a type, and a configuration file while a systemd target represents a different group of services that should be running on the system.

Para mantener una capa de compatibilidad, existen su sustituto enmascarado: los targets, que es el equivalente a los runlevels pero que no dejan de ser [[Systemd units]]

Para más info: [Este articulo](https://alibaba-cloud.medium.com/understanding-and-changing-runlevels-in-systemd-ccc30065c53d)

