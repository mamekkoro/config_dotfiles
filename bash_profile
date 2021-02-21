# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

umask 022
source ~/.bashrc


export PATH=$HOME/bin:.:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export NLSPATH=/usr/local/man:$NLSPATH
export LD_LIBRARY_PATH=/usr/X11/lib


MANPATH=$MANPATH:/usr/local/man
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export PATH MANPATH DYLD_LIBRARY_PATH 


