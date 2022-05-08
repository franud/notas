Protocolo de autentificación de Microsoft.
> The protocol requires a **client to be authenticated by providing a username and a corresponding password**

1.  The client sends a **username** to the host.
2.  The host responds with a **random number** (i.e. the challenge).
3.  The client then generates a **hashed password value** from this number and the user’s password, and then sends this back as a response.
4.  The host knows the user’s password and generates a hashed password value which it can then **compare to the client’s response**.
5.  If both **values match**, the authenticity of the client is confirmed, and network access is granted. If there is no match between the values, the client will be denied access.
![Diagrama de NTLM](https://www.ionos.com/digitalguide/fileadmin/DigitalGuide/Schaubilder/server-during-ntlm-authentication.png)

- Passwords are encrypted through **MD4**.



