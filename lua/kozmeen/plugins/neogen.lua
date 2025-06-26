vim.keymap.set("n", "<leader>cd", function()
	vim.cmd("Neogen")
end, { desc = "Generate documentation comment" })

return {
	"danymat/neogen",
	config = true,
}
