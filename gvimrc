" Set the font family and size.
set guifont=Monaco:h16

" Color Scheme settings.
set background=dark
silent! colorscheme base16-brewer
execute "AirlineTheme base16"

" Remove scrollbars
set guioptions-=r
set guioptions-=L

map ƒ :PrettierAsync <CR>
map ∑ :set wrap! <bar> :set wrap? <CR>

