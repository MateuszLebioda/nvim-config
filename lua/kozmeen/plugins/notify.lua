local Icons = require("kozmeen.core.icons")

return {
	"rcarriga/nvim-notify",
	opts = {
		render = "compact",
		stages = "fade",
		top_down = false,
		max_width = function()
			local ui = vim.api.nvim_list_uis()[1]
			return ui.width / 2
		end,
		icons = {
			DEBUG = Icons.with_space(Icons.debug),
			ERROR = Icons.with_space(Icons.error),
			INFO = Icons.with_space(Icons.info),
			TRACE = Icons.with_space(Icons.trace),
			WARN = Icons.with_space(Icons.warn),
		},
	},
}
