
" general {{{
filetype plugin indent on
set nocompatible " Vim Baby!
set hidden " don't requiring saving when switching between buffers
set backspace=indent,eol,start " allow for more intuitive deletion
set cm=blowfish " encrypt files using the blowfish algorithm
set foldmethod=marker
" }}} 

" set clipboard=unnamedplus " copy and paste from the system clipboard (Linux - requires vim 7.4+)

" copy and paste to a persistent buffer for multiple terminal sessions
vmap <C-y> :'<,'>w! ~/.vim_clip<CR>
nmap <C-y> :.w! ~/.vim_clip<CR>
nmap <C-p> :r ~/.vim_clip<CR>
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

" netrw configurations {{{
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" }}}

"  mappings {{{ 
" window resizing
nmap <C-w><C-j> :resize -10 <CR>
nmap <C-w><C-k> :resize +10 <CR>
nmap <C-w><C-h> :vertical resize +10 <CR>
nmap <C-w><C-l> :vertical resize -10 <CR>

" buffer and tab navigation
nmap <M-j> :bp <CR>
nmap <M-k> :bn <CR>
nmap <M-i> :b# <CR>
nmap <M-h> :tabp <CR>
nmap <M-l> :tabn <CR>

" add new lines in normal mode
" nmap <CR> o<ESC>
" nmap <S-CR> O<ESC>

" reload vimrc
nmap <leader>r :source ~/.vimrc <CR>

" load current file
nmap <leader>L :source % <CR>

" escape and yank XML
nmap <leader>J :%s/"/\\"/g<CR>ggVGJ^y$u

" insert mode
imap <M-C> <ESC>
imap <S-tab> todo

" quickly get to the vimrc
nmap <leader>gv :e ~/.vimrc<CR>
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
  autocmd FileType html set tabstop=2
  autocmd FileType html set shiftwidth=2
  
  autocmd FileType python set tabstop=4
  autocmd FileType python set shiftwidth=4
  autocmd FileType python highlight OverLength ctermbg=red ctermfg=black | match OverLength /\%80v.\+/
" }}}

" plugins {{{
let s:vpath='~/.vim/bundle/Vundle.vim/'
if isdirectory(expand(s:vpath))
  filetype off " required for Vundle

  " set the runtime path to include Vundle and initialize
  exe 'set rtp+=' . s:vpath
  call vundle#begin()

  " required: let Vundle manage Vundle
  Plugin 'VundleVim/Vundle.vim'

  " markup (XML, HTML, JSON, etc)
  " ******
  " Plugin 'hallison/vim-markdown'
  " Plugin 'tristen/vim-sparkup'
  " Plugin 'matchit.zip'
  " Plugin 'ragtag.vim'
  " Plugin 'HtmlHelper'

  " css/color
  " ******
  " Plugin 'chrisbra/color_highlight'
  "   let g:colorizer_auto_filetype='css,html'
  " Plugin 'CSS-one-line--multi-line-folding'
  " Plugin 'CSSMinister'
  " Plugin 'css_color.vim'
  " Plugin 'colorsel.vim'
  
  " python
  " ******
  Plugin 'davidhalter/jedi-vim'
  Plugin 'tmhedberg/SimpylFold'
  " Plugin 'vim-syntastic/syntastic'
  " Plugin 'nvie/vim-flake8'

  " ruby and rails
  " ******
  " Plugin 'vim-ruby/vim-ruby'
  " Plugin 'tpope/vim-rails.git'

  " tags
  " ******
  " Plugin 'TagList.vim'
  " Plugin 'TagBar.vim' " perhaps should use this instead of TagList
   
  " snipmate and dependencies
  " ******
  " Plugin 'MarcWeber/vim-addon-mw-utils'
  " Plugin 'tomtom/tlib_vim'
  " Plugin 'mdeangelo272/snipmate-snippets'
  " Plugin 'garbas/vim-snipmate'
  " let g:snipMate['no_match_completion_feedkeys_chars'] = ''

  " git
  " ******
  " Plugin 'tpope/vim-fugitive'
  
  " navigation
  " ******
  " Plugin 'tpope/vim-vinegar'
  " Plugin 'scrooloose/nerdtree'
  "   " configure for old school systems that don't support UTF-8
  "   let g:NERDTreeDirArrowExpandable = '-'
  "   let g:NERDTreeDirArrowCollapsible = '|'
  " Plugin 'L9' " required for FuzzyFinder
  " Plugin 'vim-scripts/FuzzyFinder'
  " Plugin 'Lokaltog/vim-easymotion'
  " Plugin <command-t>

  " databases
  " Plugin 'vim-scripts/dbext.vim'

  call vundle#end()            " required
  filetype plugin indent on     " required!
endif
 " }}}

 " {{{ windows specific 
 command! CMD exec("silent !start")
 " }}}
