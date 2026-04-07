# just a little sophisticated zshrc
# License: MIT
# modified by mamekkoro(C)

umask 022

########################################
# interactive shell basics

# enable colors
autoload -Uz colors
colors

# enable emacs-like keybinds
bindkey -e

########################################
# history

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

########################################
# prompt

PROMPT="%F{yellow}[%n@%m:%F{blue}%~%f]%f%# "

########################################
# completion

autoload -Uz compinit
compinit

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# no completion after ../
zstyle ':completion:*' ignore-parents parent pwd ..

# completion of command name after sudo
zstyle ':completion:*:sudo:*' command-path \
  /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# completion of process name after ps
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# options

setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

########################################
# key bindings

# when searching with ^R, enables '*'
bindkey '^R' history-incremental-pattern-search-backward

########################################
# aliases

alias xless='less -X'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias tma='tmux new -A -s main'
# enable aliases after sudo
alias sudo='sudo '

# global aliases
alias -g L='| less'
alias -g G='| grep'

########################################
# base aliases

alias la='ls -a'
alias ll='ls -l'

########################################
# Rust / modern CLI tools if available

# eza (ls replacement)
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias l='eza --icons'
  alias la='eza -a --icons'
  alias ll='eza -al --icons'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lta='eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
fi

# bat / batcat (cat replacement)
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
  alias b='bat'
elif command -v batcat >/dev/null 2>&1; then
  alias cat='batcat'
  alias b='batcat'
fi

# fd / fdfind
if command -v fd >/dev/null 2>&1; then
  alias f='fd'
elif command -v fdfind >/dev/null 2>&1; then
  alias f='fdfind'
fi

# ripgrep
if command -v rg >/dev/null 2>&1; then
  alias grep='rg'
  alias r='rg'
fi

# tokei
if command -v tokei >/dev/null 2>&1; then
  alias codecount='tokei'
fi

# procs
if command -v procs >/dev/null 2>&1; then
  alias ps='procs'
fi

########################################
# OS specific settings

case "${OSTYPE}" in
  darwin*)
    export CLICOLOR=1
    export LESS='-R'
    ;;
  linux*)
    export LESS='-R'
    if [[ -f /etc/zsh_command_not_found ]]; then
      source /etc/zsh_command_not_found
    fi
    ;;
esac

########################################
# source-highlight with less, if available

if [[ -x /usr/share/source-highlight/src-hilite-lesspipe.sh ]]; then
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
elif [[ -x /usr/local/share/source-highlight/src-hilite-lesspipe.sh ]]; then
  export LESSOPEN="| /usr/local/share/source-highlight/src-hilite-lesspipe.sh %s"
fi



