#### System logs 
- System logs
```
Generic system:
/var/log/messages
/var/log/dmesg

Syslog

Authentication:
secure
auth*

Programs and daemons:
cron 
/var/log/program

Packages:
yum.log

History:
history

```

#### Local resources
##### Tools
- top
```
See processes section.
```
- iotop
- lsof
- systat package ( vmstat, iostat, sar ...) 

```
vmstat -s 
vmstat -t

Free – Amount of free/idle memory spaces.
si – Swaped in every second from disk in Kilo Bytes.
so – Swaped out every second to disk in Kilo Bytes.

```
- iostat (sysstat package on RH)
```
iostat -d # Disk statistics
iostat -p sda # Stats for /dev/sda
```

##### Practical Cases
- Application consuming CPU
- Application writing to disk

#### Networking
##### Tools
- ping
```
Used to send ICMP packets
ping google.com
To use in scripting:
ping localhost -n 1
```
- tcpdump
```
A packet sniffer. Will allow you to monitor and record the dump of traffic via the interface.
Better analyze further using Wireshark tool.
```

- netstat
```
Undestanding what is actually listening

netstat -anpl | grep nginx
netstat -l
netstat -st

```

- traceroute / tracepath 

- nslookup
```
Performs dns 
```
- NIC configuration check
```
Check parameters like MTU
ifconfig
ip a
ip route
route
```
- netcat
- curl

##### Practical Cases
- Checking ports blocked by firewall and debugging connections
- Checking what is application listening
