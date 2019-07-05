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
  \   'json': ['jsonlint'],
  \   'php': ['phpcs'],
  \   'scss': ['stylelint'],
  \   'sh': ['shellcheck'],
  \}
" ALE Auto-Formatters
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
let g:ale_lint_on_enter = 0
" ALE options for shellcheck (Bash Linter)
let g:ale_sh_shellcheck_options = '-e SC1090 -x'
" ALE options for shfmt (Bash Autoformatter)
let g:ale_sh_shfmt_options = '-i 2 -ci'
" ALE options for PHP linting and autoformatting
let g:ale_php_phpcs_standard = 'WordPress'
let g:ale_php_phpcbf_standard = 'WordPress'

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
autocmd BufRead,BufNewFile */src/index.js,*/components/*.js,*/containers/*.js UltiSnipsAddFiletypes javascript-react
autocmd BufRead,BufNewFile **/reducers/* UltiSnipsAddFiletypes javascript-redux-reducers
autocmd BufRead,BufNewFile **/actions/*,**/actionTypes.js UltiSnipsAddFiletypes javascript-redux-actions
autocmd BufRead,BufNewFile *.{test,spec}.js UltiSnipsAddFiletypes javascript-jest
autocmd BufRead,BufNewFile */actions/*.{test,spec}.js UltiSnipsAddFiletypes javascript-redux-actions-test
autocmd BufRead,BufNewFile */wp-content/plugins/*/*.php UltiSnipsAddFiletypes wordpress-plugin

" Markdown
let g:vim_markdown_fenced_languages = ['js=javascript', 'python']

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

" Emmet
" Enable in JavaScript for JSX
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" TypeScript
autocmd BufRead,BufNewFile *.ts{x,} setfiletype typescript.tsx

