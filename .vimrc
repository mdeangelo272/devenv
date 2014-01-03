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

let g:netrw_liststyle=3 " treestyle directory exploration
" }}}

" searching {{{
set hlsearch " highlight my search results
set ignorecase " first ignore case
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

"  mappings {{{

" window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" buffer and tab navigation
nmap <M-j> :bp <CR>
nmap <M-k> :bn <CR>
nmap <M-i> :b# <CR>
nmap <M-h> :tabp <CR>
nmap <M-l> :tabn <CR>

" add new lines in normal mode
nmap <CR> o<ESC>
nmap <S-CR> O<ESC>

" load current file
nmap <leader>L :source % <CR>

" escape and yank XML
nmap <leader>J :%s/"/\\"/g<CR>ggVGJ^y$u

" insert mode
imap <M-C> <ESC>
imap <S-tab> todo

" quickly get to the vimrc
nmap <leader>gv :e ~/.vimrc<CR>
nmap <leader>gdv :e ~/dotFiles/.vimrc<CR>
nmap <leader>gs :e ~/.vim/bundle/snipMate-snippets/snippets<CR>
" }}}

" editing {{{
inoremap <C-Space> <C-X><C-O>
" }}}

" {{{ filetype 
  
  autocmd FileType config set ft=xml
  autocmd FileType cs set tabstop=4
  autocmd FileType cs set shiftwidth=4
  autocmd FileType cshtml set ft=html
  autocmd FileType html set tabstop=4
  autocmd FileType html set shiftwidth=4
" }}}

" plugins {{{
let s:vpath='~/.vim/bundle/vundle/'
if isdirectory(expand(s:vpath))
  filetype off                   " required!

  exe 'set rtp+=' . s:vpath
  call vundle#rc()

  " let Vundle manage Vundle
  " required! 
  Bundle 'gmarik/vundle'

  " snipmate and dependencies
  " Bundle 'MarcWeber/vim-addon-mw-utils'
  " Bundle 'tomtom/tlib_vim'
  " Bundle 'mdeangelo272/snipmate-snippets'
  " Bundle 'garbas/vim-snipmate'
  " let g:snipMate['no_match_completion_feedkeys_chars'] = ''

  " (x)html and xml
  Bundle 'tristen/vim-sparkup'
  Bundle 'matchit.zip'
  " Bundle 'ragtag.vim'
  " Bundle 'HtmlHelper'

  " css/color
  Bundle 'chrisbra/color_highlight'
  let g:colorizer_auto_filetype='css,html'

  " Bundle 'CSS-one-line--multi-line-folding'
  " Bundle 'CSSMinister'
  " Bundle 'css_color.vim'
  " Bundle 'colorsel.vim'
  
  " markdown
  Bundle 'hallison/vim-markdown'

  " git
  " Bundle 'tpope/vim-fugitive'
  
  " navigation
  Bundle 'scrooloose/nerdtree'
  " Bundle 'FuzzyFinder'
  " Bundle 'Lokaltog/vim-easymotion'
  " Bundle <command-t>

  " ruby and rails
  " Bundle 'vim-ruby/vim-ruby'
  " Bundle 'tpope/vim-rails.git'

  " tags
  Bundle 'TagList.vim'
  " Bundle 'TagBar.vim' " perhaps should use this instead of TagList

  " misc
  " Bundle 'vim-scripts/dbext.vim'

  filetype plugin indent on     " required!
endif
 " }}}

 " {{{ windows specific 
 command! CMD exec("silent !start")
 " }}}
