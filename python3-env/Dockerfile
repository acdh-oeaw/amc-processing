FROM ghcr.io/acdh-oeaw/amc-processing/shell:latest

LABEL maintainer="Hannes Pirker <hannes.pirker@oeaw.ac.at>" \
      version="1.0" \
      description="A python environment"

## ??? seems to be necessary because shell-image ends with USER user ???
USER root

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y clean
 
# Make python/pip predictable
RUN ln -s /usr/bin/python3 /usr/local/bin/python

WORKDIR /home/user/python_setup

# Copy requirements first (better layer caching)
COPY requirements4dedup.txt .

RUN pip install --no-cache-dir -r requirements4dedup.txt

# Copy your code
# COPY . .

# Switch to the non-root user
USER user

WORKDIR /home/user

# Default command
# CMD ["python", "add_metadata2vert.py", "--help"]

