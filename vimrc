"
" PACKAGES
"
call plug#begin('~/.vim/plugged')

  "
  " GENERAL
  "
  " Sannity set of vim rules.
  Plug 'tpope/vim-sensible'

  " Enables repetition with . for plugins.
  Plug 'tpope/vim-repeat'

  " Multiple Cursors.
  Plug 'terryma/vim-multiple-cursors'

  " Commenting stuff out with Operator `gc`.
  Plug 'tpope/vim-commentary'

  " Automatic Bracket closing.
  Plug 'jiangmiao/auto-pairs'

  " Surround with parenthesis/quotes Operator `ys`.
  Plug 'tpope/vim-surround'

  " Distraction Free coding.
  Plug 'junegunn/goyo.vim'

  " Status Bar Plugin
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Disable the whitespac trailing info.
  " silent! call airline#extensions#whitespace#disable()

  " Nerd Tree
  Plug 'scrooloose/nerdtree'

  " Line indentation plugin
  Plug 'yggdroot/indentline'
  let g:indentLine_enabled = 0
  " You can also use one of ¦, ┆, │, ⎸, or ▏ to display more beautiful lines.
  let g:indentLine_char = '⎸'

  " git wrapper.
  Plug 'tpope/vim-fugitive'
  
  " Syntax Highlighting Plugin 
  Plug 'vim-syntastic/syntastic'

  " Install only on powerful CPUs
  if system('uname -m') =~ "x86_64"
    " Autocompletion Plugin
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --cs-completer' }
  endif
  
  "
  " SPECIFIC
  "

  " JavaScript Highlighting
  Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }

  " Add support for JSX
  Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0

  " Prettier formatter
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

  " Emmet for HTML and CSS
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss'] }

  " Racket Plugin
  Plug 'wlangstroth/vim-racket'
  au! BufRead,BufNewFile *.ss	setfiletype racket
  au! BufRead,BufNewFile *.rkt	setfiletype racket


  "
  " MAC OS
  "
  if has('osx')
    " Adds Support for Plist files on MacOS
    Plug 'darfink/vim-plist'

    " Search Dash.app from vim
    Plug 'rizzatti/dash.vim'
  endif


  "
  " COLOR SCHEMES
  "
  " Colorscheme pluggin.
  Plug 'flazz/vim-colorschemes'

  " Base16
  Plug 'chriskempson/base16-vim'

  " Solarized Colorscheme
  Plug 'altercation/vim-colors-solarized'

call plug#end()


"
" GENERAL CONFIGURATIONS
"

" Move viminfo into the tmp folder
set viminfo+=n$HOME/.vim/tmp/.viminfo

" Enable 24bit color in supported Terminals.
set termguicolors 

" Color Scheme Settings, only if installed
if !empty(glob("~/.vim/plugged/base16-vim/"))
  set background=dark
  colorscheme base16-oceanicnext
endif

" Display Line Numbers.
set number
" Line Numbers relative to the Cursor's position.
set relativenumber  

" Convert tabs to 4 spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" Vertical Split to the right.
set splitright

" Display incomplete commands.
set showcmd

" No beeping
set visualbell

" Keep swap files inside the .vim/tmp folder.
set directory=~/.vim/tmp//,.

" Make cursor thin in Insert Mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"
" KEYBOARD RE-MAPPING
"

