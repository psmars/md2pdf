FROM absps/debian_base:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.4" \
      tw.edu.yuntech.smars.release-date="2020-06-10"
USER root
RUN apt-get update && \
	apt-get install -y \
	texlive-xetex \
	pandoc \
	pandoc-citeproc \
	texlive-fonts-extra \
	fonts-arphic-ukai \
	fonts-arphic-uming \
	ghostscript \
	nano \
	pdftk

COPY examples /root/

COPY dissertation /root/

