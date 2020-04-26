"
" GENERAL CONFIGURATIONS
"

" Encoding for this file
scriptencoding utf-8

filetype plugin indent on

" Enable syntax if terminal supports it.
if &t_Co > 1
  syntax enable
endif

" Enable 24bit color in supported terminals.
if has('termguicolors')
  set termguicolors
endif

" Color Scheme Settings, only if installed
set background=dark
silent! colorscheme gruvbox

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

" Set character for tab and return when visible with 'set list'
set listchars=tab:▸\ ,eol:¬

"
" VIM ONLY
"
if !has('nvim')
  " Keep swap files inside the .vim/tmp folder.
  set directory=~/.vim/tmp/

  " Move viminfo into the tmp folder
  set viminfo+=n~/.vim/tmp/viminfo

  "
  " Console cursor config for vim.
  " (Neovim uses 'guicursor' option)
  "
  " Start INSERT Mode
  let s:VERTICAL_LINE_BLINKING = 6
  let &t_SI = "\e[" . s:VERTICAL_LINE_BLINKING . ' q'
  " Start REPLACE Mode
  let s:UNDERLINE_BLINKING = 4
  let &t_SR = "\e[" . s:UNDERLINE_BLINKING . ' q'
  " NORMAL Mode
  let s:BLOCK_BLINKING = 0
  let &t_EI = "\e[" . s:BLOCK_BLINKING . ' q'
endif
