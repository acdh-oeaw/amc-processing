FROM ghcr.io/acdh-oeaw/amc-processing/shell:latest

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="A perl environment"

## ??? seems to be necessary because shell-image ends with USER user ???
USER root

RUN apt-get -y update && \
apt-get install -y libxml2-dev && \
apt-get install -y libxslt-dev && \
apt-get install -y libgdbm-dev && \
apt-get install -y zlib1g-dev && \
apt-get install -y libexpat1-dev && \
apt-get install -y perl-doc && \
apt-get install -y libstring-diff-perl 

RUN apt-get -y update && \
cpanm  --mirror https://cpan.metacpan.org Archive::SevenZip && \
cpanm Archive::Tar && \
cpanm Archive::Zip && \
cpanm CHI::Memoize && \
cpanm Cpanel::JSON::XS  && \
cpanm Compress::Raw::Lzma && \
cpanm Data::Dumper && \
cpanm Data::Dumper::Simple && \
cpanm Date::Calc   && \
cpanm Date::Time && \
cpanm Digest::MD5 && \
cpanm Encoding::FixLatin && \
cpanm Excel::Writer::XLSX   && \
cpanm Expect && \
cpanm File::Basename && \
cpanm File::Copy && \
cpanm File::Find::utf8 && \
cpanm File::Path && \
cpanm File::Slurp && \
cpanm File::Slurper && \
cpanm File::Spec && \
cpanm HTML::Entities  && \
cpanm HTML::Escape   && \
cpanm IO::Compress::Base && \
cpanm IO::Compress::Bzip2 && \
cpanm IO::Uncompress::Bunzip2 && \
cpanm IO::Compress::Xz && \
cpanm IO::Uncompress::UnXz && \
cpanm IO::Stty && \
cpanm IO::Zlib && \
cpanm IPC::System::Simple && \
cpanm LWP::UserAgent && \
cpanm Math::Roman && \
cpanm Moose  && \
cpanm MooseX && \
cpanm MooseX::ClassAttribute && \
cpanm Readonly && \
cpanm REST::Client && \
cpanm Scalar::Util && \
cpanm Set::Scalar && \
cpanm Spreadsheet::ParseExcel   && \
cpanm Spreadsheet::ParseXLSX   && \
cpanm Spreadsheet::Read   && \
cpanm Spreadsheet::ReadSXC   && \
cpanm Spreadsheet::WriteExcel   && \
cpanm Switch  && \
cpanm Text::CSV && \
cpanm Text::CSV::Hashify  && \
cpanm Text::CSV::Slurp && \
cpanm Text::CSV_XS && \
cpanm Text::Unidecode && \
cpanm Tie::IxHash && \
cpanm Time::HiRes && \
cpanm Time::JulianDay && \
cpanm XML::Code && \
cpanm XML::CSV  && \
cpanm XML::Generator && \
cpanm XML::LibXML && \
cpanm XML::LibXML::PrettyPrint && \
cpanm XML::Rabbit && \
cpanm XML::Rabbit::Root && \
cpanm XML::RegExp && \
cpanm XML::Simple && \
cpanm XML::Smart && \
cpanm XML::Tidy && \
cpanm XML::Twig && \
cpanm XML::Writer && \
cpanm YAML

### RDF::Query ist (only?) required in dbnary-utils
### 2025-01: cpanm RDF Query failed due to 2 failed tests in dependency Module::Pluggable 
###          Therefore for now force installation of Module::Pluggable
RUN cpanm --force Module::Pluggable && \
cpanm RDF::Query && \
cpanm RDF::Simple && \
cpanm RDF::Trine && \
cpanm RDF::Trine::Store::DBI::SQLite 

## FAILED for the FOLLOWING: 
## cpanm Inline::Python 
## cpanm  RDF::Converter::CSV
 
##  /home/user/.cpanm/work is only used during build and can be deleted (200+ MB)
RUN rm -rf /home/user/.cpanm/work

## remove user 'user' before injecting it again / existing entry for user has to be removed from /etc/shadow with sed 
#RUN sed -i '/^user:\w/d' /etc/shadow && \
#userdel user
## User user does not exist if image is build without docker-tools

# Switch to the non-root user
USER user

WORKDIR /home/user

# CMD ["bash", "-c", "while : ; do sleep 600 ;done"]
