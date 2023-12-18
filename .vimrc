set nocompatible
set nowrap
set relativenumber
set shell=pwsh

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

map <Space> <Leader>
