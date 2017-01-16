#!/usr/bin/env bash
users=( student1 student2 student3)

groupadd students
echo ‘%students    ALL=(ALL)        ALL’ >> /etc/sudoers

ssh-keygen -b 1024 -f user -t dsa -N ''
cp user.pub /tmp/user.pub

for user in "${users[@]}"
do
    echo "Creating $user"
	useradd -c "$user" $user
	echo "$user" | passwd "$user" --stdin
    echo "Welcome" >  /home/$user/welcome_to_linux_training.txt
    mkdir  /home/$user/my_training_documents
    echo "my_first_document" >  /home/$user/my_training_documents/my_first_document.txt
    ln -s /home/$user/my_training_documents/my_first_document.txt /home/$user/softlink_to_my_first_document.txt
    ln /home/$user/my_training_documents/my_first_document.txt /home/$user/hardlink_to_my_first_document.txt
	mkdir -p /home/$user/.ssh
	chmod 700 /home/$user/.ssh
	chown $user:$user /home/$user/.ssh
    chown -R $user:$user /home/$user
	cat /tmp/user.pub >> /home/$user/.ssh/authorized_keys
	chmod 600 /home/$user/.ssh/authorized_keys
	chown $user:$user /home/$user/.ssh/authorized_keys
done

for user in "${users[@]}"
do
    echo "Adding $user to sudoers"
    usermod -a -G students $user
done

# For making it easier - passwd auth
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
/etc/init.d/sshd restart