
#!/bin/bash

#Download the Yum Repo package of MySQL Server 5.6
echo $?

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
echo $?

#Install mysql-community-release-el7-5.noarch.rpm package
rpm -ivh mysql-community-release-el7-5.noarch.rpm
echo $?

#Installing MySQL Server
yum install mysql-server -y
echo $?

systemctl start mysqld
echo $?

chkconfig --levels 235 mysqld on
echo $?

# Download confluence
wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.7.4-x64.bin
echo $?

# Make file executable
chmod a+x atlassian-confluence-5.7.4-x64.bin
echo $?

#Run executable
./atlassian-confluence-5.7.4-x64.bin -q /opt/atlassian/confluence/.install4j/response.varfile
echo $?

