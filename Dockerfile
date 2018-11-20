FROM alpine:latest
MAINTAINER Erick Banks <erick@puppet.com>

ENV project beaker

RUN apk update && apk --no-cache add \
  make \
  build-base \
  ruby \
  ruby-dev \
  ruby-rdoc \
  ruby-etc \
  ruby-irb \
  ruby-rake \
  openssh \
  libxml2-dev \
  libxslt-dev \
  zlib-dev \
  bash

RUN /bin/bash -c "gem install --no-rdoc --no-ri bundler"
RUN /bin/bash -c "gem install beaker"
RUN /bin/bash -c "gem install beaker-pe"
RUN /bin/bash -c "gem install beaker-rspec"

ENV BEAKER_keyfile=/root/.ssh/id_rsa-acceptance
ENV BEAKER_password=Qu@lity!
ENV BEAKER_debug=true
ENV BUNDLE_PATH=/module/.bundle/gems

COPY ./bundle_beaker.sh /bundle_beaker.sh

RUN /usr/bin/beaker --version
RUN ruby --version

ENTRYPOINT ["sh", "bundle_beaker.sh"]