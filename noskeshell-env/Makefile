SHELL=bash

## here you only set the TAG - all the rules are included from ../test_common.mk

T=noskeshell 

include ../test_common.mk 

### overwrite rule: user www-data !
## enter
e:	
	docker exec -it -u www-data test_$T /bin/bash

