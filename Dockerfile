FROM centos:centos7

RUN yum -y update

RUN yum -y install docker

RUN yum -y clean all

CMD ["sshd", "-D"]

EXPOSE 22
