local function init()
	local builtin = require("telescope.builtin")
	vim.keymap.set('n', '<C-p>', builtin.find_files, {})
	vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
end

return {"nvim-relescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" }, config = init}
