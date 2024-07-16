FROM ghcr.io/acdh-oeaw/noske-ubi9/noske:5.71.15-2.225.8-open

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="current Noske run without http - just a shell environment with additional tools " 

# copy to both $HOME and /root (which is the $HOME for root
COPY _bashrc_for_Docker      /home/user/.bashrc
COPY _bashaliases_for_Docker /home/user/.bash_aliases

COPY _bashrc_for_Docker /home/www-data/.bashrc
COPY _bashaliases_for_Docker /home/www-data/.bash_aliases

COPY _bashrc_for_Docker /root/.bashrc
COPY _bashaliases_for_Docker /root/.bash_aliases

USER root

RUN microdnf -y update && \
    microdnf -y install dnf && \
    dnf -y install \
        dnf-plugins-core \
        epel-release \
	procps-ng \
	less \
	make \
	vim \
	wget  \
     	zip \
     	unzip \
	parallel \
	prename \
	cpan \
	perl-App-cpanminus \
	libxml2 \
	libxml2-devel \
	tmux
	
## pass "yes" to the 1st invokation of cpan for supressing cpan's questions for configuration 
RUN     yes '' | cpanm Data::Dumper ; \
	cpanm JSON ; \
	cpanm pp ; \
	cpanm JSON::XS ; \
	cpanm File::BaseDir ; \
	cpanm Moose ; \
	cpanm MooseX::Storage ; \
	cpanm Text::CSV ; \
	cpanm Text::CSV_XS ; \
	cpanm Spreadsheet::ParseExcel ; \
	cpanm Spreadsheet::WriteExcel ; \
	cpanm Spreadsheet::XLSX ; \
	cpanm Switch ; \
	cpanm -f XML::LibXML
	
## replace rename by prename 
RUN ln -s -f /usr/bin/prename /usr/bin/rename

## 1019 is already present in the noske-image!
RUN groupmod --gid 1019 www-data && \
    usermod --gid 1019 --uid 1019 www-data 

RUN groupadd -f -g 100 users

RUN useradd -u 1000 -g 100 -s /bin/bash user
RUN find /home/user -exec chown -h 1000 {} \; 
RUN find /home/user -exec chgrp -h 100  {} \; 

WORKDIR /home/user

# Switch to the non-root user
USER user

# CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
