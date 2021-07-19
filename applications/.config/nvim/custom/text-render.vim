""""""""""""""""""
" Text rendering "
""""""""""""""""""
" Avoid wrapping a line in the middle of a word.
set linebreak
" Enable line wrapping.
set wrap
" The number of screen lines to keep above and below the cursor.
" set scrolloff=3
" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5
" Enable syntax highlighting.
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

