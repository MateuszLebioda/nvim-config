--Function to open file, if file exist in opened buffer open this buffer
--if not, open file in new tab
vim.api.nvim_create_user_command("OpenFile", function(opts)
	require("kozmeen.core.utils").open_or_switch_to_file(opts.args)
end, { nargs = 1, complete = "file" })
