FROM python:3.12-bullseye

## stand 2024-01 VOR neuem build: python:3.10-bullseye (Python 3.10.14)

##################### Hannes Pirker 2021-07-19
### Because docker could not build graph-analytics anymore: 
### made a copy and use this a basis for a plain spacyamc - docker
### actually all we need for amc is to be able to run: 
###     
###      amc-network/notebook/Create_verticals_from_tokens.py 
###
###  i.e. here we try to rip away all the network-analyis stuff 
##############

### the original spacyamc was derived from Gabriel Grills amc_network-code i.e. it contained LOTs of stuff which is superfluous by now
### THIS Docker tries to strip down the environment to the bare essentials

# copy to both $HOME and /root (which is the $HOME for root
COPY _bashrc_for_Docker /home/user/.bashrc
COPY _bashaliases_for_Docker /home/user/.bash_aliases
COPY _bashrc_for_Docker /root/.bashrc
COPY _bashrc_for_Docker /root/.bashrc


# Install OS-level packages and misc. tools
RUN apt-get update && apt-get install -y --no-install-recommends \
	locales \
	wget \
	python3-software-properties \
	software-properties-common \
	curl \
	unzip \
	vim \
	less \
	htop \
	pcregrep \
	tzdata && \
    apt-get clean

## pip was complaining that was not the latest version
RUN python -m pip install --upgrade pip

## Install OS-level packages and misc. tools
## is gcc actually required? 
#RUN apt-get update && apt-get install -y  \
#    build-essential \
#    libxml2-dev \
#    libxslt1-dev \
#    gcc \
#    libc6-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

## we were able to reduce the original list significantly
RUN pip install lxml docopt beautifulsoup4 -U

#### 2021-12: six-1.16.0 wird bereits durch SPARQLWrapper installiert!

## install spacy
## RUN pip install -U spacy  ## latest
## 2023-01-31: re-building environment but make sure we keep the prior version 3.4.1 (latest would be 3.5)
## 2024-07-09: upgrade to current version 3.7.5
RUN pip install spacy==3.7.5

## small model:
RUN python -m spacy download de_core_news_sm
### large model:
RUN python -m spacy download de_core_news_lg
## allegedly more accurate but slower ?
#RUN python -m spacy download de_dep_news_trf  
## after install: validate
RUN python -m spacy validate

#   let's keep iwnlp for now: it provides an additional (not completely useless) lemmatizer
RUN pip install iwnlp
 
RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Vienna /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# set up utf-8 locale (defaults in offical centos/ubuntu images are POSIX)
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

## what's that ? 
ENV PYTHONHASHSEED=101

# Create a non-root user and group with a home directory
USER root
RUN groupadd -g 1000 user
RUN useradd -u 1000 -g 1000 user
RUN find /home/user -exec chown -h 1000 {} \; 
RUN find /home/user -exec chgrp -h 1000 {} \;  

# Switch to the non-root user
USER user

# Set the working directory
WORKDIR /notebooks


