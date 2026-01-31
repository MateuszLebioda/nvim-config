local Icons = require("kozmeen.core.icons")

vim.keymap.set({ "n", "v" }, "<leader>nd", function()
	require("notify").dismiss({ pending = true, silent = true })
end, { desc = "Dismiss notification" })

return {
	"rcarriga/nvim-notify",
	opts = {
		render = "compact",
		stages = "fade",
		top_down = false,
		icons = {
			DEBUG = Icons.with_space(Icons.debug),
			ERROR = Icons.with_space(Icons.diagnostics_icon.error),
			INFO = Icons.with_space(Icons.diagnostics_icon.info),
			TRACE = Icons.with_space(Icons.trace),
			WARN = Icons.with_space(Icons.diagnostics_icon.warn),
		},
	},
}
