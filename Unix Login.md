![[Pasted image 20220404005223.png]]

## Login (azul)
Se hace el checkeo de contraseña y usuario normal y corriente
## Login (azul) -> Login (amarillo)
El proceso se cambia el [[setuid]] y setgid al que ha buscado en passwd y group
## Login (amarillo) -> Shell
El proceso exec el shell que le da passwd y cambia el ejecutable del proceso y ejecuta su .bashrc.