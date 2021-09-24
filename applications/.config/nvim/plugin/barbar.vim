" Move to previous/next
nmap <silent> <Leader>bn    :BufferNext<CR>
nmap <silent> <Leader>bp    :BufferPrevious<CR>
nnoremap <C-PAGEDOWN> :BufferNext<CR>
nnoremap <C-PAGEUP> :BufferPrevious<CR>
nnoremap ]b :BufferNext<CR>
nnoremap [b :BufferPrevious<CR>
nnoremap <silent>    <Leader>, :BufferPrevious<CR>
nnoremap <silent>    <Leader>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <Leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <Leader>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <Leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <Leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <Leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <Leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <Leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <Leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <Leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <Leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <Leader>9 :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <Leader>p :BufferPin<CR>
" Close buffer
nnoremap <silent>    <Leader>q :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
