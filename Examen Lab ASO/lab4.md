## Preguntas
> In which files are defined users, passwords, and group databases?

[[Users and groups]]

> How UID (user identifiers) can be mapped for new users?

Without repeating the ones that have been used already.

>Which commands can be used to change the owners and permissions of a file? And of all the files in a directory?

### FIles
#### Owners
 - Change the owner user of a file/directory:
   chown {{user}} {{path/to/file_or_directory}}

 - Change the owner user and group of a file/directory:
   chown {{user}}:{{group}} {{path/to/file_or_directory}}
#### Permisions
- Change the permissions of file/directory
	chmod {{xxx}} {{file}}
### Recursive directories
#### Owners
 - Recursively change the owner of a directory and its contents:
   chown -R {{user}} {{path/to/directory}}
#### Permisions
- Cambia de forma recursiva los permisos de todos los arc
   chmod -R {{xxx}} {{directory}}

## Change prompt
`export PS1="\u:/home/aso-\D{%d/%m/%Y}-\A $ "`

# Adding users manualy
## vipw
```
[NAME](https://manned.org/vipw#head1)
       vipw, vigr - edit the password or group file

[SYNOPSIS](https://manned.org/vipw#head2)
       **vipw** [options]

       **vigr** [options]

[DESCRIPTION](https://manned.org/vipw#head3)
       **vipw** edits the password file after setting the appropriate locks, and
       does any necessary processing after the password file is unlocked. If the
       password file is already locked for editing by another user, **vipw** will
       ask you to try again later. The default editor for **vipw** and **vigr** is
       [vi(1)](https://manned.org/vi.1). **vigr** edits the group file in the same manner as **vipw** does the
       passwd file.
```

nerea -> uid=1001, username=nerea, $HOME=/home/nerea, shell=/bin/bash, groups=nerea,aso
fran -> uid=1001, username=fran, $HOME=/home/fran, shell=/bin/zsh, groups=fran,aso

```
/etc/passwd

nerea:x:2016:2016:,,,:/home/nerea:/bin/false
fran:x:2000:2000:,,,:/home/fran:/bin/false

/etc/shadow

fran:*:19137:0:99999:7:::
nerea:*:19137:0:99999:7:::
```

## /etc/skel
-   skel is derived from the **skeleton because** it contains basic structure of home directory
-   The _/etc/skel_ directory contains files and directories that are automatically copied over to a new user’s when it is created from **useradd** command.
-   This will ensure that all the users gets same intial settings and environment.

## Hacer backup de files de un usuario
`find / -user "[username]" -type f 2>/dev/null -print0 | xargs -0 tar cfz backup_usuario.tar.gz --files-from=-`

## Cambiar shell de otro usario (siendo root)
`chsh -s [fullpath] username`

## Eliminar archivos de un usuario en particular

 `# find [path_to_search] -user [username] -exec rm -fr {} \;`


```bash
#!/bin/bash
# username in $1
# Backup path in $2

date=$(date -u +"%S%M%H%d%m%Y")

if [[ -d "$2" ]]; then
	destinationpath=$2backup_$1_$date.tar.gz
	echo "[*] Creating backup in $destinationpath"
	find / -user "$1" -type f 2>/dev/null -print0 | xargs -0 tar cfz $destinationpath --files-from=-
	echo "[*] Removing files from user $1"
	find [path_to_search] -user [username] -exec rm -fr {} \;
	echo "[*] Invaliding user $1"
	chsh -s /usr/local/bin/failed-login.sh username
fi

echo Fin!
```

## Sudoers
`visudo`
https://medium.com/kernel-space/linux-fundamentals-a-to-z-of-a-sudoers-file-a5da99a30e7f

## Disable root
https://www.tecmint.com/disable-root-login-in-linux/
