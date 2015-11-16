
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
Plugin 'sgur/vim-textobj-parameter'
Plugin 'reedes/vim-textobj-quote'
Plugin 'pangloss/vim-javascript'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin '2072/vim-syntax-for-PHP'
Plugin 'gtags.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'joonty/vdebug.git'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on

syntax on
set expandtab
set nowrap
" the default
set shiftwidth=4 tabstop=4 softtabstop=4
" exceptions to the above general rule
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType php autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType html.mustache setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal noexpandtab

" related to vim-textobj-quote
" can be easily enabled for other types of things
autocmd FileType markdown call textobj#quote#init() 

" extremely common shift-misspellings I make, automatically corrected
cmap Tabe tabe

let g:vdebug_options= {
    \    "port" : 9001,
    \    "path_maps" : {"/wayfair/mnt/codebase/WEBPHP147/php/" : "/home/matt/codebase/php/"},
    \
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : '',
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}
