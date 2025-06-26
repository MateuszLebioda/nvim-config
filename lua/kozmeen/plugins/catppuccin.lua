-- colorscheme

-- local function init()
-- 	vim.cmd.colorscheme "catppuccin"
-- end
--
-- return {"catppuccin/nvim", nvimlazy = false, name = "catppuccin", priority = 1000, config = init }

return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").load()
	end,
}
