FROM       ubuntu:15.04
MAINTAINER Gerald Kunstman "geraldk@techieheroes.com"

RUN apt-get update

RUN apt-get install -y openssh-server 
RUN mkdir /var/run/sshd

RUN apt-get install -y curl
RUN apt-get install -y mysql-client 
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y iputils-ping

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN adduser mysql

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
