"
" Plug Plugins
"
call plug#begin('~/.vim/plugged')

  "
  " GENERAL
  "
  " Sannity set of vim rules.
  Plug 'tpope/vim-sensible'

"   " Local vimrc
"   Plug 'embear/vim-localvimrc'
"   " Don't ask before sourcing the .lvimrc file
"   let g:localvimrc_ask = 0
"   " Disable sandbox
"   let g:localvimrc_sandbox = 0

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
  autocmd BufRead,BufNewFile */actions/*,*/actionTypes.js UltiSnipsAddFiletypes javascript-redux-actions
  autocmd BufRead,BufNewFile *.{test,spec}.js UltiSnipsAddFiletypes javascript-jest
  autocmd BufRead,BufNewFile */actions/*.{test,spec}.js UltiSnipsAddFiletypes javascript-redux-actions-test
  autocmd BufRead,BufNewFile */wp-content/plugins/*/*.php UltiSnipsAddFiletypes wordpress-plugin

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
    \   'json': ['jsonlint'],
    \   'php': ['phpcs'],
    \   'scss': ['stylelint'],
    \   'sh': ['shellcheck'],
    \}
  " Configure Auto-Formatters
  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'json': ['fixjson'],
  \   'html': ['prettier'],
  \   'css': ['stylelint'],
  \   'php': ['phpcbf'],
  \   'scss': ['stylelint'],
  \   'java': ['google_java_format'],
  \   'sh': ['shfmt'],
  \}

  " Only Lint files on Save.
  " let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0

  " ALE options for shellcheck (Bash Linter)
  let g:ale_sh_shellcheck_options = '-e SC1090 -x'
  " ALE options for shfmt (Bash Autoformatter)
  let g:ale_sh_shfmt_options = '-i 2 -ci'

  " ALE options for PHP linting and autoformatting
  let g:ale_php_phpcs_standard = 'WordPress'
  let g:ale_php_phpcbf_standard = 'WordPress'

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
    " Plug 'joonty/vdebug'
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
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss', 'javascript.jsx', 'php'] }

  " CSSComb Formatter
  Plug 'batsuev/csscomb-vim'

  " Markdown Previewer
  Plug 'suan/vim-instant-markdown'
  " let g:instant_markdown_slow = 1
  let g:instant_markdown_autostart = 0

  " Better PHP Syntax Highlighting
  Plug 'StanAngeloff/php.vim'

  " PHP Autocompletion
  Plug 'shawncplus/phpcomplete.vim'

  " WordPress Development Plugin
  Plug 'dsawardekar/wordpress.vim'

  " PostgreSQL Improved Syntax
  " Plug 'lifepillar/pgsql.vim'
  " Set PostgreSQL as the default SQL dialect
  " let g:sql_type_default = 'pgsql'

  " Spacebars Support
  Plug 'slava/vim-spacebars'

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

