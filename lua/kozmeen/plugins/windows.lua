return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()
		local windows = require("windows")
		windows.setup({
			autowidth = {
				enable = true, -- automatyczne dopasowanie szerokości okna
				winwidth = 5, -- minimalna szerokość okna
			},
			ignore = { -- Okna, które są ignorowane przy automatycznym dopasowaniu
				buftype = { "quickfix", "nofile", "terminal" },
				filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
			},
			animation = {
				enable = true, -- Włącz animacje
				duration = 200, -- Czas trwania animacji w ms
				fps = 30, -- Liczba klatek na sekundę
			},
		})
	end,
}
