" Temporary fix for issues with Python 3.7
if has('python3')
  silent! python3 1
endif

" Add Plugins
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
set termguicolors

" Color Scheme Settings, only if installed
set background=dark
silent! colorscheme base16-monokai

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
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Set character for tab and return when visible with 'set list'
set listchars=tab:▸\ ,eol:¬

