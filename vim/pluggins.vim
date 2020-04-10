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
let g:airline_theme = 'base16'

" Sessions config
let g:session_autosave = 'no'
let g:session_autoload = 'no'
" So it handles Taboo
set sessionoptions+=tabpages,globals

" AYU Colorscheme
" Options are light/mirage/dark
let ayucolor='mirage'

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

