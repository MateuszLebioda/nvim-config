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
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Close currnet split" })

-- Windows movement
keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })

-- Window size
keymap.set("n", "<A-Up>", ":resize +2<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-Down>", ":resize -2<CR>", { noremap = true, silent = true })
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
