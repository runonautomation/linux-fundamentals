
#### Overview of linux processes
##### Definitions
A process is an instance of a program running in Linux.
An application can use single process (simple commands like ls), or multiple processes (e.g. web browsers).

##### Process types
###### Interactive processes and jobs control


| Execution            | Description  | 
|---                   |---|
| command, ./command   |  Applications, services, user apps and libs  | 
| command &            | Runs in foreground  | 
| jobs                 | System configuration files  |
| Ctrl+Z               | Suspend (stop, but not quit) |
| Ctrl+C               | Interrupt (terminate and quit) a process running in the foreground.   |
| bg (after Ctrl+Z)    | Reactivate a suspended program in the background.   |
| fg                   | Move to foreground    |
| /tmp                 | Storage for all variable files and temporary files created by users    |

```

```


###### Daemons
Daemons are server processes(services) that run continuously.
Most of the time, they are initialized at system startup and then wait in the background until their service is required.


##### Init process
The first thing the kernel does is to execute init program. Init is the root/parent of all processes executing on Linux. 
Based on the appropriate run-level, scripts are executed to start various processes to run the system and make it functional.
/sbin/init
/usr/lib/systemd/systemd

##### Execution of a program from shell:
- relative to current path:
./command
- if exists in $PATH, can be located:
ping

##### Essential process characteristics:
- Process Identifier (PID)
- Parent Process Identifier (PPID)
- User and group Identifiers (UID and GID)
```
[training@0715631312e8 bin]$ ll | grep ping
-rwxr-xr-x 1 root root   44896 Nov 20  2015 ping
BUT==> 
[training@0715631312e8 bin]$ ps aux | grep ping
training    51  0.3  0.0  10812   828 ?        S    10:53   0:00 ping 127.0.0.1

```
- Environment
- When terminated - Exit Code
```
When a process exits - it returns its exit status to the parent.
Exit statuses are used to control process execution flow.
Process exit code can be checked in shell with $?
```

#### Checking processes information
- top
```
Flags:
top -u
top -n 1
```

```
Commands:
Shift + O 
c # Command line
k # Kill
```

- ps
```
ps aux | grep NAME
```

- htop

###### Other useful:
- htop
- pstree

#### Checking process data in /proc
cat /proc/PID/environ
cat /proc/PID/maps
ls -lah /proc/963

#### Controlling processes state
- kill with TERM, INT, KILL, HUP
```
man signal / man 7 signal
```
- pkill
- killall
- renice


#### Scheduling processes
- at
```
at tomorrow <RETURN>
Ctrl+D
```
- crontab
http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
http://crontab.guru/
https://www.howtoforge.com/a-short-introduction-to-cron-jobs
```

```
