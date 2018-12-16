"
" Plug Plugins
"

packadd minpac
call minpac#init()

" Update MinPac itself and add it as optional
call minpac#add('k-takata/minpac', {'type': 'opt'})

"
" GENERAL
"
" Sannity set of vim rules
call minpac#add('tpope/vim-sensible')

" Bracket Mapping for shortcuts
call minpac#add('tpope/vim-unimpaired')

" Surround with parenthesis/quotes
call minpac#add('tpope/vim-surround')

" Commenting stuff out with Operator `gc`
call minpac#add('tpope/vim-commentary')

" Enables repetition with . for plugins
call minpac#add('tpope/vim-repeat')

" Automatic bracket closing
call minpac#add('jiangmiao/auto-pairs')

" Multiple Cursor Support
call minpac#add('terryma/vim-multiple-cursors')

" Zen Mode. Distraction Free coding
call minpac#add('junegunn/goyo.vim')

"
" TEXT OBJECTS
"
" Argument Text Object
call minpac#add('vim-scripts/argtextobj.vim')

" Entire Buffer Text Object
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')

"
" COMPLEX
"
" AirLine Status Bar Plugin
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
" Enable Powerline Fonts
let g:airline_powerline_fonts = 1

" UltiSnips Sippets Engine
call minpac#add('SirVer/ultisnips')
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

" A.L.E. (Asynchronous Linter Engine)
call minpac#add('w0rp/ale')
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

" Autocompletion Plugin
if has('mac')
  call minpac#add('Valloric/YouCompleteMe', { 'do': '! ./install.py --clang-completer --js-completer' })
endif

" Fuzzy Match completer
call minpac#add('junegunn/fzf', { 'do': '! ./install --all' })
call minpac#add('junegunn/fzf.vim')


" git wrapper.
call minpac#add('tpope/vim-fugitive')

" Git Gutter
call minpac#add('airblade/vim-gitgutter')
let g:gitgutter_enabled = 0

" Better Sessions Management
call minpac#add('vim-scripts/vim-misc')
call minpac#add('xolox/vim-session')
let g:session_autosave = 'no'

" Rename Tabs Plugin
call minpac#add('gcmt/taboo.vim')
set sessionoptions+=tabpages,globals

"
" MAC OS
"
if has('mac')
  " Adds Support for Plist files on MacOS
  call minpac#add('darfink/vim-plist', { 'type': 'opt' })

  " Search Dash.app from vim
  call minpac#add('rizzatti/dash.vim')
endif



"
" SPECIFIC
"
" JavaScript Highlighting
call minpac#add('pangloss/vim-javascript', { 'type': 'opt' })
let g:javascript_plugin_jsdoc = 1

" Add support for JSX
call minpac#add('mxw/vim-jsx', { 'type': 'opt' })
let g:jsx_ext_required = 0

" Prettier formatter
call minpac#add('prettier/vim-prettier', { 'type': 'opt' })

" Emmet for HTML and CSS
call minpac#add('mattn/emmet-vim', { 'type': 'opt' })
" Enable in JavaScript for JSX
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Markdown Previewer
call minpac#add('suan/vim-instant-markdown', { 'type': 'opt' })
" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" Better PHP Syntax Highlighting
call minpac#add('StanAngeloff/php.vim', { 'type': 'opt' })

" PHP Autocompletion
call minpac#add('shawncplus/phpcomplete.vim', { 'type': 'opt' })

" WordPress Development Plugin
call minpac#add('dsawardekar/wordpress.vim', { 'type': 'opt' })

" PostgreSQL Improved Syntax
" call minpac#add('lifepillar/pgsql.vim'
" Set PostgreSQL as the default SQL dialect
" let g:sql_type_default = 'pgsql'

" Add Handlebars support to work with Meteor
call minpac#add('slava/vim-spacebars', { 'type': 'opt' })
" Set spacebars for all html
au BufReadPost *.html set syntax=html.spacebars


"
" COLOR SCHEMES
"
" Colorscheme pluggin.
call minpac#add('flazz/vim-colorschemes')

" Base16
call minpac#add('chriskempson/base16-vim')

" Lucario
call minpac#add('t1mxg0d/vim-lucario')

" AYU
call minpac#add('ayu-theme/ayu-vim')
let ayucolor="mirage" " light/mirage/dark

" Solarized Colorscheme
call minpac#add('altercation/vim-colors-solarized')

" VS Code Dark
call minpac#add('tomasiser/vim-code-dark')


" Define user commands for updating/cleaning the plugins.
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

