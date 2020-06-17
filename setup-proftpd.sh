#!/bin/bash

mkdir -p /var/ftp/$USER_FTP
chown $UID_FTP /var/ftp/$USER_FTP
cd /etc/proftpd
echo $PASS_FTP | ftpasswd --passwd --name=$USER_FTP --uid=$UID_FTP --home=/var/ftp/$USER_FTP --shell=/bin/false --stdin
touch ftpd.group
if [ ! -d /etc/proftpd/sshkey ]
then
    mkdir /etc/proftpd/sshkey 
    ssh-keygen -m PEM -f /etc/proftpd/sshkey/ssh_host_rsa_key -N '' -t rsa -b 2048
    ssh-keygen -m PEM -f /etc/proftpd/sshkey/ssh_host_dsa_key -N '' -t dsa -b 1024
    ssh-keygen -m PEM -f /etc/proftpd/sshkey/ssh_host_ecdsa_key -N '' -t ecdsa -b 521
fi
proftpd -n
