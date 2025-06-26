local Icons = require("kozmeen.core.icons")
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		local wk = require("which-key")
		wk.add({
			{ "<leader>a", mode = { "n", "v" }, group = "Actions", icon = Icons.with_space(Icons.actions) },
			{ "<leader>b", group = "Buffers", icon = Icons.with_space(Icons.buffers) },
			{ "<leader>c", mode = { "n", "v" }, group = "Comment", icon = Icons.with_space(Icons.comment) },
			{ "<leader>d", group = "Diagnostic", icon = Icons.with_space(Icons.debug) },
			{ "<leader>e", group = "Explorer", icon = Icons.with_space(Icons.explorer) },
			{ "<leader>f", group = "Find", icon = Icons.with_space(Icons.find) },
			{ "<leader>g", mode = { "n", "v" }, group = "Git", icon = Icons.with_space(Icons.git) },
			-- { "<leader>h", group = "", icon = Icons.with_space() },
			{ "<leader>i", group = "Implementation", icon = Icons.with_space(Icons.code) },
			-- { "<leader>j", group = "", icon = Icons.with_space() },
			-- { "<leader>k", group = "", icon = Icons.with_space() },
			{ "<leader>l", group = "LSP", icon = Icons.with_space(Icons.find) },
			{ "<leader>m", mode = { "n", "v" }, group = "Mark", icon = Icons.with_space(Icons.mark) },
			-- { "<leader>n", group = "", icon = Icons.with_space() },
			{ "<leader>o", group = "Open", icon = Icons.with_space(Icons.open) },
			{ "<leader>p", group = "Panels", icon = Icons.with_space(Icons.panels) },
			{ "<leader>r", group = "Replace", icon = Icons.with_space(Icons.replace) },
			{ "<leader>s", group = "Session", icon = Icons.with_space(Icons.session) },
			{ "<leader>t", group = "Tabs", icon = Icons.with_space(Icons.tabs) },
			{ "<leader>T", group = "Terminal", icon = Icons.with_space(Icons.terminal) },
			-- { "<leader>u", group = "", icon = Icons.with_space() },
			{ "<leader>w", group = "Wrap text", icon = Icons.with_space(Icons.wrap) },
			-- { "<leader>x", group = "", icon = Icons.with_space() },
			-- { "<leader>y", group = "", icon = Icons.with_space() },
			--{ "<leader>z", group = "", icon = Icons.with_space() },
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Which key help",
		},
	},
	opts = {
		icons = { group = "", rules = false },
		sort = { "group" },
	},
}
