Los usuarios pueden actuar fuera de sus permisos previstos.

- Permisos mal configurados
- El atacante puede explotar estos defectos para acceder a información no autorizada

1. Violacion del least privilege principle/deny by default
2. Eludir comprobaciones de control de acceso
	>The Web Parameter Tampering attack is based on the manipulation of parameters exchanged between client and server in order to modify application data, such as user credentials and permissions, price and quantity of products, etc. Usually, this information is stored in cookies, hidden form fields, or URL Query Strings, and is used to increase application functionality and control.

3. Permitir ver/editar la cuenta de otra persona
> Por ejemplo una web donde la url para editar la info de tu cuenta es así:
> http://example.org/user/1/edit
> Y que tu puedas cambiar el id 1 por otro y poder seguir editando la info de la cuenta.

4. Acceso a través de una API donde faltan controles de acceso
> Por ejemplo en la API de twitter poder ver los MD de alguien sin ser esa cuenta.

5. Elevación de privilegios
> Actuar como usuario sin iniciar sesión
> Actuar como administrador siendo usuario

6. Configuración incorrecta de CORS
> Permite acceso a API desde origen no autorizado.