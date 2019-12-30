"
" PLUGINS
" Configuration for all plugins
"

"
" GENERAL
"
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_powerline_fonts = 1

" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'no'
" So it handles Taboo
set sessionoptions+=tabpages,globals

" UltiSnips
let g:UltiSnipsExpandTrigger = "<Nop>"
let g:UltiSnipsListSnippets = "<Nop>"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsEditSplit='vertical'
" Load Snippets based on pattern
autocmd BufRead,BufNewFile **/components/*.js,**/containers/*.js UltiSnipsAddFiletypes javascript-react
autocmd BufRead,BufNewFile **/reducers/* UltiSnipsAddFiletypes javascript-redux-reducers
autocmd BufRead,BufNewFile **/actions/*,**/actionTypes.js UltiSnipsAddFiletypes javascript-redux-actions
autocmd BufRead,BufNewFile **/selectors/*, UltiSnipsAddFiletypes javascript-redux-selectors
autocmd BufRead,BufNewFile **.{test,spec}.js UltiSnipsAddFiletypes javascript-jest
autocmd BufRead,BufNewFile **/actions/*.{test,spec}.js UltiSnipsAddFiletypes javascript-redux-actions-test

" AYU Colorscheme
" Options are light/mirage/dark
let ayucolor="mirage"

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

