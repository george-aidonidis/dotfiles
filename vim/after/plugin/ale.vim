" Change ale symbol of error
let g:ale_sign_error = '😭'
let g:ale_fixers = {
      \  'javascript': ['eslint']
      \}

" Map ALEFix to a key shortcut
nmap <F8> <Plug>(ale_fix)
