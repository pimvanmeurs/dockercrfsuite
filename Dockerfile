FROM ubuntu:14.04

MAINTAINER Pim van Meurs


RUN \
  apt-get update && \
  apt-get install -y -q \
    build-essential \
    git \
    cifs-utils \
    curl \
    subversion

RUN \
  apt-get update && \
  apt-get install -y -q \
    python \
    cython \
    python-pip \
    python-numpy \
    python-scipy \
    python-matplotlib

RUN \
  apt-get update && \
  apt-get install -y -q \
    autoconf \
    automake \
    libtool

RUN \
  curl -L -O -s https://github.com/downloads/chokkan/liblbfgs/liblbfgs-1.10.tar.gz && \
  tar -xvf liblbfgs-1.10.tar.gz && \
  cd liblbfgs-1.10 && \
  ./configure --prefix=$HOME/local && \
  make && \
  make install


RUN \
  curl -L -O -s https://github.com/downloads/chokkan/crfsuite/crfsuite-0.12.tar.gz && \
  tar -xvf crfsuite-0.12.tar.gz
  cd crfsuite-0.12 && \
  ./configure --prefix=$HOME/local --with-liblbfgs=$HOME/local &&
  make && \
  make install 

