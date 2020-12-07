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
	libatomic1 \
	nano \
	zlib1g-dev \
	pdftk

COPY examples /usr/share/absps/examples
COPY config/install_md2pdf /usr/share/absps/config/install_md2pdf

RUN chmod 0700 /usr/share/absps/config/install_md2pdf

RUN cabal update && \
	cabal install pandoc-2.10 && \
	cabal install pandoc-citeproc && \
	cabal install pandoc-crossref

RUN	mv /root/.cabal/bin/pandoc /usr/local/bin/ && \
	mv /root/.cabal/bin/pandoc-citeproc /usr/local/bin/ && \
	mv /root/.cabal/bin/pandoc-crossref /usr/local/bin/ && \
	git config --global filter.lfs.required true && \
	git config --global filter.lfs.clean "git-lfs clean -- %f" && \
	git config --global filter.lfs.smudge "git-lfs smudge -- %f" && \
	git config --global filter.lfs.process "git-lfs filter-process"

#	rm -rf /root/.cabal && \
#	apt-get remove -y cabal-install && \
#	apt-get remove -y cpp && \
#	apt autoremove -y && \

WORKDIR /root

CMD /usr/share/absps/config/install && \
	/usr/share/absps/config/install_md2pdf && \
	/usr/bin/zsh

