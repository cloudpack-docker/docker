FROM centos:centos7

RUN yum -y update
RUN yum -y install docker git vim initscripts passwd openssh-server sudo
RUN yum -y clean all

RUN useradd -m cloudpack
RUN echo cloudpack:cloudpack | chpasswd

RUN echo "cloudpack ALL=NOPASSWD: /usr/bin/docker" >> /etc/sudoers

RUN su -c "git clone https://github.com/cloudpack-docker/docker.git /home/cloudpack/docker" cloudpack
RUN su -c "git clone https://github.com/cloudpack-docker/nginx.git /home/cloudpack/nginx" cloudpack

RUN sshd-keygen
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22
