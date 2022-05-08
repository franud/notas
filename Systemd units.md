Unidad := una entidad manejada por systemd
Su **comportamiento / configuración** esta definido por un unit file.
Systemd mantiene una mirada telescópica / focaultiana de estos unit files.
Algo así como un **polimorfismo** donde

						-----------------
						|     Unit      |
						-----------------
										^
										|
			-----------------------------
			|              |    ......  |
	--------       --------      --------
	|Service|      |Target | ....| Timer |


# Unit types
1.  Service units, which start and control daemons and the processes they consist of. For details, see [systemd.service(5)](https://www.freedesktop.org/software/systemd/man/systemd.service.html#).
2.  Socket units, which encapsulate local IPC or network sockets in the system, useful for socket-based activation. For details about socket units, see [systemd.socket(5)](https://www.freedesktop.org/software/systemd/man/systemd.socket.html#), for details on socket-based activation and other forms of activation, see [daemon(7)](https://www.freedesktop.org/software/systemd/man/daemon.html#).
3.  Target units are useful to group units, or provide well-known synchronization points during boot-up, see [systemd.target(5)](https://www.freedesktop.org/software/systemd/man/systemd.target.html#).
4.  Device units expose kernel devices in systemd and may be used to implement device-based activation. For details, see [systemd.device(5)](https://www.freedesktop.org/software/systemd/man/systemd.device.html#).
5.  Mount units control mount points in the file system, for details see [systemd.mount(5)](https://www.freedesktop.org/software/systemd/man/systemd.mount.html#).
6.  Automount units provide automount capabilities, for on-demand mounting of file systems as well as parallelized boot-up. See [systemd.automount(5)](https://www.freedesktop.org/software/systemd/man/systemd.automount.html#).
7.  Timer units are useful for triggering activation of other units based on timers. You may find details in [systemd.timer(5)](https://www.freedesktop.org/software/systemd/man/systemd.timer.html#).
8.  Swap units are very similar to mount units and encapsulate memory swap partitions or files of the operating system. They are described in [systemd.swap(5)](https://www.freedesktop.org/software/systemd/man/systemd.swap.html#).
9.  Path units may be used to activate other services when file system objects change or are modified. See [systemd.path(5)](https://www.freedesktop.org/software/systemd/man/systemd.path.html#).
10.  Slice units may be used to group units which manage system processes (such as service and scope units) in a hierarchical tree for resource management purposes. See [systemd.slice(5)](https://www.freedesktop.org/software/systemd/man/systemd.slice.html#).
11.  Scope units are similar to service units, but manage foreign processes instead of starting them as well. See [systemd.scope(5)](https://www.freedesktop.org/software/systemd/man/systemd.scope.html#).

# Unit States
 - "active" (meaning started, bound, plugged in, …, depending on the unit type, see below), or 
 - "inactive" (meaning stopped, unbound, unplugged, …), as well as in the process of being 
 - activated or 
 - deactivated, 
	 - i.e. between the two states (these states are called "activating", "deactivating"). 
 - special "failed" state is available as well, which is very similar to "inactive" and is entered when the service failed in some way (process returned error code on exit, or crashed, an operation timed out, or after too many restarts).