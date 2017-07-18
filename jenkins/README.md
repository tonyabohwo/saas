##INSTALLATION ON CENTOS 6 & 7

#####Step 1
######Install open jdk

```
yum install java-1.8.0-openjdk
```

######Confirm the version

```
java -version
```

#####Step 2

######Download jenkins 

```
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
```
#####Step 3

######Install Jenkins

```
yum install jenkins
```

######Start jenkins

```
service jenkins start
```

######Add Jenkins to system boot


```
chkconfig jenkins on
```

Go to your browser and type http://localhost:8080/



