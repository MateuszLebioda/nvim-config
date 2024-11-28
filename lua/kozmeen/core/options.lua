local opt = vim.opt

-- Lines numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indent
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.softtabstop = 2

-- Search
opt.ignorecase = true -- ignore case when search
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitive

-- Cursor
opt.cursorline = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Properties of default explorer to looks more like tree
vim.cmd("let g:netrw_liststyle = 3")
