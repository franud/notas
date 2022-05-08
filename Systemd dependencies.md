- Se declara en la sección [Unit] del unit file.
``systemctl add-wants multi-user.target my.local.service

Uno podria pensar que si A requiere B, entonces B será iniciado antes de A, pero eso no es así, en systemd **el orden importa**

# Dependencias concurrentes
Con dependencias concurrentes me refiero a que pueden pasar al mismo tiempo

| Option | Meaning |
| ------ | ------- |
| Wants | Units que deben ser coactivadas si es posible pero no es requerido.|
| Requires | Dependencia estricta, si falla algun prerequisito, el servicio para |
| Requisite | Como require pero debe ser ya estar activo|
| Conflicts | Dependencias negativas, no pueden estar ambos a la vez |

# Dependencias sincronas
Dependencias sincronas se refieren a que uno debe estar despues de otro.
 | Option | Meaning |
| ------ | ------- |
| After | Trivial|
| Before | Idem |

***OJO***
Si en [Unit] B tenemos un After=A, significa que:
	1. Primero se ejecuta A
	2. Luego B
