FROM absps/debian_base:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.9" \
      tw.edu.yuntech.smars.release-date="2020-12-06"
USER root
RUN apt-get update && \
	apt-get install -y \
	git-lfs \
	texlive-xetex \
	cabal-install \
	texlive-fonts-extra \
	fonts-arphic-ukai \
	fonts-arphic-uming \
	ghostscript \
	nano \
	zlib1g-dev \
	pdftk

COPY examples /usr/share/absps/examples
COPY config/install_md2pdf /usr/share/absps/config/install_md2pdf

RUN chmod 0700 /usr/share/absps/config/install_md2pdf

RUN cabal update && \
	cabal install pandoc-crossref && \
	mv /root/.cabal/bin/pandoc /usr/local/bin/ && \
	mv /root/.cabal/bin/pandoc-crossref /usr/local/bin/ && \
	rm -rf /root/.cabal && \
	apt-get remove cabal-install && \
	git config --global filter.lfs.required true && \
	git config --global filter.lfs.clean "git-lfs clean -- %f" && \
	git config --global filter.lfs.smudge "git-lfs smudge -- %f" && \
	git config --global filter.lfs.process "git-lfs filter-process"

WORKDIR /root

CMD /usr/share/absps/config/install && \
	/usr/share/absps/config/install_md2pdf && \
	/usr/bin/zsh

