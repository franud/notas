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
   chmod -R {{xxx}} {{file}}

	