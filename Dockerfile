FROM debian

RUN apt-get update
RUN apt-get -y install proftpd-basic openssh-client
ADD proftpd.conf /etc/proftpd/prodtpd.conf
ADD modules.conf /etc/proftpd/modules.conf
ADD sftp.conf /etc/proftpd/conf.d/sftp.conf
ADD setup-proftpd.sh /opt/setup-proftpd.sh
RUN mkdir /var/ftp
CMD /opt/setup-proftpd.sh
