# Create backup partition
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
		- `/dev/sda8	/backups	ext3	ro,nouser,noexec	0	2
`
# Backups with tar
- Exclude con -X {{file_filled_with_paths_filenames_to_exclude}}
- Para hacer incremental hay que primero
	- `tar cfv nombre.tar /carpetabackup --newer=/archivo`

# Backups with rsync
Hay que permitir root login y activar el servicio sshd
`rsync -avz /home/cpt/backup_prueba/ -e ssh root@localhost:/backups/rsync-backup/`
- -a -> archive mode (Conservar atributos)
- -v verbose
- -z -> comprimir
- -e especifica la remote shell a usar

> Now, create a file in the /root directory, and try to do the same rsync command as before. Then,
delete the file and execute again the rsync command.
What happened to the deleted file?

Sigue en rsync-backup aunque lo haya eliminado

> What option of rsync allows to an exact synchronization the two directories?

rsync -avz --delete /home/cpt/backup_prueba/ -e ssh root@localhost:/backups/rsync-backup/

> How you can make a copy of all the files in the /root directory except those that have a .txt extension? 

`rsync -a --exclude '*.txt' src_directory/ dst_directory/`
https://linuxize.com/post/how-to-exclude-files-and-directories-with-rsync/

```bash
#!/bin/bash
SOURCE_DIR=/home/cpt/backup_prueba
DEST_DIR=/backups/rsync-backup
# Excludes file: list of files to exclude
EXCLUDES=
# the name of the backup machine
BSERVER=localhost
# put a date command for: year month day hour minute second
BACKUP_DATE=$(date -u +"%d%m%Y-%H%M")
# options for rsync
OPTS="--ignore-errors --delete-excluded --exclude-from=$EXCLUDES \
--delete --backup --backup-dir=$DEST_DIR/$BACKUP_DATE -av"
# now the actual transfer
echo "rsync $OPTS $SOURCE_DIR root@$BSERVER:$DEST_DIR/complet"
rsync $OPTS $SOURCE_DIR root@$BSERVER:$DEST_DIR/complet

```

