# md2pdf

Provides a self-contained environment to work with texts, based on markdown, latex, pandoc, git. `make` is also included to facilitate automation.

Create a directory for your project data: \<your_directory\>. Start the environment with:

`docker run --rm -it --hostname docker -v <your_directory>:/root absps/md2pdf`

Or, if you do not like vim and prefer micro

`docker run --rm -it --hostname docker -v <your_directory>:/root -e EDITOR=micro absps/md2pdf`

If needed, create your ssh credentials (they will be saved in \<your_directory\>).

> ssh-keygen -t rsa -b 4096

If needed, create your git global configuration.

> git config --global user.name "Your Name"
> git config --global user.email "you@server"

Start to work.

