FROM absps/debian:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.2-beta" \
      tw.edu.yuntech.smars.release-date="2020-01-15"
USER root
RUN apt-get update && \
	apt-get install -y \
	texlive-xetex \
	pandoc \
	pandoc-citeproc \
	texlive-fonts-extra \
	fonts-arphic-ukai \
	fonts-arphic-uming \
	ghostscript

COPY examples /root/

#RUN apt-get install -y pdftk
