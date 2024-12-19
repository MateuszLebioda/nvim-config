---------------------
-- Explorer files
----------------------

local function init()
	require("neo-tree").setup({
		close_if_last_window = true,
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
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	config = init,
}
