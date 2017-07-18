FROM registry.bionic.labs:5000/centos:6.7
MAINTAINER captain@bionic.labs


RUN yum update -y && rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN yum install fail2ban -y

COPY jail.conf /etc/fail2ban/jail.local

EXPOSE 22

CMD /usr/bin/fail2ban-server -f