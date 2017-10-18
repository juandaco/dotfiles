
"
" PLUG PACKAGE MANAGER
"
call plug#begin('~/.vim/plugged')

  " Sannity set of vim rules.
  Plug 'tpope/vim-sensible'

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

  " Status Bar Plugin
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " NERD TREE
  Plug 'scrooloose/nerdtree'
  
  " Autocompletion Plugin
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer' }

  " Syntax Highlighting Plugin 
  Plug 'vim-syntastic/syntastic'

  " post install (yarn install | npm install) then load plugin only for editing supported files.
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

  " Emmet for HTML and CSS
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss'] }
  " let g:user_emmet_leader_key='<C-E>'

  " Search Dash.app from vim
  Plug 'rizzatti/dash.vim'
  
  " git wrapper.
  Plug 'tpope/vim-fugitive'

  " Syntax Highligthing for React JSX
  Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
  let g:jsx_ext_required = 0
  " For vim-jsx
  Plug 'othree/yajs.vim', { 'for': ['javascript'] }

  " Racket Plugin
  Plug 'wlangstroth/vim-racket' , { 'for': ['scheme'] }
 
  " Syntax Highligthing for Nand2Tetris Course
  " Plug 'sevko/vim-nand2tetris-syntax'

  "
  " COLOR SCHEMES
  "
  " Colorscheme pluggin.
  " Plug 'flazz/vim-colorschemes'

  " Base16
  Plug 'chriskempson/base16-vim'

  " Solarized Colorscheme
  Plug 'altercation/vim-colors-solarized'

call plug#end()


"
" BASIC CONFIGURATIONS
"
" Enable 24bit color in supported Terminals.
set termguicolors 

" Color Scheme Settings.
set background=dark
" colorscheme base16-oceanicnext
colorscheme base16-brewer

" Display Line Numbers.
set number
" Line Numbers relative to the Cursor's position.
set relativenumber  

" Convert tabs to 4 spaces.
set tabstop=4  
set shiftwidth=4  
set expandtab  

" Case-insensitive searching.
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase

" No beeping
set visualbell

" Keep swap files inside the .vim/tmp folder.
set directory=~/.vim/tmp//,.

" Make cursor thin in Insert Mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"
" KEY RE-MAPPING
"




"" Example Vim configuration.
"" Copy or symlink to ~/.vimrc or ~/_vimrc.

"set nocompatible                  " Must come first because it changes other options.

"syntax enable                     " Turn on syntax highlighting.
"filetype plugin indent on         " Turn on file type detection.

"runtime macros/matchit.vim        " Load the matchit plugin.

"set showcmd                       " Display incomplete commands.
"set showmode                      " Display the mode you're in.

"set backspace=indent,eol,start    " Intuitive backspacing.

"set hidden                        " Handle multiple buffers better.

"set wildmenu                      " Enhanced command line completion.
"set wildmode=list:longest         " Complete files like a shell.

"set ignorecase                    " Case-insensitive searching.
"set smartcase                     " But case-sensitive if expression contains a capital letter.

"set number                        " Show line numbers.
"set ruler                         " Show cursor position.

"set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.

"set wrap                          " Turn on line wrapping.
"set scrolloff=3                   " Show 3 lines of context around the cursor.

"set title                         " Set the terminal's title

"set visualbell                    " No beeping.

"set nobackup                      " Don't make a backup before overwriting a file.
"set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

"" UNCOMMENT TO USE
""set tabstop=2                    " Global tab width.
""set shiftwidth=2                 " And again, related.
""set expandtab                    " Use spaces instead of tabs

"set laststatus=2                  " Show the status line all the time
"" Useful status information at bottom of screen
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"" Or use vividchalk
"colorscheme topfunky-light

"" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

"" Uncomment to use Jamis Buck's file opening plugin
""map <Leader>t :FuzzyFinderTextMate<Enter>

"" Controversial...swap colon and semicolon for easier commands
""nnoremap ; :
""nnoremap : ;

""vnoremap ; :
""vnoremap : ;

"" Automatic fold settings for specific files. Uncomment to use.
"" autocmd FileType ruby setlocal foldmethod=syntax
"" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
