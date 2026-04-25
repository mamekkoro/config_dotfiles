set nocompatible
syntax enable
filetype plugin indent on
set whichwrap=b,s,[,],<,>,~
set mouse=


" JSONファイルは常にシンタックスハイライト
autocmd BufRead,BufNewFile *.json set filetype=json


" ------------------------------------------------------------
" Insert mode: Cocoa/Emacs-like small cursor movements
" ------------------------------------------------------------
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

" Kill to end of line, similar to Cocoa/Emacs C-k
inoremap <C-k> <C-o>D
