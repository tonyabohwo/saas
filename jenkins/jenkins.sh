#!/bin/bash

#Install java
yum -y install java-1.8.0-openjdk
echo $?

#Install wget
yum -y install wget 
echo $?

#Download jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
echo $?

#Import jenkins key
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
echo $?
#Install jenkins
yum -y install jenkins
echo $?

#Star jenkins and enable it
systemctl start jenkins.service && systemctl enable jenkins.service
echo $?













