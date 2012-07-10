" general {{{
filetype plugin indent on
set nocompatible " Vim Baby!
set hidden " don't requiring saving when switching between buffers
set backspace=indent,eol,start " allow for more intuitive deletion
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

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" buffer and tab navigation
nmap <M-j> :bp <CR>
nmap <M-k> :bn <CR>
nmap <M-h> :tabp <CR>
nmap <M-l> :tabn <CR>

" add new lines in normal mode
nmap <CR> o<ESC>
nmap <S-CR> O<ESC>

" load current file
nmap <leader>L :source % <CR>

" escape and yank XML
nmap <leader>J :%s/"/\\"/g<CR>ggVGJ^y$u
" }}}
