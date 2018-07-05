"
" FUNCTIONS
"
function! SetColorScheme(_color, _bg, ...)
  execute "colorscheme" a:_color
  execute "set bg=". a:_bg

  let air_theme = get(a:, 1, "")
  if air_theme != "" && has('mac')
    execute "AirlineTheme" air_theme
  endif
endfunction
