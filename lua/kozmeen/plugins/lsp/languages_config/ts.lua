local M = {}

function M.add_kyebinding()
	local ws = require("which-key")
	ws.add({ "<leader>lj", "Jest" })
	vim.keymap.set("n", "<leader>ljf", ":JestFile<CR>", { desc = "Run jest test for current file" })
end

return M
