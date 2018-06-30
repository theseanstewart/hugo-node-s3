FROM node:latest
MAINTAINER Sean Stewart <https://github.com/theseanstewart>

ARG HUGO_VERSION=0.42.1
ARG HUGO_REPO_URL=https://github.com/gohugoio/hugo/releases/download
ARG HUGO_ARCHIVE=hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

# Install dependencies
RUN apt-get update && apt-get install -y python3-pip

# Update pip
RUN pip3 install awscli

RUN curl -Ls ${HUGO_REPO_URL}/v${HUGO_VERSION}/${HUGO_ARCHIVE} -o /tmp/hugo.tar.gz \
    && tar xf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo*
