FROM registry.bionic.labs:5000/centos6:latest
MAINTAINER captain@bionic.labs

RUN yum update -y  && yum -y clean all
RUN yum install sudo -y && yum -y clean all
RUN sed 's/Defaults    requiretty/#Defaults    requiretty/' </etc/sudoers> temp_file
RUN mv temp_file /etc/sudoers


ADD forward.zone.txt /etc/
ADD named.rfc1912.zones.txt /etc/
ADD named.txt /etc/
ADD reverse.zone.txt /etc/
ADD script.sh /etc/
RUN chmod a+x /etc/script.sh
RUN sudo ./etc/script.sh


EXPOSE 53
CMD /etc/rc.d/init.d/named start
