set noshowmode

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranchWithIcon',
      \   'branchicon': ''
      \ },
      \ }

function! GitBranchWithIcon()
  let branch = fugitive#head()
  let icon = ' '
  return  icon . branch
endfunction
