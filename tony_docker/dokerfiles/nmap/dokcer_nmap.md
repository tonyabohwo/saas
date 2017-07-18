FROM registry.bionic.labs:5000/centos:6.7
MAINTAINER captain@bionic.labs

RUN yum update -y && yum install nmap -y


EXPOSE 22

ENTRYPOINT ["nmap"]











# To use it to scan, do: docker run -it container_id port/ip. e.g
# docker run -it 0ff84ec43751 10.0.1.241