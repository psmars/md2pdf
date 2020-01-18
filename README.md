# md2pdf

Provide a self-contained environment to work with texts, based on markdown, latex, git.

Start the environment with:

`docker run --rm -it --hostname docker -v <your_directory>:/root absps/md2pdf`

Or, if you do not like vim and prefer nano

`docker run --rm -it --hostname docker -v <your_directory>:/root -e EDITOR=nano absps/md2pdf`

If needed, create your ssh credentials (they will be saved in \<your_directory\>).

If needed, create your git global configuration.

Start to work.

