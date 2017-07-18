
####Step 1

######Download the release key associated with the ownCloud software:

```
cd /etc/yum.repos.d/

wget http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-6/isv:ownCloud:community.repo
```

######Add epel repository

```
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```
####Step 2

###### Install ownCloud

```
yum install owncloud -y
```

ownCloud will install Apache with its dependency, if it doesn't get installed automatically manually install httpd:
yum install httpd -y

###### Apache must restart at every boot so we will add it to chkconfig as:

```
chkconfig --levels 235 httpd on
/etc/init.d/httpd start
```
####Step 3

######Download the Yum Repo package of MySQL Server 5.6
```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

Install mysql-community-release-el7-5.noarch.rpm package
rpm -ivh mysql-community-release-el7-5.noarch.rpm
```
####Step 4

######Installing MySQL Server and starting the service

```
yum install mysql-server -y
chkconfig --levels 235 mysqld on
systemctl start mysqld
```

####Step 5
######Configure MySQL. I provided responses to what you would come across

```
mysql_secure_installation
```
######Responses to what you would come across

```
Set root password? [Y/n] <-- ENTER

New password: <-- yourrootsqlpassword

Re-enter new password: <-- yourrootsqlpassword

Remove anonymous users? [Y/n] <-- ENTER

Disallow root login remotely? [Y/n] <-- ENTER

Remove test database and access to it? [Y/n] <-- ENTER

Reload privilege tables now? [Y/n] <-- ENTER
```

####Step 6

######Create a database
```
mysql -u root -p
```
######Create a database for ownCloud in Mysql prompt by putting each on on each prompt

```
CREATE DATABASE owncloud;
GRANT ALL ON owncloud.* to 'owncloud'@'localhost' IDENTIFIED BY 'database_password';
exit
```

Go to http://ip_address/owncloud to finish setup


Note: This does not come with default login, you set login when you first launch application..