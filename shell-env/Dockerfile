FROM quay.io/toolbx-images/ubuntu-toolbox:22.04

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="A 'rich' shell environment"

# copy to both $HOME and /root (which is the $HOME for root)
ENV HOME=/home/user

COPY _bashrc_for_Docker /home/user/.bashrc
COPY _bashaliases_for_Docker /home/user/.bash_aliases
COPY _bashrc_for_Docker /root/.bashrc
COPY _bashrc_for_Docker /root/.bashrc


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
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
	libjudy-dev \
	liblzma-dev \
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
	time \
	tree \
	tzdata \
	unrar \
	unzip \
	vim   \
	w3c-sgml-lib \
	wget \
	xml-twig-tools \
	xsltproc \
	xz-utils \
	zip

RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# set up utf-8 locale (defaults in offical centos/ubuntu images are POSIX)
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

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
