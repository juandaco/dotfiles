"
" PACKAGES
" Contains all the Packages that minpac installs without configuration
"

" Commands for minpac
command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus  packadd minpac | source $MYVIMRC | call minpac#status()

" Don't continue if minpac not loaded
if !exists('*minpac#init')
  finish
endif

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

" UltiSnips Sippets Engine
call minpac#add('SirVer/ultisnips')

" A.L.E. (Asynchronous Linter Engine)
call minpac#add('w0rp/ale')
" Configure Linters

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

" Better Sessions Management
call minpac#add('vim-scripts/vim-misc')
call minpac#add('xolox/vim-session')

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

" Add support for JSX
call minpac#add('mxw/vim-jsx', { 'type': 'opt' })

" Prettier formatter
call minpac#add('prettier/vim-prettier', { 'type': 'opt' })

" Emmet for HTML and CSS
call minpac#add('mattn/emmet-vim', { 'type': 'opt' })

" Markdown Syntax
call minpac#add('plasticboy/vim-markdown', { 'type': 'opt' })

" Markdown Previewer
" call minpac#add('suan/vim-instant-markdown', { 'type': 'opt' })
" " let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0

" AppleScript Syntax
call minpac#add('vim-scripts/applescript.vim', { 'type': 'opt' })

" Better PHP Syntax Highlighting
call minpac#add('StanAngeloff/php.vim', { 'type': 'opt' })

" PHP Autocompletion
call minpac#add('shawncplus/phpcomplete.vim', { 'type': 'opt' })

" WordPress Development Plugin
call minpac#add('dsawardekar/wordpress.vim', { 'type': 'opt' })

" Add Handlebars support to work with Meteor
call minpac#add('slava/vim-spacebars', { 'type': 'opt' })

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

" Solarized Colorscheme
call minpac#add('altercation/vim-colors-solarized')

" VS Code Dark
call minpac#add('tomasiser/vim-code-dark')
