set nocompatible
set nowrap
set relativenumber
set shell=pwsh
set hlsearch
set incsearch

map <space> <leader>
map <leader>h :noh<CR>

call plug#begin()
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f)
omap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)

" lightline
set laststatus=2
set noshowmode
