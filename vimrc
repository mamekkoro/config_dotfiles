set nocompatible
syntax enable
filetype plugin indent on
set whichwrap=b,s,[,],<,>,~
set mouse=


" JSONファイルは常にシンタックスハイライト
autocmd BufRead,BufNewFile *.json set filetype=json
