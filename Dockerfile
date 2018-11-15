FROM alpine:latest
MAINTAINER Erick Banks <erick@puppet.com>

ENV project beaker

RUN apk update && apk add \
  git \
  make \
  ruby \
  ruby-dev \
  ruby-etc \
  ruby-irb \
  ruby-rake \
  g++ \
  openssh-server \
  which \
  curl \
  libxml2-dev \
  libxslt-dev \
  zlib-dev \
  ruby-rdoc \
  bash

# install RVM, Ruby, and Bundler
#RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#RUN curl -L https://get.rvm.io | rvm_tar_command=tar bash -s stable
# install bundler without documentation
# use bash -l to run as a login shell to get the rvm goodness
RUN /bin/bash -c "gem install --no-rdoc --no-ri bundler"
RUN /bin/bash -c "gem install beaker"

# setup ssh
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh
COPY ./.ssh/docker_acceptance* /root/.ssh/
RUN chmod 600 /root/.ssh/docker_acceptance*
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN echo 'PermitRootLogin yes'       >> /etc/ssh/sshd_config
RUN echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config
RUN cat /root/.ssh/docker_acceptance.pub >> ~/.ssh/authorized_keys

RUN /usr/bin/beaker --version
RUN bundle config path /.bundle/gems

ENTRYPOINT ["bundle","exec","rake", "--trace"]