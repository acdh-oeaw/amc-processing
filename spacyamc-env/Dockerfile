FROM acdhch/noske:5.71.9-2.225.8-open
# FROM registry.gitlab.com/acdh-oeaw/docker-tools-environments-priv/acdhch/noske:5.52.9-2.205.1-open
MAINTAINER Hannes Pirker hannes.pirker@oeaw.ac.at
# copy to both $HOME and /root (which is the $HOME for root
COPY _bashrc_for_Docker $HOME/.bashrc
COPY _bashrc_for_Docker /root/.bashrc

USER root

RUN yum -y makecache && yum -y install \
	less \
	make \
	vim \
	wget  \
	curl \
     	zip \
     	unzip \
	parallel \
	prename \
	htop \
	perl-CPAN.noarch \
	perl-Data-Dumper \
	perl-JSON.noarch \
	perl-pp.noarch \
	perl-JSON-XS.x86_64 \
	perl-File-BaseDir.noarch \
	perl-Moose.x86_64 \
	perl-Text-CSV.noarch \
	perl-Text-CSV_XS.x86_64 \
	perl-Spreadsheet-ParseExcel.x86_64 \
	perl-Spreadsheet-WriteExcel.noarch \
	perl-Spreadsheet-XLSX.noarch \
	perl-Switch.noarch \
	perl-XML-LibXML

## ln -s -f /usr/bin/prename /usr/bin/rename

## manually add: 
## cpan MooseX::Storage
			
#@INJECT_USER@

WORKDIR /home/user

CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
