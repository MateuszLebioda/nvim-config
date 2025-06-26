--Plugin to fancy cmd line

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			format = {
				searchAndReplace = { pattern = { "^:%%?s/" }, icon = "󱈅", lang = "regex" },
				search_down = {
					kind = "cmdline",
					pattern = "^/",
					icon = " ",
					lang = "regex",
				},
				search_up = { kind = "cmdline", pattern = "^%?", icon = " ", lang = "regex" },
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
