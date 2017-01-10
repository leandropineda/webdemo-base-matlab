FROM ubuntu:14.04
MAINTAINER Milton Pividori <miltondp@gmail.com>

# Web Demo Builder - Base Docker image for MATLAB

# Install base packages
RUN DEBIAN_FRONTEND=noninteractive \
    dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
      libxt6 \
      libxmu6 \
      libxp6 \
      libxtst6 \
      build-essential \
      gfortran \
      gcc \
      g++ \
      libc6:i386 libncurses5:i386 libstdc++6:i386 \
      imagemagick \
      xorg && \
    apt-get clean && apt-get autoclean


# Create a new user "developer".
# It will get access to the X11 session in the host computer

ENV uid=1000
ENV gid=${uid}

COPY create_user.sh /
COPY run.sh /

CMD /create_user.sh && sudo -H -u developer /bin/bash

