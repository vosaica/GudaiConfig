set nocompatible
set nowrap
set relativenumber
set autoread
set mouse=a

set termguicolors
set t_Co=256

" search
set ignorecase
set incsearch
set hlsearch
set smartcase

filetype plugin on

syntax enable

if has('win32')
    command! Ps terminal ++close ++type=conpty pwsh
    command! PsFull terminal ++close ++type=conpty ++curwin pwsh
else
    command! Ps terminal ++close pwsh
    command! PsFull terminal ++close ++curwin pwsh
endif

map <space> <leader>
map <leader>h :noh<cr>

call plug#begin()
Plug 'bkad/CamelCaseMotion'
Plug 'cocopon/iceberg.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vimpostor/vim-lumen'
call plug#end()

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" iceberg.vim
colorscheme iceberg

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <plug>(easymotion-overwin-f)
omap s <plug>(easymotion-s)
vmap s <plug>(easymotion-s)

" lightline
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'iceberg' }

" fzf
nnoremap <c-p> :Files<cr>
if has('win32')
    let g:fzf_vim = {}
    let g:fzf_vim.preview_bash = 'C:\Program Files\Git\bin\bash.exe'
endif

" vim-lumen
" au User LumenLight let g:terminal_ansi_colors = [
"     \ '#1F2428', '#EA4A5A', '#7FF9A4', '#FFA333',
"     \ '#489DFF', '#A175F1', '#0EDEFA', '#F7FAFF',
"     \ '#454647', '#F97583', '#B1FFBC', '#FFC073',
"     \ '#79B8FF', '#B392F0', '#79EFFF', '#DEE1E6'
"     \]
" au User LumenDark let g:terminal_ansi_colors = [
"     \ '#1F2428', '#EA4A5A', '#7FF9A4', '#FFA333',
"     \ '#489DFF', '#A175F1', '#0EDEFA', '#F7FAFF',
"     \ '#454647', '#F97583', '#B1FFBC', '#FFC073',
"     \ '#79B8FF', '#B392F0', '#79EFFF', '#DEE1E6'
"     \]
