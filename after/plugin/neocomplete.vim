""""" Neocomplete """"""
let g:neocomplete#enable_at_startup = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
" Enable omni completion.
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

