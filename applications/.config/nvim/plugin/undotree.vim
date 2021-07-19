function! s:load_undo_tree() abort
  " Navigate to active panes more easily
  nmap <silent> <leader>uu :UndotreeToggle<CR>
  if g:enable_whichkey
    let g:which_key_map.u = { 'name': '+Undo' }
    let g:which_key_map.u.u = 'Open undo tree'
  endif
endfunction

if !exists('g:vscode')
  call s:load_undo_tree()
endif
