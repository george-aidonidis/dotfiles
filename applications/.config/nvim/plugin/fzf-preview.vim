" Add fzf quit mapping
let g:fzf_preview_quit_map = 1

" Use floating window (for neovim)
let g:fzf_preview_use_floating_window = 1

" Commands used for fzf preview.
" The file name selected by fzf becomes {}
" let g:fzf_preview_command = 'head -100 {-1}'                       " Not installed ccat and bat
let g:fzf_preview_command = 'bat --color=always --style=grid {-1}' " Installed bat
" let g:fzf_preview_command = 'ccat --color=always {-1}'             " Installed ccat

" Commands used for binary file
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'

" Commands used to get the file list from project
let g:fzf_preview_filelist_command = 'git ls-files --exclude-standard'               " Not Installed ripgrep
" let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep

" Commands used to get the file list from git reposiroty
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'

" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'

" Commands used to get the git status file list
let g:fzf_preview_git_status_command = "git status --short --untracked-files=all | awk '{if (substr($0,2,1) !~ / /) print $2}'"

" Commands used for project grep
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

" Commands used for preview of the grep result
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'

" Keyboard shortcuts while fzf preview is active
let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'

" Specify the color of fzf
let g:fzf_preview_fzf_color_option = ''

" Keyboard shortcut for opening files with split
let g:fzf_preview_split_key_map = 'ctrl-s'

" Keyboard shortcut for opening files with vsplit
let g:fzf_preview_vsplit_key_map = 'ctrl-v'

" Keyboard shortcut for opening files with tabedit
let g:fzf_preview_tabedit_key_map = 'ctrl-t'

" Keyboard shortcut for building quickfix
let g:fzf_preview_build_quickfix_key_map = 'ctrl-q'

" Command to be executed after file list creation
" let g:fzf_preview_filelist_postprocess_command = ''
" let g:fzf_preview_filelist_postprocess_command = 'xargs -d "\n" ls —color'          " Use dircolors
let g:fzf_preview_filelist_postprocess_command = 'xargs -d "\n" exa --color=always' " Use exa

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" devicons character width
let g:fzf_preview_dev_icon_prefix_length = 2

" DEPRECATED
" fzf window layout
let g:fzf_preview_layout = 'top split new'

" DEPRECATED
" Rate of fzf window
let g:fzf_preview_rate = 0.3

" DEPRECATED
" Key to toggle fzf window size of normal size and full-screen
let g:fzf_full_preview_toggle_key = '<C-s>'
