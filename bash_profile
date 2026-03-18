# ~/.bash_profile: executed by bash for login shells.

umask 022

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LANG=ja_JP.UTF-8


