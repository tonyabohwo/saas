Link used for setup [http://ostechnix.com/2013/02/08/setup-mail-server-using-postfixdovecotsquirrelmail-in-centosrhelscientific-linux-6-3-step-by-step/](http://ostechnix.com/2013/02/08/setup-mail-server-using-postfixdovecotsquirrelmail-in-centosrhelscientific-linux-6-3-step-by-step/)


####Step 1
```
yum install telnet -y
yum remove sendmail -y
```

##### You were supposed to stop services, but ignore since we have opened up ports on iptables

```
service iptables stop
service ip6tables stop
chkconfig iptables off
chkconfig ip6tables off
```

######Edit selinux and selinux should be disabled SELINUX=disabled
```
vi /etc/selinux/config
```

####Step2
```
yum install postfix -y
```

######Edit /etc/postfix/main.cf

```
sudo sed -i -e 's/#myhostname = host.domain.tld/myhostname = mail1.pinnaclemobileapp.com/' /etc/postfix/main.cf

sudo sed -i -e 's/#mydomain = domain.tld/mydomain = pinnaclemobileapp.com/' /etc/postfix/main.cf

sudo sed -i -e 's/#myorigin = $mydomain/myorigin = $mydomain/' /etc/postfix/main.cf

sudo sed -i -e 's/inet_interfaces = localhost/inet_interfaces = all/' /etc/postfix/main.cf

sudo sed -i -e 's/mydestination = $myhostname, localhost.$mydomain, localhost/mydestination = $myhostname, localhost.$mydomain, localhost, $domain/' /etc/postfix/main.cf

sudo echo "mynetworks = 127.0.0.0/8, 10.0.1.0/24" >> /etc/postfix/main.cf

sed -i -e 's/#home_mailbox = Maildir/home_mailbox = Maildir/' /etc/postfix/main.cf
```

######Start postfix
```
service postfix start
chkconfig postfix on
```

######Test smtp at this point
```
telnet localhost smtp
telnet mail1.pinnaclemobileapp.com 25
```
######Edit master.cf and uncomment lines 11, 12, 
######17, 18, 19, 20 and 21

``` 
sudo sed -i -e 's/#submission/submission/' /etc/postfix/master.cf

sudo echo "smtps     inet  n       -       n       -       -       smtpd" >> /etc/postfix/master.cf

sudo echo "  -o smtpd_tls_wrappermode=yes" >> /etc/postfix/master.cf

sudo echo "  -o smtpd_sasl_auth_enable=yes" >> /etc/postfix/master.cf 

sudo echo "  -o smtpd_client_restrictions=permit_sasl_authenticated,reject" >> /etc/postfix/master.cf

sudo echo "  -o milter_macro_daemon_name=ORIGINATING" >> /etc/postfix/master.cf 
```

####Step 3
######Install dovecot
```
yum install dovecot -y
```

#####Edit /etc/dovecot/dovecot.conf
```
sudo sed -i -e 's/#protocols = imap pop3 lmtp/protocols = imap pop3 lmtp/' /etc/dovecot/dovecot.conf
```

######Edit /etc/dovecot/conf.d/10-mail.conf as shown
######mail_location = maildir:~/Maildir  ##line no 24 - uncomment
```
sudo sed -i -e 's/#   mail_location = maildir/   mail_location = maildir/' /etc/dovecot/conf.d/10-mail.conf


```

######Edit /etc/dovecot/conf.d/10-auth.conf  
line no 9 - uncomment and change from yes to no
line no 97 - add the text "login"

```
sudo sed -i -e 's/#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-auth.conf
sudo sed -i -e 's/auth_mechanisms = plain/auth_mechanisms = plain login/' /etc/dovecot/conf.d/10-auth.conf

```
######Edit /etc/dovecot/conf.d/10-master.conf ash shown below
unix_listener auth-userdb {
    #mode = 0600
    user = postfix  ##line no 83 - uncomment and enter postfix
    group = postfix  ##line no 84 - uncomment and enter postfix
    
```
sudo sed -i -e 's/    #user =/    user = postfix/' /etc/dovecot/conf.d/10-master.conf

sudo sed -i -e 's/     #group =/     group = postfix/' /etc/dovecot/conf.d/10-master.conf
```

######Start dovecot

```
service dovecot start
chkconfig dovecot on 
```


######Test dovecot
```
telnet mail1.pinnaclemobileapp.com imap
```

####Step 4
######Install squirrelmail
```
wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm 
yum install squirrelmail -y
service httpd start 
chkconfig httpd on
```

######Configure squirrelmail
```
cd /usr/share/squirrelmail/config/
./conf.pl 
```
######Input on commandline for configuration are
```
1
1
SquirrelMail
s
enter
q
```
######Edit httpd.conf
```
vi /etc/httpd/conf/httpd.conf
```
######Add the following at the bottom of file

######Edit /etc/httpd/conf/httpd.conf
```
sudo echo "Alias /squirrelmail /usr/share/squirrelmail" >> /etc/httpd/conf/httpd.conf 
sudo echo "<Directory /usr/share/squirrelmail>" >> /etc/httpd/conf/httpd.conf
sudo echo "Options Indexes FollowSymLinks" >> /etc/httpd/conf/httpd.conf
sudo echo "RewriteEngine On" >> /etc/httpd/conf/httpd.conf 
sudo echo "AllowOverride All" >> /etc/httpd/conf/httpd.conf 
sudo echo "DirectoryIndex index.php" >> /etc/httpd/conf/httpd.conf
sudo echo "Order allow,deny" >> /etc/httpd/conf/httpd.conf
sudo echo "Allow from all" >> /etc/httpd/conf/httpd.conf
sudo echo "</Directory>" >> /etc/httpd/conf/httpd.conf

```
######Restart httpd
```
service httpd restart
```




## How to use script to setup mail

I have the files for scripting mail setup, 

1. conf.pl
2. httpd.conf
3. The setup script itself called script.sh

```
cd /mnt/hgfs/infra/saas/mail/docker/scripts
./script.sh
```

