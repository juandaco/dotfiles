"
" Holds all coc.nvim configuration
"

" Extensions used
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-diagnostic',
  \ 'coc-spell-checker',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-vimlsp',
  \ 'coc-texlab',
  \ 'coc-rust-analyzer',
  \ 'coc-python',
  \ 'coc-markdownlint',
  \ 'coc-highlight',
  \ ]

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for go-tos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Consistent with VSCode
nmap <F12> <Plug>(coc-definition)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
augroup HoldCursor
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Remap for rename current word
nmap <leader>krn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

augroup myGroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ksa  <Plug>(coc-codeaction-selected)
nmap <leader>ksa  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ka  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>kqf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Selections ranges, needs server support.
nmap <silent> <C-M-a> <Plug>(coc-range-select)
xmap <silent> <C-M-a> <Plug>(coc-range-select)
nmap <silent> <C-M-x> <Plug>(coc-range-select-backward)
xmap <silent> <C-M-x> <Plug>(coc-range-select-backward)

" Remap for format selected region
xmap <leader>ksf <Plug>(coc-format-selected)
nmap <leader>ksf <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Format Keyboard shortcut
nmap <leader>kf :Format<CR>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Format Keyboard shortcut
nmap <leader>ko :OR<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show CocList
nmap <leader>kl :CocList<CR>
