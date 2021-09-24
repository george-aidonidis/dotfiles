let s:coc_enabled = isdirectory($HOME.'/.config/nvim/plugged/coc.nvim')

" Jump definition in other window
function! s:definition_other_window() abort
  if winnr('$') >= 4 || winwidth(0) < 120
    exec "normal \<Plug>(coc-definition)"
  else
    exec 'vsplit'
    exec "normal \<Plug>(coc-definition)"
  endif
endfunction

function! s:load_coc() abort
  if s:coc_enabled
    command! -nargs=0 Lint :call CocAction('runCommand', 'eslint.executeAutofix')
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    nmap <F8> :Lint<CR>

    " " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd :<C-u>call <sid>definition_other_window()<CR>
    nmap <silent> gD <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    " nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
    nmap <silent> <leader>kb :CocCommand explorer<CR>
    nmap <silent> <leader>kf :CocCommand explorer --preset floating<CR>


    if g:enable_whichkey
      let g:which_key_map.c = { 'name': '+Coc' }
      let g:which_key_map.k = { 'name': '+Tree' }
      let g:which_key_map.k.b = 'Toggle tree'
      let g:which_key_map.k.f = 'Toggle tree in floating mode'
    endif
  endif
endfunction

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:load_coc_jest() abort
  if s:coc_enabled
    " Run jest for current project
    command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

    " Run jest for current file
    command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

    " Run jest for current test
    nnoremap <leader>tf :call CocAction('runCommand', 'jest.singleTest')<CR>
    nnoremap <leader>tn :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

    " Init jest in current cwd, require global jest command exists
    command! JestInit :call CocAction('runCommand', 'jest.init')
  endif
endfunction

if !exists('g:vscode')
  call s:load_coc()
endif
