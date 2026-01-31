local current_dir = vim.fn.stdpath("config") .. "/lua/kozmeen/fast-spell-config/"
return {
	"lucaSartore/fastspell.nvim",
	-- automatically run the installation script on windows and linux)
	-- if this doesn't work for some reason, you can

	build = function()
		local install_libs = vim.fn.stdpath("data")
			.. "/lazy/fastspell.nvim/lua/scripts/install."
			.. (vim.fn.has("win32") and "cmd" or "sh")
		print(install_libs)
		vim.system({ install_libs })

		local install_dictionary = current_dir
			.. "scripts/install_directories."
			.. (vim.fn.has("win32") and "cmd" or "sh")
		vim.system({ install_dictionary })
	end,

	config = function()
		local fastspell = require("fastspell")

		fastspell.setup({
			cspell_json_file_path = current_dir .. "cspell.json",
		})

		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
			callback = function(_)
				local first_line = vim.fn.line("w0") - 1
				local last_line = vim.fn.line("w$")
				fastspell.sendSpellCheckRequest(first_line, last_line)
			end,
		})
	end,
}
