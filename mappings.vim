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

" Set Color Scheme with keyboard shortcuts
map <Leader>tsd :call SetColorScheme("base16-solarized-dark", "dark") <CR>
map <Leader>tsl :call SetColorScheme("base16-solarized-light", "light") <CR>
map <Leader>tmv :call SetColorScheme("macvim", "light", "base16") <CR>
map <Leader>tmo :call SetColorScheme("base16-monokai", "dark", "base16") <CR>
map <Leader>tma :call SetColorScheme("base16-material", "dark", "base16") <CR>
map <Leader>tb :call SetColorScheme("base16-brewer", "dark") <CR>
map <Leader>td :call SetColorScheme("base16-dracula", "dark", "base16") <CR>
map <Leader>to :call SetColorScheme("base16-oceanicnext", "dark") <CR>
map <Leader>tf :call SetColorScheme("base16-flat", "dark") <CR>
map <Leader>tl :call SetColorScheme("lucario", "dark", "base16") <CR>
map <Leader>tt :call SetColorScheme("Tomorrow", "light") <CR>
map <Leader>tg :call SetColorScheme("base16-github", "light") <CR>
map <Leader>ta :call SetColorScheme("ayu", "dark", "ayu") <CR>
map <Leader>tvd :call SetColorScheme("codedark", "dark", "codedark") <CR>

" Set Tab to 4 spaces
map <Leader>4 :set sw=4 ts=4 sts=4 <CR>
" Set Tab to 2 spaces
map <Leader>2 :set sw=2 ts=2 sts=2 <CR>

" Toggle Wrap
silent! execute "set <A-w>=\ew"
nnoremap <A-w> :set wrap! <bar> :set wrap? <CR>

" Autoformat with ALEFix
silent! execute "set <A-F>=\eF"
noremap <A-F> :ALEFix <CR>

" ALE Toggle
map <Leader>l :ALEToggle <CR>

" Create a test file and vertical split it into the side
map <Leader>s :vsplit %:p:r.test.%:e <CR>
