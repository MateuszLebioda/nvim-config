return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "Comment/Coda Actions", icon = "  " },
			{ "<leader>o", group = "Open", icon = " 󰏋 " },
			{ "<leader>e", group = "Explorer NeoTree", icon = " 󰙅 " },
			{ "<leader>f", group = "Find", icon = "  " },
			{ "<leader>a", group = "Mark text in AST mode", icon = " 󱫀 " },
			{ "<leader>g", group = "Git", icon = " 󰊢 " },
			{ "<leader>p", group = "Panels", icon = "  " },
			{ "<leader>t", group = "Tabs", icon = " 󰓩 " },
			{ "<leader>r", group = "Replace", icon = "  " },
			{ "<leader>s", group = "Session/Search", icon = " 󰥖 " },
			{ "<leader>d", group = "Diagnostic", icon = "  " },
			{ "<leader>w", group = "Wrap text", icon = " 󰗅 " },
			{ "<leader>b", group = "Buffers", icon = "  " },
		})
	end,
	keys = {
		{
			"?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		icons = { group = "", rules = false },
		sort = { "group" },
	},
}
