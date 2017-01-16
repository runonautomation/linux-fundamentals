#### Common commandline tools
#####
- FS Tools: ls, find, pwd
```
ls -lah 


find . -name file.txt
find / -type d -name Directory
find . -type f -name "*.txt"
find . -type f -perm 0644 -print
find . -type f -name "*.txt" -exec rm -f {} \; # Delete all txt
find /tmp -type f -empty
find / -mtime 50

pwd

```
References:
http://www.tecmint.com/35-practical-examples-of-linux-find-command/
http://www.tecmint.com/15-basic-ls-command-examples-in-linux/

- File read tools: cat, head, tail
```
cat file
cat -n file

tail -n 4 /etc/group
tail -f /var/log/interactive

```
- grep

```
Grep excluding comment:
ps aux | grep name

grep –v “#”  /etc/apache2/sites-available/default-ssl

grep –r “test” *

ifconfig | grep -w eth0

```

- tee
```

command STDOUT -> tee file.txt -> command STDIN
                    |
                    file.txt

ls | tee file
ls | tee –a file

```

 
- awk
```

ls -l | awk '{print $3}'

ls -l | awk '{print NR "- " $3 ":"  $9 }'

awk 'BEGIN { for (i = 1; i <= 3; i++) print int(101 * rand()) }'

```

- Sorting/filtering: sort / uniq

#### Commandline Text editors
##### VI/VIM
Absolute minunum
```
:q!
:wq!
:

vimtutor
```
https://scotch.io/tutorials/getting-started-with-vim-an-interactive-guide
http://bullium.com/support/vim.html
https://spin.atomicobject.com/2016/04/19/vim-commands-cheat-sheet/
##### Nano



#### Useful applications for remote connections
##### Screen / tmux
Why we need it.

- screen
Commands:
```
screen -S <name> #start new session
screen -ls
screen -x # To running 
screen -r <name>
```
http://aperiodic.net/screen/quick_reference

- tmux
https://gist.github.com/MohamedAlaa/2961058
