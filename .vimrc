"General Mappings (Normal, Visual, Operator-pending)

"Basic Setup
set nocompatible       " Use vim, no vi defaults
set relativenumber     " Show relative line numbers
set number             " Show line numbers (both set for hybrid mode)
set ruler              " Show line and column number
set encoding=utf-8     " Set default encoding to UTF-8
set mouse=a            " Enables mouse
syntax enable          " Turn on syntax highlighting allowing local overrides

"Whitespace
set nowrap                        " don't wrap lines
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

"List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"Write the old file out when switching between files.
set autowrite

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

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-w> ddkP
nmap <S-w> ddp

"Bubble multiple lines
vmap <C-w> xkP`[V`]
vmap <S-w> xp`[V`]

" Yank text to the OS X clipboard
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>yy "+yy

"" Backup and swap files
"set backupdir=""   " where to put backup files.
"set directory=""   " where to put swap files.
set noswapfile
set nobackup

"" Wildmenu (tab command completion)
set wildmenu
set wildmode=list:longest,full

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
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

" Clear last search
nnoremap <CR> :noh<CR><CR>

" We Vundlin'
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
Bundle 'kien/ctrlp.vim'
Bundle 'natew/ftl-vim-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-rails.git'
Bundle 'flazz/vim-colorschemes'
Bundle 'closetag.vim'
Bundle 'godlygeek/csapprox'
Bundle 'MatchTag'
filetype plugin indent on

" Plugin stuff below here:

" The colors, Duke, the colors
colorscheme molokai
set t_Co=256

" No background color
hi Normal ctermbg=NONE

"NERDTree stuff
map <Leader>n :NERDTreeToggle<CR>

" CtrlP Stuff - see http://statico.github.com/vim.html
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-f>'],
  \ 'ToggleType(-1)':       ['<c-b>']
  \ }
