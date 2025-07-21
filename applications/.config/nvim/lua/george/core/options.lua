vim.g.netrw_liststyle = 3

local opt = vim.opt

opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = true
opt.signcolumn = "yes"
opt.scrolloff = 8

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- terminal settings
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

-- Paste anything from neovim to OS clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
-- Undo
opt.swapfile = false
opt.backup = false

if vim.fn.isdirectory("/tmp/.vim-undo-dir") == 0 then
  vim.fn.mkdir("/tmp/.vim-undo-dir", "", 0700)
end

---@diagnostic disable-next-line: assign-type-mismatch
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
