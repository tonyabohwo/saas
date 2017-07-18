FROM registry.bionic.labs:5000/centos:6.7
MAINTAINER captain@bionic.labs

#update yum and install
RUN yum update -y && yum install glibc zlib

# copy install file
COPY Nessus-6.3.5-es6.x86_64.rpm /

#install nessus
RUN rpm -ivh Nessus-6.3.5-es6.x86_64.rpm

EXPOSE 8834
CMD /opt/nessus/sbin/nessus-service



