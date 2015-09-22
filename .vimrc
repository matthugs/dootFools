
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-quote'
Plugin 'pangloss/vim-javascript'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin '2072/vim-syntax-for-PHP'
call vundle#end()
filetype plugin indent on

syntax on
set expandtab
set nowrap
" the default
set shiftwidth=4 tabstop=4 softtabstop=4
" exceptions to the above general rule
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

" related to vim-textobj-quote
" can be easily enabled for other types of things
autocmd FileType markdown call textobj#quote#init() 

" extremely common shift-misspellings I make, automatically corrected
cmap Tabe tabe
