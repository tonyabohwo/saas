##INSTALLING CONFLUENCE ON CENTOS 7

#####Step 1

######Install java

```
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
tar xzf jdk-7u79-linux-x64.tar.gz
```

###### Go into the java file and run the following commands
```
cd /opt/jdk1.7.0_79/
alternatives --install /usr/bin/java java /opt/jdk1.7.0_79/bin/java 2
alternatives --config java
```

#####Step 2

######Download the Yum Repo package of MySQL Server 5.6

```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
```

######Install mysql-community-release-el7-5.noarch.rpm package

```
rpm -ivh mysql-community-release-el7-5.noarch.rpm
```

######Installing MySQL Server

```
yum install mysql-server -y
chkconfig --levels 235 mysqld on
systemctl start mysqld
```
#####Step 3

###### Download confluence

```
wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.7.4-x64.bin
```

###### Make file executable

```
chmod a+x atlassian-confluence-5.7.4-x64.bin
```
######Run executable
```
./atlassian-confluence-5.7.4-x64.bin
```
####### Start your firewall
I used rackspace in doing this and i had to start firewall before I was able to access this on http://ip_address:8090.

At this point you can move on and finish your installation