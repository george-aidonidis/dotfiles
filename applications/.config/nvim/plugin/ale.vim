" Change ale symbol of error
let g:ale_sign_error = '😭'
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \  'typescript': ['prettier', 'eslint']
      \}

" Map ALEFix to a key shortcut
nmap <F8> <Plug>(ale_fix)

let g:ale_fix_on_save = 1

let g:ale_sign_error = '😭'
let g:ale_sign_warning = '🤔'
