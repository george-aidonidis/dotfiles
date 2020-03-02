let g:projectionist_heuristics = {
      \ '*': {
      \  }
      \}

" Helper function for batch-updating the g:projectionist_heuristics variable.
function! s:project(...)
  for [l:pattern, l:projection] in a:000
    let g:projectionist_heuristics['*'][l:pattern] = l:projection
  endfor
endfunction

for s:extension in ['.js', '.jsx', '.ts', '.tsx']
  call s:project(
        \ ['*' . s:extension, {
        \   'alternate': [
        \     '{dirname}/test' . s:extension,
        \     '{dirname}/{basename}.spec' . s:extension,
        \     '{dirname}/{basename}.test' . s:extension
        \   ],
        \   'type': 'source'
        \ }],
        \ ['*/test' . s:extension, {
        \   'alternate': [
        \     '{}/index' . s:extension,
        \     '{}/{basename}' . s:extension
        \   ],
        \   'type': 'test',
        \ }]
        \ )
endfor
