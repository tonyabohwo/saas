#!/bin/bash

#Install telnet
yum install telnet -y

#Remove sendmail and turn off iptables
yum remove sendmail -y
echo $?

#Install postfix
yum install postfix -y
echo $?

#Configure /etc/postfix/main.cf
sudo sed -i -e 's/#myhostname = host.domain.tld/myhostname = mail1.pinnaclemobileapp.com/' /etc/postfix/main.cf
echo $?

sudo sed -i -e 's/#mydomain = domain.tld/mydomain = pinnaclemobileapp.com/' /etc/postfix/main.cf
echo $?

sudo sed -i -e 's/#myorigin = $mydomain/myorigin = $mydomain/' /etc/postfix/main.cf
echo $?

sudo sed -i -e 's/inet_interfaces = localhost/inet_interfaces = all/' /etc/postfix/main.cf
echo $?

sudo sed -i -e 's/mydestination = $myhostname, localhost.$mydomain, localhost/mydestination = $myhostname, localhost.$mydomain, localhost, $domain/' /etc/postfix/main.cf
echo $?

sudo echo "mynetworks = 127.0.0.0/8, 10.0.1.0/24" >> /etc/postfix/main.cf
echo $?

sed -i -e 's/#home_mailbox = Maildir/home_mailbox = Maildir/' /etc/postfix/main.cf
echo $?

#Edit /etc/postfix/master.cf
sudo sed -i -e 's/#submission/submission/' /etc/postfix/master.cf
echo $?

sudo echo "smtps     inet  n       -       n       -       -       smtpd" >> /etc/postfix/master.cf
echo $?

sudo echo "  -o smtpd_tls_wrappermode=yes" >> /etc/postfix/master.cf
echo $?

sudo echo "  -o smtpd_sasl_auth_enable=yes" >> /etc/postfix/master.cf 
echo $?

sudo echo "  -o smtpd_client_restrictions=permit_sasl_authenticated,reject" >> /etc/postfix/master.cf
echo $?

sudo echo "  -o milter_macro_daemon_name=ORIGINATING" >> /etc/postfix/master.cf
echo $?


#Start postfix
service postfix start
echo $?

chkconfig postfix on
echo $?

#Install dovecot
yum install dovecot -y
echo $?

#Edit /etc/dovecot/dovecot.conf
sudo sed -i -e 's/#protocols = imap pop3 lmtp/protocols = imap pop3 lmtp/' /etc/dovecot/dovecot.conf
echo $?

#Edit /etc/dovecot/conf.d/10-mail.conf as shown
#mail_location = maildir:~/Maildir ##line no 24 - uncomment
sudo sed -i -e 's/#   mail_location = maildir/   mail_location = maildir/' /etc/dovecot/conf.d/10-mail.conf
echo $?

#Edit /etc/dovecot/conf.d/10-auth.conf
sudo sed -i -e 's/#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-auth.conf
echo $?

sudo sed -i -e 's/auth_mechanisms = plain/auth_mechanisms = plain login/' /etc/dovecot/conf.d/10-auth.conf
echo $?

#Edit /etc/dovecot/conf.d/10-master.conf 
sudo sed -i -e 's/    #user =/    user = postfix/' /etc/dovecot/conf.d/10-master.conf
echo $?

sudo sed -i -e 's/     #group =/     group = postfix/' /etc/dovecot/conf.d/10-master.conf
echo $?

#Start dovecot
service dovecot start
echo $?

service dovecot start
echo $?


#Install squirrelmail

wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
echo $?
rpm -ivh epel-release-6-8.noarch.rpm 
echo $?
yum install squirrelmail -y
echo $?
service httpd start 
echo $?
chkconfig httpd on
echo $?

#Configure squirrelmail
cp conf.pl /usr/share/squirrelmail/config/conf.pl
echo $?
cp httpd.conf /etc/httpd/conf/httpd.conf
echo $?

#Restart httpd
service httpd restart
