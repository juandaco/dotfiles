"
" PLUGINS
" Configuration for all plugins
"

"
" GENERAL
"
" ALE
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'tyepscript': ['eslint'],
  \   'json': ['jsonlint'],
  \   'scss': ['stylelint'],
  \   'sh': ['shellcheck'],
  \}
" ALE Auto-Formatters
let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'typescript': ['prettier'],
  \   'json': ['fixjson'],
  \   'html': ['prettier'],
  \   'css': ['stylelint'],
  \   'scss': ['stylelint'],
  \   'java': ['google_java_format'],
  \   'sh': ['shfmt'],
  \}
let g:ale_lint_on_enter = 0
" ALE options for shellcheck (Bash Linter)
let g:ale_sh_shellcheck_options = '-e SC1090 -x'
" ALE options for shfmt (Bash Autoformatter)
let g:ale_sh_shfmt_options = '-i 2 -ci'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_powerline_fonts = 1

" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-space>'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'
" Load Snippets based on pattern
autocmd BufRead,BufNewFile **/components/*.js,**/containers/*.js UltiSnipsAddFiletypes javascript-react
autocmd BufRead,BufNewFile **/reducers/* UltiSnipsAddFiletypes javascript-redux-reducers
autocmd BufRead,BufNewFile **/actions/*,**/actionTypes.js UltiSnipsAddFiletypes javascript-redux-actions
autocmd BufRead,BufNewFile **.{test,spec}.js UltiSnipsAddFiletypes javascript-jest
autocmd BufRead,BufNewFile **/actions/*.{test,spec}.js UltiSnipsAddFiletypes javascript-redux-actions-test

" AYU Colorscheme
let ayucolor="mirage" " light/mirage/dark

" Set FZF Runtimepath
if has('mac')
  set runtimepath+=/usr/local/opt/fzf
else
  set runtimepath+=~/.fzf
endif

"
" SPECIFIC
"
" JSX
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1

" Emmet
" Enable in JavaScript for JSX
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" AWS config files
autocmd BufRead,BufNewFile **/.ebextensions/*.config setfiletype yaml

