---------------------------------------------------------------------
-- Plugin help comment.
-- After using shortcuts you can use movments to mark commented lines
---------------------------------------------------------------------


return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
			opleader = {
				line = "<leader>cl",
				block = "<leader>cb",
			},
		})
	end,
}
