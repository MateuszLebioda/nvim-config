return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				normal = "<leader>wi",
				delete = "<leader>wd",
				change = "<leader>wc",
				visual = "<leader>w",
			},
		})
	end,
}
