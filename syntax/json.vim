" Add JS comments for jsonc support
syntax match Comment +\/\/.\+$+
syntax region jsComment start="\/\*" end="\*\/"
highlight link jsComment Comment
