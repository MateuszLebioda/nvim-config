---------------------
-- Explorer files
----------------------
local function hide_by_pattern()
	local hide = {}

	local utils = require("kozmeen.core.utils")
	local goodot_project_file = vim.fn.getcwd() .. "/project.godot"
	if utils.file_exists(goodot_project_file) then
		table.insert(hide, "*.tmp")
	end

	return hide
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
			filesystem = {
				hijack_netrw_behavior = "disabled",
				filtered_items = {
					hide_by_pattern = hide_by_pattern(),
				},
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toogle Neotree window" })
		keymap.set("n", "<leader>ef", "<cmd>Neotree %<CR>", { desc = "Open Neotree with current file" })
		keymap.set("n", "<leader>eg", "<cmd>Neotree float git_status<CR>", { desc = "Open git status window" })
	end,
}
