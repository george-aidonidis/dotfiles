" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false } }

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--tiebreak=end', '--info=inline']}, <bang>0)

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false }})
"
" nnoremap <leader>9 :FzfPreviewGitStatus<CR>
" nnoremap <leader>p :FzfPreviewBuffers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <silent> <Leader>ff :Rg<cr>

nnoremap <silent> <leader>fw :Rg <c-r><c-w><CR>
