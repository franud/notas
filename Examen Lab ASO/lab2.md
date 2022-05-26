1. Editar los apt config files `/etc/apt/sources.list`
`deb http://ftp.es.debian.org/debian/ stable main non-free contrib`
2. Hacer un `sudo apt update`
	- Para hacer upgrade de todos los packages -> `sudo apt upgrade`
3. Instalar el X WIndow Display Manager con `sudo apt install x-window-system`
4. Instalar el window manager y desktop enviroment.
	- `apt search task-xfce-desktop`
	- `sudo apt install task-xfce-desktop` 
5. `apt {clean, autoclean, autoremove}`
	- -   `apt/apt-get clean` → cleans the packages and install script in `/var/cache/apt/archives/`
	-   `apt/apt-get autoclean` → cleans obsolete deb-packages, less than `clean`
	-   `apt/apt-get autoremove` → removes orphaned packages which are not longer needed from the system, but not purges them, use the `--purge` option together with the command for that.
6. Java install -> Extraer en `/opt/javaVERSION` y luego crear softlinks con `ln -s /opt/javaVERSION/bin/java /usr/local/bin/[nombre del softlink]`
7. Para instalar el `asosh` 
	1. Descomprimir el tar en `/usr/src`
	2. Ir a la carpeta descomprimida
		1. `./configure --prefix=PATHINSTALACION` <- Crea el Makefile
		2. `make` <- Compilar
		3. `sudo make install` <- Instala en el path que hemos dado de prefix
		4. `sudo make uninstall` <- Para desinstalar
		5. `make distclean` <- Limpiar archivos .o y tal
