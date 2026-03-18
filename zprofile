# my own .zprofile file
# which contains very few settings. 
# Copyright(C) mamekkoro 2024 all rights reserved

case "${OSTYPE}" in
  darwin*)
    export PATH="$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
    ;;
  linux*)
    export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    ;;
  *)
    export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    ;;
esac

export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"
