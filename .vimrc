"Some things shamelessly stolen from Janus.

"" General Mappings (Normal, Visual, Operator-pending)

"" Basic Setup
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set background=dark   " Sets background color
set mouse=a           " Enables mouse
syntax enable         " Turn on syntax highlighting allowing local overrides

"" Whitespace
set nowrap                        " don't wrap lines
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"Write the old file out when switching between files.
set autowrite

"Want a different map leader than \
let mapleader = ","

"Switch between buffers without saving
set hidden

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show line numbers
set number

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2
set noshowmode

"Prefer a slightly higher line height
set linespace=3

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Saves time; maps the spacebar to colon
nmap <space> :

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-w> ddkP
nmap <S-w> ddp

"Bubble multiple lines
vmap <C-w> xkP`[V`]
vmap <S-w> xp`[V`]

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Yank text to the OS X clipboard
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>yy "+yy

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

"" Backup and swap files
set backupdir=~/.vim/.tmp//    " where to put backup files.
set directory=~/.vim/.tmp//    " where to put swap files.

"" Wildmenu (tab command completion)
set wildmenu
set wildmode=list:longest,full

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Clear last search
nnoremap <CR> :noh<CR><CR>

" We Vundlin'
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'natew/ftl-vim-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'skammer/vim-css-color'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails.git'
Bundle 'flazz/vim-colorschemes'
Bundle 'closetag.vim'
Bundle 'godlygeek/csapprox'
Bundle 'Lokaltog/powerline'
filetype plugin indent on

" Plugin stuff below here:

" The colors, Duke, the colors
colorscheme molokai

"Powerline stuff
set t_Co=256
let g:Powerline_symbols = 'fancy'
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"NERDTree stuff
map <Leader>n :NERDTreeToggle<CR>

" Load Drupal Coding Standards when checking PHP
let g:syntastic_phpcs_conf=" --standard=DrupalCodingStandard --extensions=php,tpl.php,module,inc,install,test,profile,theme"

" CtrlP Stuff - see http://statico.github.com/vim.html
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-f>'],
  \ 'ToggleType(-1)':       ['<c-b>']
  \ }

autocmd FileType php set keywordprg=~/.vim/php_doc

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
