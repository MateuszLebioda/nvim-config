----------------------------------
-- Plusing help work with AST tree
----------------------------------

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({ -- enable syntax highlighting
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
				"bash",
				"lua",
				"dockerfile",
				"gitignore",
				"sql",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ai",
					node_incremental = "<leader>ai",
					scope_incremental = "<leader>as",
					node_decremental = "<leader>ab",
				},
			},
		})
	end,
}
