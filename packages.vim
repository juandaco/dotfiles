"
" PACKAGES
" Contains all the packages
"

" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim


if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

    " Package Manager
    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

    "
    " GENERAL
    "
    " Sannity set of vim rules
    call dein#add('tpope/vim-sensible')

    " Bracket Mapping for shortcuts
    call dein#add('tpope/vim-unimpaired')

    " Surround with parenthesis/quotes
    call dein#add('tpope/vim-surround')

    " Commenting stuff out with Operator `gc`
    call dein#add('tpope/vim-commentary')

    " Enables repetition with . for plugins
    call dein#add('tpope/vim-repeat')

    " Zen Mode. Distraction Free coding
    call dein#add('junegunn/goyo.vim')

    "
    " TEXT OBJECTS
    "
    " Argument Text Object
    call dein#add('vim-scripts/argtextobj.vim')

    " Entire Buffer Text Object
    call dein#add('kana/vim-textobj-user')
    call dein#add('kana/vim-textobj-entire')

    "
    " COMPLEX
    "
    " AirLine Status Bar Plugin
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " UltiSnips Sippets Engine
    call dein#add('SirVer/ultisnips')

    " Autocompletion
    call dein#add('neoclide/coc.nvim', { 'rev': 'release' })

    " Fuzzy Match completer
    call dein#add('junegunn/fzf.vim')

    " git wrapper.
    call dein#add('tpope/vim-fugitive')

    " Git Gutter
    call dein#add('airblade/vim-gitgutter')

    " Better Sessions Management
    call dein#add('xolox/vim-misc')
    call dein#add('xolox/vim-session')

    " Rename Tabs Plugin
    call dein#add('gcmt/taboo.vim')

    " General Syntax Highlighting
    call dein#add('sheerun/vim-polyglot')

    "
    " MAC OS
    "
    if has('mac')
    " Search Dash.app from vim
    call dein#add('rizzatti/dash.vim')

    " Adds Support for Plist files on MacOS
    call dein#add('darfink/vim-plist')
    endif

    " SPECIFIC
    "
    " Emmet for HTML and CSS
    call dein#add('mattn/emmet-vim')

    "
    " COLOR SCHEMES
    "
    " Colorscheme pluggin.
    call dein#add('flazz/vim-colorschemes')

    " Base16
    " call dein#add('chriskempson/base16-vim')
    call dein#add('danielwe/base16-vim')

    " Lucario
    call dein#add('t1mxg0d/vim-lucario')

    " AYU
    call dein#add('ayu-theme/ayu-vim')

    " Solarized Colorscheme
    call dein#add('altercation/vim-colors-solarized')

    " VS Code Dark
    call dein#add('tomasiser/vim-code-dark')

  call dein#end()
  call dein#save_state()
endif

