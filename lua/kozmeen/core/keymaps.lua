vim.g.mapleader = " "

local keymap = vim.keymap

-- Exit INSERT mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Search
keymap.set("n", "<leader>sc", ":nohl<CR>", { desc = "Clear search result highlights" })

-- Increment/decrtement
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Panel manager
keymap.set("n", "<leader>pv", function()
	vim.cmd("vsplit")
	vim.cmd("enew")
end, { desc = "Split window vertically" })
keymap.set("n", "<leader>ph", function()
	vim.cmd("split")
	vim.cmd("enew")
end, { desc = "Split window horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Close currnet split" })

-- keymap.set("n", "<leader>pH", "<cmd>wincmd H<CR>", { desc = "Move current panel to left" })
-- keymap.set("n", "<leader>pL", "<cmd>wincmd L<CR>", { desc = "Move current panel to right" })
-- keymap.set("n", "<leader>pJ", "<cmd>wincmd J<CR>", { desc = "Move current panel down" })
-- keymap.set("n", "<leader>pK", "<cmd>wincmd H<CR>", { desc = "Move current panel up" })

keymap.set("n", "<leader>pH", "<C-w>H", { desc = "Move current panel to left" })
keymap.set("n", "<leader>pL", "<C-w>L", { desc = "Move current panel to right" })
keymap.set("n", "<leader>pJ", "<C-w>K", { desc = "Move current panel down" })
keymap.set("n", "<leader>pK", "<C-w>J", { desc = "Move current panel up" })

keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to previous panel" })
keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to next panel" })
keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to up panel" })
keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to down panel" })

-- Window size
-- keymap.set("n", "<A-Up>", ":resize +2<CR>", { noremap = true, silent = true })
-- keymap.set("n", "<A-Down>", ":resize -2<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<A-e>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<A-q>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Oppent current buffer in new tab" })

-- Buffers
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Open previous buffer i current" })
keymap.set("n", "<leader>bn", "<cmd>bprevious<CR>", { desc = "Open next buffer i current" })
