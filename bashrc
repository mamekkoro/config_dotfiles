# ~/.bashrc: executed by bash for interactive shells.

if [ ! -f ~/.colorrc ]; then
  dircolors -p > ~/.colorrc
fi

eval "$(dircolors ~/.colorrc)"
alias ls='ls --color=auto -F'
alias la='ls -a'
alias ll='ls -l'

alias less='less -X'

PS1='[\u@\h:\w]\$ '
