"
" PACKAGES
"

" Load minpac
packadd minpac

" Don't continue if `minpac` is not available
if !exists('g:loaded_minpac')
  finish
endif

call minpac#init()

" Add minpac as a package
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

" Bracket pairing plugin
call minpac#add('jiangmiao/auto-pairs')

" Commenting stuff out with Operator `gc`
call minpac#add('tpope/vim-commentary')

" Enables repetition with . for plugins
call minpac#add('tpope/vim-repeat')

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

call minpac#add('SirVer/ultisnips')

" Fuzzy Match completer
call minpac#add('junegunn/fzf.vim')

" git wrapper.
call minpac#add('tpope/vim-fugitive')

" Git Gutter
call minpac#add('airblade/vim-gitgutter', {'branch': 'main'})

" Better Sessions Management
call minpac#add('xolox/vim-misc')
call minpac#add('xolox/vim-session')

" Rename Tabs Plugin
call minpac#add('gcmt/taboo.vim')

" General Syntax Highlighting
call minpac#add('sheerun/vim-polyglot')

"
" MAC OS
"
if has('mac')
  " Search Dash.app from vim
  call minpac#add('rizzatti/dash.vim')

  " Adds Support for Plist files on MacOS
  call minpac#add('darfink/vim-plist')
endif

"
" COLOR SCHEMES
"
" Colorscheme pluggin.
call minpac#add('flazz/vim-colorschemes')

" Base16
" call minpac#add('chriskempson/base16-vim')
call minpac#add('danielwe/base16-vim')

" Lucario
call minpac#add('t1mxg0d/vim-lucario')

" AYU
call minpac#add('ayu-theme/ayu-vim')

" Solarized Colorscheme
call minpac#add('altercation/vim-colors-solarized')

" VS Code Dark
call minpac#add('tomasiser/vim-code-dark')

"
" Commands
"
command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()
