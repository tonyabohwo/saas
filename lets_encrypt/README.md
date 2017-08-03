## SETTING UP LET'S ENCRYPT ON CENTOS 7

####Step 1
#####Enable the EPEL repository

```
sudo yum install epel-release
```

####Step2 
#####Installed httpd and setup my index.html site and started httpd, then confirm i can hit it via my captainovie.co.uk

```
yum -y install httpd 
service httpd start
```

Step 3
install all of the required packages
```
sudo yum install httpd mod_ssl python-certbot-apache
```

Step 4
#####Restart httpd and confirm running status
```
sudo systemctl start httpd
```
Step 5
#####Open ports If iptables firewall is running
```
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
```
```
sudo iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
```

Step 6
RUN checks
```
curl your_domain
curl -k https://your_domain
```
Step 7
Requesting an SSL Certificate from Let's Encrypt
```
sudo certbot --apache -d your_domain 
```
For more than 1 domain

```
sudo certbot --apache -d example.com -d www.example.com 
```

This will run and you come across commndline inputs, you also see an option to choose if the site should be accessible via http and https or just https

At this point the encryption is up, but it would give a C rating. so you go ahead and secure further

Step 8
```
edit /etc/httpd/conf.d/ssl.conf
```

COMMENT OUT THE FOLLOWING LINES

#SSLProtocol all -SSLv2
#SSLCipherSuite HIGH:MEDIUM:!aNULL:!MD5:!SEED:!IDEA

