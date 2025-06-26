return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			open_mapping = "<leader>ot",
			float_opts = {
				title_pos = "center",
				border = "curved",
			},
			winbar = {
				enabled = true,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		})
		vim.api.nvim_set_keymap("t", "jk", [[<C-\><C-n>]], { noremap = true })
	end,
}
