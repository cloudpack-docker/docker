FROM centos:centos7

RUN yum -y update
RUN yum -y install docker
RUN yum -y install git
RUN yum -y install vim
RUN yum -y install openssh-server
RUN yum -y clean all

RUN useradd -m cloudpack
RUN echo cloudpack:cloudpack | chpasswd

CMD ["sshd", "-D"]

EXPOSE 22
