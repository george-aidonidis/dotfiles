function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer    gui=NONE guibg=#1d212e guifg=#fff
  hi! BuffetActiveBuffer     gui=NONE guibg=#1a1d25 guifg=#6b717d
  hi! BuffetBuffer           gui=NONE guibg=#1a1d25 guifg=#6b717d
  hi! BuffetModCurrentBuffer gui=NONE guibg=#8be9fd guifg=#282a36
  hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#282a36
  hi! BuffetModBuffer        gui=NONE guibg=#ff5555 guifg=#282a36
  hi! BuffetTrunc            gui=NONE guibg=#D55FDE guifg=#282a36
  hi! BuffetTab              gui=NONE guibg=#D55FDE guifg=#282a36
endfunction

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
