1. Load BIOS/UEFI de ROM/firmware/NVRAM
	1. Inicializar hardware y probar que esté bien
2. Escoger dispositivo
3. Identificar partición EFI
4. Load BOOTLOADER ([[GRUB]])
	1. Determinar Kernel a usar
5. Cargar Kernel y sus estrcturas (initd) -> proceso lento por no tener todos los drivers.
	- En kernel mode
6. Cargar [[Systemd]] / init
	- En user mode
7. Cargar los servicios requeridos por el target default.
8. Se usa el sistema
	1. [[UNIX Login]]
9. [[Shutting down]]