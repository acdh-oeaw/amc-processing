FROM ubuntu:22.04

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="A  java8 environment"

COPY _bashrc_for_Docker /home/user/.bashrc
COPY _bashrc_for_Docker /root/.bashrc

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
apt-get install -y \
       less  \
       unzip     \
       parallel  \
       time \
       vim       \ 
       htop      \ 
       build-essential  \
       apt-utils \
       locales \
       tzdata \
       supervisor 

RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# set up utf-8 locale (defaults in offical centos/ubuntu images are POSIX)
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt update && \
apt-get install -y  openjdk-8-jdk ant && \
apt-get install -y  xsltproc

# Create a non-root user and group with a home directory
USER root
RUN groupadd -g 1000 user
RUN useradd -u 1000 -g 1000 user
RUN find /home/user -exec chown -h 1000 {} \; 
RUN find /home/user -exec chgrp -h 1000 {} \;  

# Switch to the non-root user
USER user
# Set the working directory
WORKDIR /home/user

# CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
