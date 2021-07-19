nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

let test#typescript#jest#options = {
  \ 'nearest': '--watch',
  \ 'file':    '--watch',
\}

let test#javascript#jest#options = {
  \ 'nearest': '--watch',
  \ 'file':    '--watch',
\}
