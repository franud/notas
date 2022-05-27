1. Crear /backup
2. Creamos nueva particion con el espacio sobrante y creamos un ext3 fs ahi con solo permisos de root de lectura y escritura
	1. `mkdir /backups`
	2. `fdisk /dev/sda`
	3. Creamos particion nueva ext3
	4. guardamos y salimos
	5. `mkfs -t ext3`
	6. `mount -t ext3 /dev/sda8 /backups`
	7. Mount in read-only mode -> `mount -o remount,ro /dev/usbX /backup`
	8. Mount in read-write mode -> `mount -o remount,rw /dev/usbX /backup`
	9. Editar `fstab` -> mirar enlace de [[lab1]] punto 8
