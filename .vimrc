set nocompatible
set nowrap
set relativenumber
set autoread

" search
set ignorecase
set incsearch
set hlsearch
set smartcase

filetype plugin on

syntax enable

command! Ps terminal pwsh

map <space> <leader>
map <leader>h :noh<cr>

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
nmap s <plug>(easymotion-overwin-f)
omap s <plug>(easymotion-s)
vmap s <plug>(easymotion-s)

" lightline
set laststatus=2
set noshowmode

" fzf
nnoremap <c-p> :Files<cr>
if has('win32')
    let g:fzf_vim = {}
    let g:fzf_vim.preview_bash = 'C:\Program Files\Git\bin\bash.exe'
endif
