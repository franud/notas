- Va por este orden de comprobación.
	1. Owner
	2. Group
	3. Other
- Cada uno tiene permisos rwx.

#### Al abrir un fichero
Primero comprueba el owner, si no es el owner comprueba group.

#### Quien puede cambiar los permisos?
SOLO ROOT Y OWNER PUEDEN CAMBIAR EL LOS PERMISOS.

#### Quien puede cambiar el owner?
SOLO ROOT PUEDE CAMBIAR EL OWNER

#### Quien puede cambiar el grupo?
SOLO ROOT Y EL OWNER PUEDEN CAMBIAR EL GRUPO Y EL GRUPO TIENE QUE SER UNO DE LOS QUE OWNER PERTENECE.

#### `umask`
- Los permisos por defecto vienen dados por umask.
- Duran una sesión de shell
- Los permisos están invertidos
Por ejemplo:
umask = 022

Quiere decir que los ficheros y directorios por defecto tendrian 755 al ser creados.

Unix hace algo por defecto, por seguridad **NUNCA** dará permisos de ejecución a un archivo acabado de crear, en cambio a los directorios si lo hará (Es necesario para acceder a ellos).


| Modo       | Fichero                                                                                                      | Directorio                                                          |
| ---------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| r          | Leer los contenidos Y EJECUTAR                                                                               | Lista contenidos                                                    |
| w          | Escribir/Modificar los contenidos (Para logs se puede usar un log write only que vaya appendeando las cosas) | Agregar, borrar o cambiar nombre de ficheros                        |
| x          | Ejecutar                                                                                                     | Acceder al directorio                                               |
| SetGID     | idem idem idem GID del propietario                                                                           | Los ficheros se crean con el mismo grupo propietario del directorio                                                                |
| SetUID     | Se ejecuta con UID del propietario (Hazte pasar por mi) En scripts no funciona SE NECESITA PERMISO DE EJECUCIÓN                                                    | Nada   |
| Sticky Bit | Nada                                                                                                         | Solo los propietarios de los ficheros pueden borrar esos ficheros |

![[Pasted image 20220407132935.png]]
### Que es un directorio
Es una tabla donde hay un nombre y un hardlink donde hay un inodo o otro directorio.
#### R
Leer un directorio significa que puedo leer/listar los contenidos del directorio.
#### X
Ejecutar un directorio significa entrar dentro (Hacer cd) y DA ACCESO A LOS INODOS (Permisos, owner, fecha, etc..).
#### W
- Cosas bizarras:
	- dir shared con ------rwx
	- dr shared/inside con ------r-x
	- Si hago un rm shared/inside -rf no podré porque no tengo privilegios para borrar los archivos de dentro de shared/inside (No tengo permisos de escritura, por mucho que tenga permisos de todo en shared) 
