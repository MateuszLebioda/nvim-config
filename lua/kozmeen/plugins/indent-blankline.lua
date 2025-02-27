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
			"RainbowGreen",
		}

		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6584C4" })
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
