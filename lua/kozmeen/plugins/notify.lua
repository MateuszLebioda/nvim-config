local Icons = require("kozmeen.core.icons")

return {
	"rcarriga/nvim-notify",
	opts = {
		render = "compact",
		stages = "fade",
		top_down = false,
		icons = {
			DEBUG = Icons.with_space(Icons.debug),
			ERROR = Icons.with_space(Icons.error),
			INFO = Icons.with_space(Icons.info),
			TRACE = Icons.with_space(Icons.trace),
			WARN = Icons.with_space(Icons.warn),
		},
	},
}
