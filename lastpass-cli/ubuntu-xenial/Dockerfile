# Dockerfile for build environment for ubuntu xenial

FROM ubuntu:xenial-20180228

# Set the env variables to non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -q

# Installing the build environment
## lastpass required packages
RUN apt-get install -y openssl libcurl4-openssl-dev libxml2 libssl-dev libxml2-dev pinentry-curses xclip cmake build-essential pkg-config
## lastpass docs required packages
RUN apt-get install -y asciidoc xsltproc
## packager
RUN apt-get install -y sudo git-buildpackage dh-make
## gpg
RUN apt-get -y install gnupg2

COPY devscripts.conf /etc/devscripts.conf

RUN useradd -ms /bin/bash builder

USER builder
