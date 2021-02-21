export LANG=ja_JP.UTF-8

if [ ! -f ~/.colorrc ]; then
	dircolors -p > ~/.colorrc
fi


if [ "$(uname)" = 'Darwin' ]; then
#    export LSCOLORS=xbfxcxdxbxegedabagacad
    alias ls='ls -G'
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'
fi
alias la="ls -aF "
alias ll="ls -la "
alias less="less -X "
PS1='[\u@\h:\w]\$ '




