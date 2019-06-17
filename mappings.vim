"
" KEYBOARD RE-MAPPING
"

" Use space as the Leader
map <Space> \

" Fzf Files
map <Leader>f :Files <CR>

" Fzf Colors
map <Leader>c :Colors <CR>

" Write current buffer.
map <Leader>w :w <CR>

" Search Dash for Term under the cursor
if has('mac')
  map <C-h> :Dash <CR>
endif

" Set Tab to 4 spaces
map <Leader>4 :set sw=4 ts=4 sts=4 <CR>
" Set Tab to 2 spaces
map <Leader>2 :set sw=2 ts=2 sts=2 <CR>

" Autoformat with ALEFix
silent! execute "set <A-F>=\eF"
noremap <A-F> :ALEFix <CR>

" ALE Toggle
map <Leader>l :ALEToggle <CR>

" Create a test file and vertical split it into the side
map <Leader>s :vsplit %:p:r.test.%:e <CR>

" Expand %% to current working directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
