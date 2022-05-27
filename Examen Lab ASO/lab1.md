> 	sftp aso@asoserver.pc.ac.upc.edu
> 	AsORoCkSHaRd!

# Hardware identification
- `lspci` -> Información de dispositivos PCI
- `lsusb` -> Dispositivos USB

# Instalación
1. Umount usb ya que ubuntu lo monta automaticamente, para ver los puntos de montaje actuales: `findmnt` o `mount`
   - `umount /dev/usb*`
   - UTIL -> `tldr mount`
2. Particionar el disco con gdisk para GPT (fdisk en caso de MBR).
   - El disco de EFI debe estar en `/boot/efi` y debe estar formateado en FAT32/vfat y debe tener al menos 512 MB
3. Crear los filesystems
   - Para swap -> mkswap [device]
   - Para los demás -> mkfs -t [fstype] [device]
4. Crear directorios para montar el sistema
   1. /linux
   2. Dentro de /linux creamos los otros
      1. /home
      2. /usr/local
      3. /efi/boot
5. Montamos las particiones del punto 2 en las carpetas que correspondan
   - `mount -t [type] [device] [dir]` 
6. Descargamos el prepackaged system de el ftp de aso.

7. Tenemos que hacer bind-mount de los directorios de abajo dentro de /linux.
    - 
```bash
for i in /dev /dev/pts /proc /sys /run;
do
    echo "Montando el directorio $i";
    mount -B $i /linux/$i;
done
```

8. Editar el `/etc/fstab` para el boot del sistema
	- https://linuxhint.com/write-edit-etc-fstab/
9.  Hacer `chroot /linux`
10. Cambiar cosas del teclado (`dpkg-reconfigure`)
11. Instalar grub con `grub-install --target=x86_64-efi [device (/dev/sda)]`
12. updatear el `/boot/grub/grub.cfg` con `update-grub`
13. Cambiar contraseñas por defecto de root y aso con `passwd`
14. `reboot`
15. Entrar a la BIOS y escojer bootear desde el HDD
16. Hacer checks cada 28 dias del `/` -> `tune2fs -i 28d`
17. Configurar el `/etc/network/interfaces`
```
auto ens33
iface ens33 inet dhcp
```
18. Reiniciar cambios de 17 -> `systemctl restart networking`
19. Cambiar mensaje de bienvenida en `/etc/issue`
20. Cambiar el mensaje de después del login en `/etc/motd`
21.  Instalar sudo y add aso a grupo sudo
22. [[Systemd]]