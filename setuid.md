Se usa para que usuarios no privilegiados puedan abrir ejecutables con los permisos elevados, normalmente los de root.

Cuando el kernel ejecuta un archivo que tiene los bits de setuid y setgid set, cambia su uid o gid **efectivo** (ver [[Process]]) por el UID/GID del ejecutable en vez de usar los del usuario que lo ejecuta.

Esto se usa por ejemplo en `passwd`
Los programas que usan el suid/sgid son prone to security problems.

Se puede deshabilitar suid en un filesystem entero con `mount` si lo usas com el flag `nosuid`.
  