FROM registry.bionic.labs:5000/centos6:latest

MAINTAINER captain@bionic.labs
RUN yum update -y  && yum install wget -y
RUN yum install tar -y
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.3-x64.bin
RUN chmod a+x atlassian-jira-6.4.3-x64.bin
RUN ./atlassian-jira-6.4.3-x64.bin -q atlassian/jira/.install4j/response.varfile
EXPOSE 8080

CMD ["/usr/local/JIRA/bin/start-jira.sh", "-fg"]
# to run it, do docker run -p 8080:8080 container_id




