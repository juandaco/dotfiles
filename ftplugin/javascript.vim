" Set filetype for JSX support
set filetype=javascript.jsx

" Javascript improved Syntax Highlighting
if &rtp !~ 'vim\-javascript'
  packadd vim-javascript
endif

" Prettier Autoformatter
if &rtp !~ 'vim\-prettier'
  packadd vim-prettier
endif

" Emmet for JSX
if &rtp !~ 'emmet\-vim'
  packadd emmet-vim
endif

" Add JSX Support for React
if &rtp !~ 'vim\-jsx'
  packadd vim-jsx
endif


