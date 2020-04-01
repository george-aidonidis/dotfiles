let g:lightline = {
			\ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'relativepath', 'gitbranch', 'modified' ] ]
      \ },
			\ 'tabline': {
			\   'left': [ [ 'buffers' ],
			\             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
			\   'right': [ [ 'close' ], ],
			\ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'buffercurrent': 'lightline#buffer#buffercurrent',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'buffercurrent': 'tabsel',
      \   'bufferbefore': 'raw',
      \   'bufferafter': 'raw',
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'GitBranchWithIcon',
      \   'branchicon': '',
      \   'modified': 'CustomModified',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ }
      \ }

function! CustomModified()
  let modified = &modified ? '✎' : ''
  return modified
endfunction

function! GitBranchWithIcon()
  let branch = fugitive#head()
  let icon = ' '
  return  icon . branch
endfunction

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unnamed = '[No Name]'

"let g:lightline#bufferline#logo = ' '
"let g:lightline#bufferline#readonly_icon = ''

""let g:lightline#bufferline#modified = '✏️'
"let g:lightline#bufferline#modified = '✎'
"let g:lightline#bufferline#git_icon = ' '
"let g:lightline#bufferline#ellipsis_icon = '..'
"let g:lightline#bufferline#expand_left_icon = '◀ '
"let g:lightline#bufferline#expand_right_icon = ' ▶'
"let g:lightline#bufferline#active_buffer_left_icon = ''
"let g:lightline#bufferline#active_buffer_right_icon = ''
"let g:lightline#bufferline#separator_icon = '  '

"" lightline-buffer function settings
"let g:lightline#bufferline#show_bufnr = 1
"let g:lightline#bufferline#rotate = 0
"let g:lightline#bufferline#fname_mod = ':t'
"let g:lightline#bufferline#excludes = ['vimfiler']

"let g:lightline#bufferline#maxflen = 30
"let g:lightline#bufferline#maxfextlen = 3
"let g:lightline#bufferline#minflen = 16
"let g:lightline#bufferline#minfextlen = 3
"let g:lightline#bufferline#reservelen = 20
