syntax on

set number
set ruler

set t_Co=256
set cursorline
colorscheme onehalfdark

" Operation can work with system clipboard
set clipboard=unnamed

set incsearch
set hlsearch

set autoindent
set cindent

set expandtab
set softtabstop=4
set shiftwidth=4

set relativenumber

set wrap

set backspace=indent,eol,start

" apply ~/.vim/cpp.vim setting.
autocmd FileType cpp source ~/.vim/filetype/cpp.vim
" apply ~/.vim/c.vim setting.
autocmd FileType c source ~/.vim/filetype/c.vim
" apply ~/.vim/py.vim setting.
autocmd FileType python source ~/.vim/filetype/py.vim
" apply ~/.vim/go.vim setting.
autocmd FileType go source ~/.vim/filetype/go.vim

" delimitMate indent setting.
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" NERDcommenter setting.
let mapleader=","
set timeout timeoutlen=1500

" vim-template setting.
let g:templates_no_builtin_templates=1
let g:templates_directory='~/.vim/template'

" set mouse-select and mouse-scroll.
set mouse=a

set modelines=0
set nomodeline
