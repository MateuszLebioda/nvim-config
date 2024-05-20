local function init()
	local config = require("nvim-treesitter.configs")
	config.setup({
		ensure_installed = {"lua", "javascript", "html", "json","json5", "markdown", "typescript", "java", "yaml", "xml", "styled", "sql", "css", "csv"},
		highlight = {enable = true},
		indent = {enable = true}
	})
end

return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = init}
