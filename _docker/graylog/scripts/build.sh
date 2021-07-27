#!/bin/bash
set -ex
export DEBIAN_FRONTEND=noninteractive
#set the timezone for tzdata in ubuntu otherwise during installation ask for select timezone
export TZ=UTC
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone
apt-get update &&
  apt-get install -y \
    software-properties-common \
    git \
    build-essential \
    openssl \
    wget \
    gnupg \
    gosu \
    curl \
    zip \
    unzip \
    supervisor \
    libsqlite3-dev \
    libcap2-bin \
    libpng-dev \
    python2 \
    bash \
    init-system-helpers \
    autoconf \
    automake \
    apt-utils \
    supervisor \
    apt-transport-https  &&\
  echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu hirsute main" | tee /etc/apt/sources.list.d/linuxuprising-java.list &&\
  echo oracle-java16-installer shared/accepted-oracle-license-v1-2 select true |  /usr/bin/debconf-set-selections && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
  apt-get update &&
 dpkg --configure -a
 apt-get install -y --no-install-recommends \
    oracle-java16-installer \
    oracle-java16-set-default \
    ca-certificates-java \
    oracle-java16-set-default && \
# Define commonly used JAVA_HOME variable
export JAVA_HOME=/usr/lib/jvm/java-16-oracle &&
wget https://packages.graylog2.org/repo/packages/graylog-4.1-repository_latest.deb
dpkg -i graylog-4.1-repository_latest.deb
apt-get update && apt-get install graylog-server graylog-enterprise-plugins graylog-integrations-plugins graylog-enterprise-integrations-plugins
apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*