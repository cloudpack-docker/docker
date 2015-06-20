FROM cloudpack/openssh

RUN yum -y update
RUN yum -y install docker git vim
RUN yum -y clean all

RUN mkdir /root/cloudpack
RUN git clone https://github.com/cloudpack-docker/centos.git        /root/cloudpack/centos
RUN git clone https://github.com/cloudpack-docker/openssh.git       /root/cloudpack/openssh
RUN git clone https://github.com/cloudpack-docker/docker.git        /root/cloudpack/docker
RUN git clone https://github.com/cloudpack-docker/rundeck.git       /root/cloudpack/rundeck
RUN git clone https://github.com/cloudpack-docker/nginx.git         /root/cloudpack/nginx
RUN git clone https://github.com/cloudpack-docker/php-fpm.git       /root/cloudpack/php-fpm
RUN git clone https://github.com/cloudpack-docker/mysql.git         /root/cloudpack/mysql
RUN git clone https://github.com/cloudpack-docker/memcached.git     /root/cloudpack/memcached
RUN git clone https://github.com/cloudpack-docker/td-agent.git      /root/cloudpack/td-agent
RUN git clone https://github.com/cloudpack-docker/awscli.git        /root/cloudpack/awscli
RUN git clone https://github.com/cloudpack-docker/jmeter-client.git /root/cloudpack/jmeter-client
RUN git clone https://github.com/cloudpack-docker/jmeter-server.git /root/cloudpack/jmeter-server

RUN echo >> /root/.bash_profile
RUN echo 'for REPOSITORY in $(ls /root/cloudpack); do' >> /root/.bash_profile
RUN echo '    echo -n "cloudpack/$REPOSITORY: "' >> /root/.bash_profile
RUN echo '    git --work-tree=/root/cloudpack/$REPOSITORY --git-dir=/root/cloudpack/$REPOSITORY/.git pull' >> /root/.bash_profile
RUN echo 'done' >> /root/.bash_profile

