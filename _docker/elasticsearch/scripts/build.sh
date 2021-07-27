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
  #apt-add-repository ppa:linuxuprising/java && \
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - &&
  echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list && \
  echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu hirsute main" | tee /etc/apt/sources.list.d/linuxuprising-java.list &&\
  echo oracle-java16-installer shared/accepted-oracle-license-v1-2 select true |  /usr/bin/debconf-set-selections && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
  apt-get update &&
  apt-get install -y \
    elasticsearch=7.10.2  && \
 dpkg --configure -a
 apt-get install -y --no-install-recommends \
    oracle-java16-installer \
    oracle-java16-set-default \
    ca-certificates-java \
    oracle-java16-set-default && \
# Define commonly used JAVA_HOME variable
export JAVA_HOME=/usr/lib/jvm/java-16-oracle && \
export ES_JAVA_HOME=/usr/lib/jvm/java-16-oracle && \
#update-rc.d elasticsearch defaults 95 10
apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*