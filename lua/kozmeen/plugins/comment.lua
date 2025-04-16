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

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
			toggler = {
				line = "<leader>cll",
				block = "<leader>cbb",
			},
			opleader = {
				line = "<leader>cl",
				block = "<leader>cb",
			},
		})
	end,
}
