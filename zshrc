# just a little sophisticated zshrc
# License : MIT
# modified by mamekkoro(C)
source $HOME/.zprofile
umask 022
########################################
# environmental variable
export PATH=$HOME/bin:.:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"
export LESSCHARSET=utf-8
export NLSPATH=/usr/local/man:$NLSPATH
export LD_LIBRARY_PATH=/usr/X11/lib


MANPATH=$MANPATH:/usr/local/man
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH
export PATH MANPATH DYLD_LIBRARY_PATH




# enable colors
autoload -Uz colors
colors

# enable emacs like keybinds
bindkey -e

# configuration of history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# prompt
PROMPT="%F{yellow}[%n@%m:%F{blue}%~%f]%f%# "



########################################
# completion
# enable comletion
autoload -Uz compinit
compinit

# match lower chars to upper chars 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# no completion after ../ 
zstyle ':completion:*' ignore-parents parent pwd ..

# completion of command name after sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# completion of process name after ps 
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'




########################################
# options
# enable japanese file names
setopt print_eight_bit

# disable beep
setopt no_beep

# disable flow control 
setopt no_flow_control

# no exit after Ctrl+D
#setopt ignore_eof

# comment out after '#'
setopt interactive_comments

# move directoriy only with directory-name 
setopt auto_cd

# pushd with cd 
setopt auto_pushd
# pushd ignore duplicate dirs
setopt pushd_ignore_dups

# share history with zshs
setopt share_history

# ignore dupulicate command 
setopt hist_ignore_all_dups

# remove command begins with space for history
setopt hist_ignore_space

# remove blanks for history
setopt hist_reduce_blanks

# enable extended glob
setopt extended_glob

########################################
# key bindings

# when serch with ^R, enables '*' 
bindkey '^R' history-incremental-pattern-search-backward

########################################
# aliases
alias la='ls -a'
alias ll='ls -l'

alias xless='less -X'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# enable aliases after sudo
alias sudo='sudo '

# global aliases
alias -g L='| less'
alias -g G='| grep'

if [[ $(command -v exa) ]]; then
  alias e='exa --icons'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons'
  alias la=ea
  alias ee='exa -aal --icons'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
fi


########################################
# setting for other OSs 
case ${OSTYPE} in
    darwin*)
        #Mac
        export CLICOLOR=1
	#Source-hilight with less
	export LESSOPEN="| /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s"
	export LESS='-R'
        alias ls='ls -G -F'
	alias toomsep='print "found eset processes using port number:`sudo lsof -n -i TCP |grep eset |cut -d" " -f 2 |uniq`"'
        ;;
    linux*)
        #Linux
	#Source-hilight with less
	export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
	export LESS='-R'
        alias ls='ls -F --color=auto'
	if [[ -f /etc/zsh_command_not_found ]] then
		source /etc/zsh_command_not_found
	fi
	;;
esac



