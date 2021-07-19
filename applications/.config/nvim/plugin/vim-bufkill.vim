let s:bufkill_enabled = isdirectory($HOME.'/.config/nvim/plugged/vim-bufkill')

function! s:load_bufkill() abort
  " Close buffer without closing the window
  " map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
  " map <leader>q :BD<CR>
  "
  " Show all buffers
  nnoremap <F5> :buffers<CR>:buffer<Space>
  nnoremap <C-PAGEDOWN> :bnext<CR>
  nnoremap <C-PAGEUP> :bprevious<CR>
  nnoremap ]b :bnext<CR>
  nnoremap [b :bprevious<CR>

  nmap <silent> <Leader>bb    :buffers<CR>:buffer<Space>

  if s:bufkill_enabled
    nmap <silent> <Leader>bn    :bnext<CR>
    nmap <silent> <Leader>bp    :bprevious<CR>
    nmap <silent> <Leader>q    <Plug>BufKillBd
    nmap <silent> <Leader>bu    <Plug>BufKillUndo
  endif
  if g:enable_whichkey
    let g:which_key_map.b = { 'name': '+Buffer' }
    let g:which_key_map.b.n = 'Next Buffer'
    let g:which_key_map.b.p = 'Prev Buffer'
    let g:which_key_map.b.d = 'Kill Buffer'
    let g:which_key_map.b.q = 'Kill Buffer'
    let g:which_key_map.b.u = 'Undo Kill'
  endif
endfunction


if !exists('g:vscode')
  call s:load_bufkill()
endif
