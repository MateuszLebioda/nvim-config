vim.g.mapleader = " "

local keymap = vim.keymap

-- global
keymap.set({ "n", "v" }, "H", "_", { desc = "Move to start line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Move to end line" })

--Navigation
vim.keymap.set({ "n", "v" }, "J", "<C-d>zz", { noremap = true, silent = true, desc = "Nawigacja w dółstrony" })
vim.keymap.set({ "n", "v" }, "K", "<C-u>zz", { noremap = true, silent = true, desc = "Nawigacja w górę" })

-- Exit INSERT mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Search
keymap.set("n", "<leader>as", ":nohl<CR>", { desc = "Clear search result highlights" })

-- Increment/decrtement
keymap.set("n", "<leader>r+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>r-", "<C-x>", { desc = "Decrement number" })

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

keymap.set("n", "<leader>pH", "<C-w>H", { desc = "Move current panel to left" })
keymap.set("n", "<leader>pL", "<C-w>L", { desc = "Move current panel to right" })
keymap.set("n", "<leader>pJ", "<C-w>K", { desc = "Move current panel down" })
keymap.set("n", "<leader>pK", "<C-w>J", { desc = "Move current panel up" })

keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to previous panel" })
keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to next panel" })
keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to up panel" })
keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to down panel" })

keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Vertical resize +" })
keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Vertical resize -" })

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<A-e>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<A-q>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Oppent current buffer in new tab" })

-- Buffers
keymap.set("n", "<leader>bp", "<C-o>", { noremap = true, silent = true, desc = "Open previous buffer" })
keymap.set("n", "<leader>bn", "<C-i>", { noremap = true, silent = true, desc = "Open next buffer" })

--Makr
keymap.set("n", "<leader>ma", "<Esc>gg0vG$zz", { noremap = true, silent = true, desc = "Mark all file content" })

if vim.fn.has("win32") then
	keymap.set("n", "<leader>oep", function()
		vim.cmd("OpenExplorer cwd")
	end, { noremap = true, silent = true, desc = "Project directory" })
	keymap.set("n", "<leader>oec", function()
		vim.cmd("OpenExplorer buffer")
	end, { noremap = true, silent = true, desc = "Current buffer directory" })
end
