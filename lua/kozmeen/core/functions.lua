local Utils = require("kozmeen.core.utils")

vim.api.nvim_create_user_command("CustomSplit", function(opts)
	require("kozmeen.core.utils").OpenSplit(opts.args)
end, {
	nargs = 1,
	complete = function(args)
		return Utils.CustomComplete(args, { "up", "down", "left", "right" })
	end,
})

vim.api.nvim_create_user_command("JestFile", function(opts)
	local buf = vim.api.nvim_buf_get_name(0)
	local file_name = vim.fn.fnamemodify(vim.fs.basename(buf), ":r")
	local jest_command = "jest " .. file_name .. " -c " .. vim.fn.getcwd() .. "/jest.config.ts"
	require("toggleterm").exec(jest_command, 99)
end, {})

vim.api.nvim_create_user_command("OpenExplorer", function(opts)
	if vim.fn.has("win32") then
		if opts.args == "cwd" then
			vim.cmd("!explorer " .. vim.fn.getcwd())
		end
		if opts.args == "buffer" then
			vim.cmd("!explorer " .. Utils.get_current_buffer_directory():gsub("/", "\\"))
		end
	end
end, {
	nargs = 1,
	complete = function(args)
		return require("kozmeen.core.utils").CustomComplete(args, { "cwd", "buffer" })
	end,
})

vim.api.nvim_create_user_command("GitStatusRefresh", function(opts)
	print(require("kozmeen.core.utils.git").update_git_status())
end, {})
