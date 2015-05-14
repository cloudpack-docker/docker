FROM centos:centos7

RUN yum -y update
RUN yum -y install docker
RUN yum -y install git
RUN yum -y install vim
RUN yum -y install initscripts
RUN yum -y install passwd
RUN yum -y install openssh-server
RUN yum -y install epel-release
RUN yum -y install supervisor
RUN yum -y clean all

RUN useradd -m cloudpack
RUN echo cloudpack:cloudpack | chpasswd

RUN su -c "git clone https://github.com/cloudpack-docker/docker.git /home/cloudpack/docker" cloudpack
RUN su -c "git clone https://github.com/cloudpack-docker/nginx.git /home/cloudpack/nginx" cloudpack

RUN sshd-keygen
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN echo "[program:sshd]" > /etc/supervisord.d/sshd.ini
RUN echo "command=/usr/sbin/sshd -D" >> /etc/supervisord.d/sshd.ini

CMD ["/usr/bin/supervisord -n"]

EXPOSE 22
