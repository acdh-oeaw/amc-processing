FROM quay.io/toolbx/ubuntu-toolbox:22.04

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="A 'rich' shell environment for processing amc etc."

# copy to both $HOME and /root (which is the $HOME for root)
ENV HOME=/home/user\
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
	JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
## ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

USER root

# set up utf-8 locale (defaults in offical centos/ubuntu images are POSIX)
RUN locale-gen en_US.UTF-8 && \
    apt-get -y update && apt-get -y full-upgrade && \
    apt-get install -y \
	apache2-utils \
	apt-utils \
	build-essential \
	cpanminus \
	curl \
	diffutils \
	git \
	htop \
	less \
	libhtml-tidy-perl \
	libjudy-dev \
	liblzma-dev \
	libreoffice \
	libreoffice-java-common \
	locales \
	locate \
	lsof \
	p7zip-full \
	p7zip-rar \
	parallel  \
	pcregrep  \
	postgresql-client \
	pwgen \
	python2 \
	rar \
	rename \
	rsync \
	sfst \
	time \
	tree \
	tmux \
	tzdata \
	unrar \
	unzip \
	unrtf \
	unoconv \
	vim   \
	w3c-sgml-lib \
	wget \
	xmlstarlet \
	xml-twig-tools \
	xsltproc \
	xz-utils \
	zip \
	openjdk-11-jdk \
	ant \
	xsltproc && \
	cd /tmp && \
    wget https://github.com/jgm/pandoc/releases/download/3.3/pandoc-3.3-1-amd64.deb && \
    sudo dpkg -i pandoc-3.3-1-amd64.deb && \
    rm pandoc-3*.deb && \
	apt-get -y clean
## pandoc: in ubuntu 22.04 apt installed version 2.9 which is too old for us - therefore install it directly from .deb ( ubuntu 24.04 then already contains pandoc-3.2.1

COPY _bashrc_for_Docker /root/.bashrc
COPY _bashaliases_for_Docker /root/.bash_aliases
# Set up time zone
# Create a non-root user and group with a home directory
RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
	mkdir /home/user && cp /root/.bashrc /root/.bash_aliases /home/user/ && \ 
    groupadd -f      -g 100              users && \
    useradd  -u 1000 -g 100 -s /bin/bash user && \
    find /home/user -exec chown -h 1000 {} \; && \
    find /home/user -exec chgrp -h 100 {} \;  

# Switch to the non-root user
USER user

# Set the working directory
WORKDIR /home/user

# CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
