- El control de acceso depende de el usuario que lo quiera ejecutar, o de su grupo.
- Los objetos del sistema (por ejemplo, archivos y [[Process]]), tienen un **propietario**.
- Tu eres propietario de lo que tu creas
- Hay un usuario especial: **root**, que es propietario de todos los objetos
- Este usuario se necesita para hacer algunas operaciones del sistema criticas.

![[UML Users UNIX.png]]
- /etc/
	- [passwd](#/etc/passwd) -> Lista de usuarios
	- [group](#/etc/group) -> Lista de grupos
	- [shadow](#/etc/shadow) -> Lista de contraseñas
	- [aliases](#/etc/aliases) -> Alias de correo 

## /etc/passwd

- username: String del nombre del usuario
- passwd: es una x normalmente, antes contenia las contraseñas
- uid: un identificador unico del usuario, es el definitivo y el que se guarda en los inodos y es usado por el kernel
- gid: grupo principal de este usuario
- real_name: datos tipo tlf etc
- homedir: su directorio home
- shell: path al ejecutable de su shell

### Usuarios
- Root (uid = 0):

	- Puede hacer todo y no se validaran privilegios
	- Rompe cosas
	- Tiene directorio /root/ como el root puede ser montado, si no tienes acceso a ese dev entonces no puedes arrancar como sistema.
- otros usuarios (uid > 1000 o 500 si slackware)
	- Tiene ese uid porque se reserva uid's para usuarios del sistema
- usuarios del sistema (para servicios)
	- No mola tener servicios (por ejemplo un servidor web) como root, porque eso haría que un hacker pudiese entrar mediante una vulnerabilidad acceso root directamente.
	- Además de eso podemos darle un bash nologin, eso hace que nadie puede entrar.
	- Es una forma de correr servicios como root de forma más segura
	- Tampoco tienen password


## /etc/group
***Se usa para agrupar privilegios.***
- grupname
- passwd: No tiene sentido **No usar!!**
- GID
- list de usernames: una lista de usuarios separado por comas sin espacios
	- Si no está en esta lista, puede ser que esté en su grupo principal dentro de [passwd](#/etc/passwd)
### Groups
- Tenemos la misma idea que con los usuarios.
- Puede ser super util para agrupar privilegios de cosas
	- Por ejemplo, permisos para que reproduzcan audio
	- O hagan particiones
	- o... lo que sea! 
	- **Va muy de la mano para facilitar la configuración de el sudoers**

## /etc/shadow
Solo puede acceder root
- username: usuario
- passwd: contraseña del usuario hasheada.
	- El principio del hash $ 1 $ -> indica el tipo de hash usado
	- Se usa salt
	- Los usuarios sin contraseña pero que no queremos que nadie entre tienen un * . Así invalida que alguien puede entrar

### Passwords
- `passwd
- `chage
	- Para politica de expiración





[[Commands on users and groups]]