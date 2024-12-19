return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = false, -- Wyłącz ikony "Current Actions"
			},
			code_action = {
				enable = false, -- Całkowicie wyłącz funkcję "Code Action"
			},
			symbol_in_winbar = {
				enable = false, -- Wyłącz pasek symboli
			},
			outline = {
				enable = false, -- Wyłącz Outline
			},
			lightbulb = {
				enable = false, -- Wyłącz ikonę żarówki dla akcji
			},
			diagnostic = {
				on_insert = false, -- Wyłącz wyskakujące okienka w trybie insert
				on_insert_follow = false,
				insert_winblend = 0,
				show_code_action_icon = false, -- Wyłącz ikonę akcji w diagnostyce
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>ds", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
	end,
}
