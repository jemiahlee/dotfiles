dotfiles
========

Configuration for my command line.

## Setup

### install.sh

This is really all you need to run in order to get my configuration up
and running in your home directory. From a command-line in either Linux
or Mac OSX, you should just be able to run:

```
./install.sh
```

And it should do everything it does.

### Google Drive configuration

To allow me to have files that are private, and to allow you to override
any of the files that are present in this repository, the installation
script will attempt to link things from `${HOME}/Google Drive/dotfiles`
in the corresponding directories.

Likewise, the `.bash_profile` that is included here will look to source
any files in `${HOME}/Google Drive/dotfiles`.
