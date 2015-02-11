" Basic Setup
set nocompatible       " Use vim, no vi defaults
set number             " Show line numbers (both set for hybrid mode)
set ruler              " Show line and column number
set encoding=utf-8     " Set default encoding to UTF-8
set mouse=a            " Enables mouse
syntax enable          " Turn on syntax highlighting allowing local overrides

" Whitespace
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

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show command in bottom right portion of the screen
set showcmd

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2
set noshowmode

" Prefer a slightly higher line height
set linespace=3

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" Spellcheck
set spell " protip: ]s z= zg
set spellfile=~/.vim/spell/en.utf-8.add

" Yank text to the OS X clipboard
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>yy "+yy

" Backup and swap files
set noswapfile
set nobackup

" Wildmenu (tab vim command completion)
set wildmenu
set wildmode=list:longest,full

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

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
" Colors
Bundle 'tomasr/molokai'
Bundle 'flazz/vim-colorschemes'
"Bundle 'godlygeek/csapprox'
" Editor Niceties
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'wikitopian/hardmode'
Bundle 'mkitt/tabline.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
" Syntax
Bundle 'natew/ftl-vim-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'elzr/vim-json'
" Web Dev
Bundle 'skammer/vim-css-color'
Bundle 'docunext/closetag.vim'

filetype plugin indent on

" Plugin config below here:

" The colors, Duke, the colors
colorscheme molokai
set t_Co=256
" No background color
" hi Normal ctermbg=NONE

"NERDTree stuff
map <Leader>n :NERDTreeToggle<CR>

" CtrlP Stuff - see http://statico.github.com/vim.html
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-f>'],
  \ 'ToggleType(-1)':       ['<c-b>']
  \ }

" HARD MODE
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Syntax Stuff
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
