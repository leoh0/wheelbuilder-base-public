FROM ubuntu:16.04
MAINTAINER Eohyung Lee (al.l@kakaocorp.com)

RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
    build-essential python-pip software-properties-common \
    python-dev git

RUN echo "krb5-config krb5-config/default_realm string MYDOMAIN.COM" | debconf-set-selections && \
    echo "krb5-config krb5-config/kerberos_servers string krbserver.mydomain.com" | debconf-set-selections && \
    echo "krb5-config krb5-config/admin_server string krbserver.mydomain.com" | debconf-set-selections && \
    apt-get -yqq install libmysqlclient-dev libxml2-dev \
    libxslt1-dev mysql-client libpq-dev libvirt-dev \
    libnspr4-dev pkg-config libsqlite3-dev libzmq-dev \
    libffi-dev libldap2-dev libsasl2-dev ccache \
    krb5-config libkrb5-dev libssl-dev liberasurecode-dev \
    libjpeg8-dev curl

RUN curl -sL https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | \
    bash

RUN PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4" ~/.pyenv/bin/pyenv install 2.7.12

RUN ~/.pyenv/bin/pyenv global 2.7.12 && ~/.pyenv/bin/pyenv virtualenv venv

ENV PIP_CONFIG_FILE=/pip.conf

RUN echo 'export PATH="/root/.pyenv/bin:$PATH"\neval "$(pyenv init -)"\neval "$(pyenv virtualenv-init -)"' >> /root/.bashrc

ARG BRANCH

ENV BRANCH=${BRANCH}

COPY makewheel.sh .
