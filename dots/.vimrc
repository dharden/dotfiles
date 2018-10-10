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
set listchars+=extends:>          " The character to show in the last column when wrapping
set listchars+=precedes:<

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

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

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
Plugin 'chriskempson/base16-vim'
"Bundle 'godlygeek/csapprox'
" Editor Niceties
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'mkitt/tabline.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
Bundle 'ruanyl/coverage.vim'
" Syntax
Bundle 'natew/ftl-vim-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mtscout6/syntastic-local-eslint.vim'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '🙅'
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_zsh_checkers = ['zsh', 'sh/shellcheck']
let g:syntastic_bash_checkers = ['bash', 'sh/shellcheck']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
Bundle 'elzr/vim-json'
Bundle 'sbdchd/neoformat'
autocmd BufWritePre *.js Neoformat

" Web Dev
Bundle 'skammer/vim-css-color'
Bundle 'docunext/closetag.vim'

filetype plugin indent on

" Plugin config below here:

" The colors, Duke, the colors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme molokai
  set t_Co=256
endif
" No background color
" hi Normal ctermbg=NONE

"NERDTree stuff
map <Leader>n :NERDTreeToggle<CR>

" CtrlP Stuff - see http://statico.github.com/vim.html
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-f>'],
  \ 'ToggleType(-1)':       ['<c-b>']
  \ }

autocmd filetype crontab setlocal nobackup nowritebackup
