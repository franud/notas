Solo puede ejecutarlos root
- useradd (adduser) / userdel
- usermod 
- passwd 
	- Usa [[setuid]]
	- Si lo usa root puede cambiar cualquer password de cualquier usuario
	- Si lo usa un usuario, cambia su contraseña
- newusers
	- para hacer migracion de users masivo
- vipw
	- vim para passwd
	- hace analisis sintactico

Para grupos es casi lo mismo pero cambia user por group
```
> tldr newgrp
  Cambia el grupo primario de pertenencia. -> Util para crear archivo con grupo x temporalmente durante una sesión.

  Cambia el grupo primario de pertenencia del usuario:

      newgrp nombre_grupo

  Restablece el grupo primario de pertenencia al grupo por defecto del usuario `/etc/passwd`:

      newgrp

```

