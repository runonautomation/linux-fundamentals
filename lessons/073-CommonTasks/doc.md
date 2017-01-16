#### Commong DEV/QA tasks
##### Checking logs without centralized logging solution over single or multiple machines
```
tail -f *.log
ssh server "tail -f /var/log/server.log | grep test"

Example:

#!/usr/bin/env bash
#./remote_run.sh ~/.ssh/key.pem user host1,host2 'tail -f /var/log/*/*'
arr=$(echo $3 | tr "," "\n")
for i in $arr
do
  echo $i
  ssh -o StrictHostKeyChecking=no -i $1 $2@$i $4 &
done
trap ctrl_c INT
function ctrl_c() {
  kill $(jobs -p)
  exit
}
for i in `seq 1 999`; do
    sleep 1
done



# Checking big objects
du -a /var | sort -n -r | head -n 10
find / -xdev -type f -size +100M
```



##### Archiving files and directories
```
tar
c – Creates a new .tar archive file.
v – Verbosely show the .tar file progress.
f – File name type of the archive file.
z - create tgz archive
 
tar -cvf archive.tar /home/ec2-user/folder
tar -cvfz archive.tar.gz /home/ec2-user/folder

Uncompress:
tar -xvf archive.tar.gz

List
tar -tvf uploadprogress.tar


```

http://www.tecmint.com/18-tar-command-examples-in-linux/

##### Copying files via SCP & RSYNC
```
scp -p -v source_file_name username@destination_host:destination_folder # -p preserve
scp -p -v -r source username@destination_host:destination_folder
scp user1@remotehost1:/some/remote/dir/foobar.txt user2@remotehost2:/some/remote/dir/

```

```
rsync options source destination
-v : verbose
-r : recursive
-a : preserve links and file metadata
-z : compress file data
-h : human-readable, output numbers in a human-readable format

rsync -zvh backup.tar /tmp/backups/

Local to remote:
rsync -avz folder/ root@server:/home/ec2-user/folder

Remote to local:
rsync -avzh root@server:/home/ec2-user/folder /tmp/folder

# Filters
rsync -avze ssh --include 'R*' --exclude '*' root@192.168.0.101:/var/lib/rpm/ /root/rpm

```
http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/


##### SSH tricks and usage patterns 
- tunnel
```
ssh -L 9000:internalserver:80 me@remoteserver
ssh -f user@remoteserver -L 8080:internalserver:80 -N
-f # Background
-N # No execution
ssh -R 9000:remoteserver:3000 me@remoteserver
```

- virtual terminal allocation or password entry
```
ssh -tt -o StrictHostKeyChecking=no $USER@$REMOTE_HOST "sudo ps aux | grep nginx"
sshpass -ptest ssh -o StrictHostKeyChecking=no user@host command_to_run
```

##### Files delivery tricks
- Serve files from a server to a remote
```
python -m SimpleHTTPServer

npm install http-server -g
http-server
```


##### Remote file write/replace multiline from a single script
```
PREFIX="server"
USER="ec2-user@"

for HOST in {1..3}
do
cat <<EOF | ssh -tt -o StrictHostKeyChecking=no $USER$PREFIX$HOST "sudo tee /etc/yum.repos.d/mongo.repo"
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
EOF
done

```