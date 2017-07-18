FROM registry.bionic.labs:5000/centos6:latest
MAINTAINER captain@bionic.labs

RUN sed 's/Defaults    requiretty/#Defaults    requiretty/' </etc/sudoers> temp_file

RUN mv temp_file /etc/sudoers

RUN yum install -y http://synology-1.bionic.labs/mirror/download/mysql-server-5.1.73-5.el6_6.x86_64.rpm

RUN service mysqld start

RUN chkconfig --levels 235 mysqld on

RUN cd /tmp && \
    wget http://synology-1.bionic.labs/mirror/download/atlassian-confluence-5.7.4-x64.bin && \
    chmod a+x atlassian-confluence-5.7.4-x64.bin && \
    ./atlassian-confluence-5.7.4-x64.bin -q /opt/atlassian/confluence/.install4j/response.varfile

EXPOSE 8090

RUN yum -y clean all

CMD ["/usr/local/Confluence/bin/start-confluence.sh", "-fg"]
