"
" PACKAGES
"
call plug#begin('~/.vim/plugged')

  "
  " GENERAL
  "
  " Sannity set of vim rules.
  Plug 'tpope/vim-sensible'

  " Local vimrc
  Plug 'embear/vim-localvimrc'
  " Don't ask before sourcing the .lvimrc file
  let g:localvimrc_ask = 0
  " Disable sandbox
  let g:localvimrc_sandbox = 0

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

  " Bracket Mapping
  Plug 'tpope/vim-unimpaired'

  " Distraction Free coding.
  Plug 'junegunn/goyo.vim'

  " Status Bar Plugin
  if has('mac')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#show_tab_nr = 0
    " Enable Powerline Fonts
    let g:airline_powerline_fonts = 1
  endif

  " Sippets Engine
  Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger='<c-space>'
  let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
  let g:UltiSnipsEditSplit='vertical'
  " Load Snippets based on pattern
  autocmd BufRead,BufNewFile */src/index.js,*/components/*.js,*/containers/*.js UltiSnipsAddFiletypes javascript-react
  autocmd BufRead,BufNewFile */reducers/* UltiSnipsAddFiletypes javascript-redux-reducers
  autocmd BufRead,BufNewFile */actions/* UltiSnipsAddFiletypes javascript-redux-actions
  autocmd BufRead,BufNewFile *.{test,spec}.js UltiSnipsAddFiletypes javascript-jest
  autocmd BufRead,BufNewFile */actions/*.{test,spec}.js UltiSnipsAddFiletypes javascript-redux-actions-test

  " git wrapper.
  Plug 'tpope/vim-fugitive'

  " Git Gutter
  Plug 'airblade/vim-gitgutter'
  let g:gitgutter_enabled = 0

  " A.L.E. (Asynchronous Linter Engine)
  Plug 'w0rp/ale'
  " Configure Linters
  let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'scss': ['stylelint'],
    \}
  " Configure Auto-Formatters
  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'scss': ['stylelint'],
  \   'java': ['google_java_format'],
  \}

  " Only Lint files on Save.
  " let g:ale_lint_on_text_changed = 'never'
  " let g:ale_lint_on_enter = 0

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

  " Better Sessions Management
  Plug 'vim-scripts/vim-misc'
  Plug 'xolox/vim-session'
  let g:session_autosave = 'no'

  " Rename Tabs Plugin
  Plug 'gcmt/taboo.vim'
  set sessionoptions+=tabpages,globals

  if has('mac')
    " Debugger
    Plug 'joonty/vdebug'
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
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }

  " Emmet for HTML and CSS
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss', 'javascript.jsx'] }

  " CSSComb Formatter
  Plug 'batsuev/csscomb-vim'


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

  " VS Code Dark
  Plug 'tomasiser/vim-code-dark'

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

" Use space as the Leader
map <Space> \

" Fzf Files
map <Leader>f :Files <CR>

" Fzf Colors
map <Leader>c :Colors <CR>

" Navigate Buffers
execute "set <A-,>=\e,"
map <A-,> :bp <CR>
execute "set <A-.>=\e."
map <A-.> :bn <CR>


" Write current buffer.
map <Leader>w :w <CR>

" Search Dash for Term under the cursor
if has('mac')
  map <C-h> :Dash <CR>
endif
"

" Set Color Scheme with keyboard shortcuts
map <Leader>tsd :call SetColorScheme("base16-solarized-dark", "dark") <CR>
map <Leader>tsl :call SetColorScheme("base16-solarized-light", "light") <CR>
map <Leader>tmv :call SetColorScheme("macvim", "light", "base16") <CR>
map <Leader>tmo :call SetColorScheme("base16-monokai", "dark", "base16") <CR>
map <Leader>tb :call SetColorScheme("base16-brewer", "dark") <CR>
map <Leader>td :call SetColorScheme("base16-dracula", "dark", "base16") <CR>
map <Leader>to :call SetColorScheme("base16-oceanicnext", "dark") <CR>
map <Leader>tf :call SetColorScheme("base16-flat", "dark") <CR>
map <Leader>tl :call SetColorScheme("lucario", "dark", "base16") <CR>
map <Leader>tt :call SetColorScheme("Tomorrow", "light") <CR>
map <Leader>tg :call SetColorScheme("base16-github", "light") <CR>
map <Leader>ta :call SetColorScheme("ayu", "dark", "ayu") <CR>
map <Leader>tvd :call SetColorScheme("codedark", "dark", "codedark") <CR>

" Set Tab to 4 spaces
map <Leader>4 :set sw=4 ts=4 sts=4 <CR>
" Set Tab to 2 spaces
map <Leader>2 :set sw=2 ts=2 sts=2 <CR>

" Toggle Wrap
execute "set <A-w>=\ew"
nnoremap <A-w> :set wrap! <bar> :set wrap? <CR>

" Autoformat with ALEFix
execute "set <A-F>=\eF"
noremap <A-F> :ALEFix <CR>

" ALE Toggle
map <Leader>l :ALEToggle <CR>

map <Leader>s :vsplit %:p:r.test.%:e <CR>

