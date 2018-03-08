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
  if has('mac')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
  endif

  " Nerd Tree
  Plug 'scrooloose/nerdtree'
  let NERDTreeIgnore = ['node_modules$[[dir]]']

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
  if has('mac')
    " Autocompletion Plugin
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --cs-completer' }
  endif

  " FZF Fuzzy file search plugin.
  if has('mac')
      Plug '/usr/local/opt/fzf'
  else
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  endif
  Plug 'junegunn/fzf.vim'

  " Argument Text Object
  Plug 'vim-scripts/argtextobj.vim'

  " Entire Buffer Text Object
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'

  " Camel Case Motion
  Plug 'bkad/camelcasemotion'
  silent! call camelcasemotion#CreateMotionMappings('<leader>')


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
  if has('mac')
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

  " Lucario
  Plug 't1mxg0d/vim-lucario'

  " AYU
  Plug 'ayu-theme/ayu-vim'
  let ayucolor="mirage" " light/mirage/dark

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
set background=dark
silent! colorscheme base16-brewer

" Display Line Numbers.
set number
" Line Numbers relative to the Cursor's position.
set relativenumber

" Convert tabs to 4 spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

" Set character for tab and return when visible with 'set list'
set listchars=tab:▸\ ,eol:¬


"
" FUNCTIONS
"
function! SetColorScheme(_color, _bg, ...)
  execute "colorscheme" a:_color
  execute "set bg=". a:_bg

  let air_theme = get(a:, 1, "")
  if air_theme != "" && has('mac')
    execute "AirlineTheme" air_theme
  endif
endfunction


"
" KEYBOARD RE-MAPPING
"

" Search Dash for Term under the cursor
if has('mac')
  map <Leader>d :Dash <CR>
endif

" Format with Prettier
map <Leader>F :PrettierAsync <CR>

" Toggle Directory Folder
map <Leader><Tab> :NERDTreeToggle <CR>

" Set Color Scheme with keyboard shortcuts
map <Leader>tsd :call SetColorScheme("base16-solarized-dark", "dark") <CR>
map <Leader>tsl :call SetColorScheme("base16-solarized-light", "light") <CR>
map <Leader>tmv :call SetColorScheme("macvim", "light", "base16") <CR>
map <Leader>tmo :call SetColorScheme("monokai", "dark") <CR>
map <Leader>tb :call SetColorScheme("base16-brewer", "dark") <CR>
map <Leader>to :call SetColorScheme("base16-oceanicnext", "dark") <CR>
map <Leader>tf :call SetColorScheme("base16-flat", "dark") <CR>
map <Leader>tl :call SetColorScheme("lucario", "dark", "base16") <CR>
map <Leader>tt :call SetColorScheme("Tomorrow", "light") <CR>
map <Leader>tg :call SetColorScheme("base16-github", "light") <CR>
map <Leader>ta :call SetColorScheme("ayu", "dark", "ayu") <CR>

" Set Tab to 4 spaces
map <Leader>4 :set sw=4 ts=4 sts=4 <CR>
" Set Tab to 2 spaces
map <Leader>2 :set sw=2 ts=2 sts=2 <CR>

" Set Wrap
map <Leader>W :set wrap <CR>
" Set No Wrap
map <Leader>nW :set nowrap <CR>

" FZF Fuzzy file search
map <Leader>f :Files <CR>

