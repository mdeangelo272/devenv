" general {{{
set nocompatible " Vim Baby!
set hidden " don't requiring saving when switching between buffers
set backspace=indent,eol,start " allow for more intuitive deletion
filetype plugin indent on
set clipboard=unnamed " copy and paste from the system clipboard
set cm=blowfish " encrypt files using the blowfish algorithm
set foldmethod=marker
" }}} 

" view {{{
color desert
syntax on

set ruler " show the cursor location
set showcmd " show incomplete cmds down at the bottom
set showmode " show current mode down at the bottom
set number " show line numbers

set wildmenu " use the wildmenu for tab complete in Ex modes
set guioptions+=c " don't allow popup windows, use the console for dialogs
set guioptions-=T " don't show the toolbar
set guioptions-=m " don't show the menubar

"let g:netrw_liststyle=3 " treestyle directory exploration
" }}}

" searching {{{
set hlsearch " highlight my search results
set smartcase " ignore my case unless I specify caps
set noincsearch " start searching when I complete my pattern
set nowrapscan " don't wrap the search to the top of the file
" }}}

" indentations {{{
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
" }}}

" mappings {{{

" buffer and tab navigation
nmap <C-j> :bp <CR>
nmap <C-k> :bn <CR>
nmap <C-h> :tabp <CR>
nmap <C-l> :tabn <CR>

" window navigation
nmap <M-j> <C-w>j
nmap <M-k> <C-w>k
nmap <M-h> <C-w>h
nmap <M-l> <C-w>l

" add new lines in normal mode
nmap <CR> o<ESC>
nmap <S-CR> O<ESC>

nmap <leader>L :source % <CR>
map R :%d<CR>:r!
" }}}
