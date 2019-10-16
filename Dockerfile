# Builds the image xvilo/plovr-base
FROM openjdk:8

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

# Install deps
RUN apt update && apt install -y \
  git \
  ant \
  gcc \
  python \
  python-dev \
  build-essential \
  libssl-dev \
  nodejs

# Build BUCK
RUN git clone https://github.com/facebook/buck.git /buck/
WORKDIR /buck
RUN ant
RUN ln -sf /buck/bin/buck /usr/bin/
