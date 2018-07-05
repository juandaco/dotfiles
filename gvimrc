" Set the font family and size.
set guifont=Inconsolata-dz\ for\ Powerline:h15

" Color Scheme settings.
set background=dark
silent! colorscheme base16-monokai
execute "AirlineTheme base16"

" Remove scrollbars
set guioptions-=r
set guioptions-=L

"
" MAPPINGS
"

" Autoformat
map ƒ :ALEFix <CR>

" Toggle Wrap
map ∑ :set wrap! <bar> :set wrap? <CR>

" Navigate Buffers
map ≤ :bp <CR>
map ≥ :bn <CR>
