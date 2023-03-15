
umask 022


export PATH=$HOME/bin:.:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export NLSPATH=/usr/local/man:$NLSPATH
export LD_LIBRARY_PATH=/usr/X11/lib

#export PATH="$HOME/.linuxbrew/bin:$PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
#export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"


MANPATH=$MANPATH:/usr/local/man
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH MANPATH DYLD_LIBRARY_PATH 

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


case ${OSTYPE} in
	linux*)
		eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
		;;
	darwin*)
		eval $(/home/homebrew/bin/brew shellenv)
		;;



eval "$(pyenv init -)"
