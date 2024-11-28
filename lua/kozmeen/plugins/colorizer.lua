return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*", -- Domyślnie dla wszystkich plików
			css = { rgb_fn = true }, -- Specjalne wsparcie dla CSS
		})
	end,
}
