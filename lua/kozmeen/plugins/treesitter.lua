return {
	"nvim-treesitter/nvim-treesitter",
	tag = "v0.10.0",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
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
					init_selection = "<leader>mi",
					node_incremental = "<leader>mi",
					scope_incremental = "<leader>ms",
					node_decremental = "<leader>mb",
				},
			},
		})
	end,
}
