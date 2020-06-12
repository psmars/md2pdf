FROM absps/debian_base:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.7" \
      tw.edu.yuntech.smars.release-date="2020-06-12"
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

COPY examples /usr/share/absps/examples
COPY dissertation /usr/share/absps/dissertation
COPY config/install_md2pdf /usr/share/absps/config/install_md2pdf

RUN chmod 0700 /usr/share/absps/config/install_md2pdf
RUN /usr/share/absps/config/install
RUN /usr/share/absps/config/install_md2pdf

WORKDIR /root

CMD /usr/bin/zsh

