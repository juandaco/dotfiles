
" Add Packages
runtime packages.vim

" Add Plugin Configurations
runtime pluggins.vim

" Add Helper Functions
runtime functions.vim

" Add Keyboard Mappings
runtime mappings.vim

"
" GENERAL CONFIGURATIONS
"

" Move viminfo into the tmp folder
if ! has('nvim')
  set viminfo+=n~/.vim/tmp/viminfo
endif

" Enable 24bit color in supported Terminals.
if has('termguicolors')
  set termguicolors
endif
if &term =~ '256color'
  set t_ut=
endif

" Color Scheme Settings, only if installed
set background=dark
silent! colorscheme molokai

" Display Line Numbers.
set number
" Line Numbers relative to the Cursor's position.
set relativenumber

" Convert tabs to 2 spaces.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Set nowrap by default
set nowrap

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Vertical Split to the right.
set splitright

" Horizontal Split on the bottom.
set splitbelow

" Display incomplete commands.
set showcmd

" No beeping
set visualbell

" Allow moving buffers without saving.
set hidden

" Keep swap files inside the .vim/tmp folder.
set directory=~/.vim/tmp/,.

" Make cursor thin in Insert Mode
" Start INSERT Mode
let s:VERTICAL_LINE_BLINKING = 6
let &t_SI = "\e[" . s:VERTICAL_LINE_BLINKING . " q"
" Start REPLACE Mode
let s:UNDERLINE_BLINKING = 4
let &t_SR = "\e[" . s:UNDERLINE_BLINKING . " q"
" NORMAL Mode
let s:BLOCK_BLINKING = 0
let &t_EI = "\e[" . s:BLOCK_BLINKING . " q"

" Set character for tab and return when visible with 'set list'
set listchars=tab:▸\ ,eol:¬

