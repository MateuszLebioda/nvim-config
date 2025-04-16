---------------------------------
-- Plugin show indent very smooth
---------------------------------

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local ibl = require("ibl")
		local hooks = require("ibl.hooks")

		local highlight = {
			"CustomBlue",
		}

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "CustomBlue", { fg = "#6584C4" })
		end)

		ibl.setup({
			indent = { char = "┊", highlight = highlight },
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
		})
	end,
}
