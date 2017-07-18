FROM registry.bionic.labs:5000/centos6:latest
MAINTAINER captain@bionic.labs

#update yum and install
RUN yum update -y && yum install glibc zlib
RUN yum install wget -y && yum -y clean all
# Download nessus
RUN wget http://synology-1.bionic.labs/mirror/download/Nessus-6.4.3-es6.x86_64.rpm

#install nessus
RUN rpm -ivh Nessus-6.4.3-es6.x86_64.rpm

EXPOSE 8834
CMD /opt/nessus/sbin/nessus-service

# To run it you do docker run -p 80:8834 and go to web https://container_id:80/


