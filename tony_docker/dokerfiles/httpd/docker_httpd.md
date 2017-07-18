
FROM registry.bionic.labs:5000/centos:7
MAINTAINER captain@bionic.labs

# install httpd
RUN yum update -y && yum install httpd -y

# Expose the httpd port
EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"] 
CMD ["-D", "FOREGROUND"]



