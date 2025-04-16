---------------------
-- Explorer files
----------------------

local function open_on_setup()
	if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
		vim.cmd("enew") -- pusty bufor
		vim.cmd("cd " .. vim.fn.argv(0)) -- ustaw katalog roboczy
		vim.cmd("silent! bdelete 1") -- usuń bufor otwarty przez plugin
	end
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	config = function()
		local neo_tree = require("neo-tree")
		neo_tree.setup({
			popup_border_style = "rounded",
			open_on_setup = false,
			filtered_items = {
				visible = true,
				show_hidden_cout = true,
				hide_dotfile = false,
				hide_gitignore = false,
			},
			window = {
				position = "float",
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toogle Neotree window" })
		keymap.set("n", "<leader>ef", "<cmd>Neotree %<CR>", { desc = "Open Neotree with current file" })
		keymap.set("n", "<leader>eg", "<cmd>Neotree float git_status<CR>", { desc = "Open git status window" })
	end,

	init = function()
		open_on_setup()
	end,
}
