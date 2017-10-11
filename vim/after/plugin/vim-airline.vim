 """" Airline """""
" Configure the Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 7
" Enable the patched Powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
