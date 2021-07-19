let s:fug_enabled = isdirectory($HOME.'/.config/nvim/plugged/vim-fugitive')

function! s:load_fugitive() abort
  if s:fug_enabled
    " Show commits for every source line
    " nnoremap <Leader>gB :Gblame<CR>
    nnoremap <Leader>gc :G commit<CR>
    nnoremap <Leader>gg :G<CR>
    " Copy GH url line to clipboard
    nnoremap <Leader>gb :GBrowse!<CR>
    " Open current line in the browser
    nnoremap <Leader>gB :.GBrowse<CR>
    nnoremap <Leader>gl :Git log<CR>

    " Open visual selection in the browser
    vnoremap <Leader>gB :GBrowse<CR>
    " Copy visual selection url line to clipboard
    vnoremap <Leader>gb :GBrowse!<CR>

    if g:enable_whichkey
      let g:which_key_map.g = { 'name': '+Version Control'}

      let g:which_key_map.g.c = 'Git commit'
      let g:which_key_map.g.g = 'Git fugitive main'
      let g:which_key_map.g.b = 'Copy line in clipboard'
      let g:which_key_map.g.B = 'Open line in browser'
      let g:which_key_map.g.l = 'Git log'
    endif
  endif
endfunction

if !exists('g:vscode')
  call s:load_fugitive()
endif
