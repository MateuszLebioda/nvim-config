----------------------------------
-- Plusing help work with AST tree
----------------------------------

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"styled",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"gdscript",
				"godot_resource",
				"gdshader",
				"bash",
				"lua",
				"dockerfile",
				"gitignore",
				"sql",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>mi",
					node_incremental = "<leader>mi",
					scope_incremental = "<leader>ms",
					node_decremental = "<leader>mb",
				},
			},
		})
	end,
}
