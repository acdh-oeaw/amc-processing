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


## unclear: we do not want to have the registry-files in the repo 
## currently we keep them on acdh-resources and copy them manually to $MANATEE_REGISTRY :-(
### copy the registry_files
#COPY registry  	/var/lib/manatee/registry 


USER root

RUN microdnf -y update && \
    microdnf -y install dnf && \
    dnf -y install \
	cpan \
	diffutils \
        dnf-plugins-core \
        epel-release \
        git \
	less \
	libxml2 \
	libxml2-devel \
	make \
	parallel \
	perl-App-cpanminus \
	prename \
	procps-ng \
     	tar \
     	unzip \
	vim \
	wget  \
     	zip
	
## provisions for tmux 	
RUN dnf install -y crypto-policies-scripts && \
  update-crypto-policies --set DEFAULT:SHA1 && \
  dnf install -y http://galaxy4.net/repo/galaxy4-release-9-current.noarch.rpm && \
  dnf install -y tmux 
	
## pass "yes" to the 1st invokation of cpan for supressing cpan's questions for configuration 
RUN     yes '' | \
	cpanm Data::Dumper ; \
	cpanm File::BaseDir ; \
	cpanm JSON ; \
	cpanm JSON::XS ; \
	cpanm Moose ; \
	cpanm MooseX::Storage ; \
	cpanm Spreadsheet::ParseExcel ; \
	cpanm Spreadsheet::WriteExcel ; \
	cpanm Spreadsheet::XLSX ; \
	cpanm Switch ; \
	cpanm Text::CSV ; \
	cpanm Text::CSV_XS ; \
	cpanm pp ; \
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
