# This Dockerfile generates the docker image that gets used by Gitlab CI
# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
#   sudo docker push buildroot/base:YYYYMMDD.HHMM

# We use a specific tag for the base image *and* the corresponding date
# for the repository., so do not forget to update the apt-sources.list
# file that is shipped next to this Dockerfile.
FROM debian:stretch-20171210

LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
      vendor="Buildroot" \
description="Container with everything needed to run Buildroot"

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

# This repository can be a bit slow at times. Don't panic...
COPY apt-sources.list /etc/apt/sources.list

# The container has no package lists, so need to update first
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        build-essential cmake libc6:i386 g++-multilib \
        bc ca-certificates file locales rsync \
        cvs bzr git mercurial subversion wget \
        cpio unzip \
        libncurses5-dev \
        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
        python-pip && \
    apt-get -y autoremove && \
    apt-get -y clean

# For check-flake8
RUN python -m pip install --upgrade pip setuptools wheel && \
    pip install -q \
        flake8==3.5.0 \
        mccabe==0.6.1 \
        pycodestyle==2.3.1 \
        pyflakes==1.6.0

# To be able to generate a toolchain with locales, enable one UTF-8 locale
RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    /usr/sbin/locale-gen

RUN useradd -ms /bin/bash br-user && \
    chown -R br-user:br-user /home/br-user

USER br-user
WORKDIR /home/br-user
ENV HOME /home/br-user
ENV LC_ALL en_US.UTF-8
