# amc-processing

Basic working environments for processing text-data in amc etc. 

## shell

### run + enter
```bash
docker run --name my-shell --rm -it ghcr.io/acdh-oeaw/amc-processing/shell:latest
```

### enter as root
```bash
docker exec -it -u 0:0 my-shell /bin/bash
```

## perl

based on `shell`

```bash
docker run --name my-perl --rm -it ghcr.io/acdh-oeaw/amc-processing/perl:latest
```

