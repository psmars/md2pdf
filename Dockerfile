FROM absps/debian_base:latest
MAINTAINER Pierre SMARS
LABEL tw.edu.yuntech.smars.version="0.13" \
      tw.edu.yuntech.smars.release-date="2022-03-19"
USER root

# install software available in debian repository
# texlive fonts take a lot of space (33% of the installation) !! Maybe you do not need them all
RUN apt-get update && \
	apt-get install -y \
	git-lfs \
	texlive-xetex \
	texlive-fonts-extra \
	fonts-arphic-ukai \
	fonts-arphic-uming \
	cabal-install \
	ghostscript \
	libatomic1 \
	nano \
	zlib1g-dev \
	pdftk

COPY examples /usr/share/absps/examples
COPY config/install_md2pdf /usr/share/absps/config/install_md2pdf

RUN chmod 0700 /usr/share/absps/config/install_md2pdf

# pandoc and pandoc tools installation
RUN cabal update && \
	cabal install pandoc-2.10 && \
	cabal install pandoc-citeproc && \
	cabal install pandoc-crossref

# cleaning pandoc and pandoc tools installation
RUN	ln -s $(readlink -f /root/.cabal/bin/pandoc) /usr/local/bin/ && \
	ln -s $(readlink -f /root/.cabal/bin/pandoc-citeproc) /usr/local/bin/ && \
	ln -s $(readlink -f /root/.cabal/bin/pandoc-crossref) /usr/local/bin/ && \
	mkdir /usr/local/share/cabal && \
	apt-get remove -y cabal-install && \
	apt-get remove -y cpp && \
	apt autoremove -y

# git basic configuration
RUN	git config --global filter.lfs.required true && \
	git config --global filter.lfs.clean "git-lfs clean -- %f" && \
	git config --global filter.lfs.smudge "git-lfs smudge -- %f" && \
	git config --global filter.lfs.process "git-lfs filter-process"

WORKDIR /root

CMD /usr/share/absps/config/install && \
	/usr/share/absps/config/install_md2pdf && \
	/usr/bin/zsh

