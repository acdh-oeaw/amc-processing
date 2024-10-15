FROM python:3.12-bullseye

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
COPY _bashrc_for_Docker $HOME/.bashrc
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
	tmux \
    && apt-get clean

## pip was complaining that it was not the latest version
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
RUN pip install spacy==3.7.5

## install models
RUN python -m spacy download de_core_news_sm
RUN python -m spacy download de_core_news_lg 
RUN python -m spacy validate 

#   let's keep iwnlp for now: it provides an additional (not completely useless) lemmatizer
RUN pip install iwnlp
 
# set up utf-8 locale (defaults in offical centos/ubuntu images are POSIX)
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
ENV LANGUAGE en_US.UTF-8
# ENV LC_ALL en_US.UTF-8

## what's that ? 
ENV PYTHONHASHSEED 101


WORKDIR /notebooks

CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
