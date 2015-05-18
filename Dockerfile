FROM cloudpack/sshd

RUN yum -y update
RUN yum -y install docker git vim
RUN yum -y clean all

RUN mkdir /root/cloudpack
RUN git clone https://github.com/cloudpack-docker/docker.git /root/cloudpack/docker
RUN git clone https://github.com/cloudpack-docker/nginx.git /root/cloudpack/nginx
RUN git clone https://github.com/cloudpack-docker/memcached.git /root/cloudpack/memcached
RUN git clone https://github.com/cloudpack-docker/php-fpm.git /root/cloudpack/php-fpm
RUN git clone https://github.com/cloudpack-docker/sshd.git /root/cloudpack/sshd
RUN git clone https://github.com/cloudpack-docker/rundeck.git /root/cloudpack/rundeck
