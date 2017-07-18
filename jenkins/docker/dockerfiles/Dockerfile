FROM registry.bionic.labs:5000/centos6:latest
MAINTAINER captain@bionic.labs

RUN yum update -y && yum install httpd -y
RUN yum install java-1.8.0-openjdk wget -y openssh-clients

ADD http://synology-1.bionic.labs/mirror/download/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
RUN mkdir -p /root/.ssh
ADD ADD/id_rsa /root/.ssh/id_rsa
ADD ADD/id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_*

RUN echo "StrictHostKeyChecking no" > /root/.ssh/config
RUN echo "PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'" > /root/.bashrc
EXPOSE 8080
CMD ["java", "-jar", "/opt/jenkins.war"]

#Go to your browser and type http://localhost:8080/


