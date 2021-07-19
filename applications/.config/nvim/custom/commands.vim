""""""""""""""""""
"Custom Commands "
""""""""""""""""""
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." |
echohl None
command! TrimWhiteSpace call TrimWhiteSpace()
" Quit from current buffer and move to previous one (does not close
" active window
command! Bd bp\|bd \#
if has("autocmd")
  filetype plugin indent on

  " Automatically clean trailing whitespace
  autocmd BufWritePre * call TrimWhiteSpace()
endif

" Return to the same line you left off at
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END
"""""""""""""
" Functions "
"""""""""""""
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun
