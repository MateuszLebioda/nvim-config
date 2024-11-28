----------------------------------------------------------------
-- Plugin allow to create and resotre nvim sessions
-- For example you have project /x and within you have
-- open 2 tabs. When you save session using `<leader>ss`
-- and close nvim you can restore it after open nvim next time 
----------------------------------------------------------------


return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

    local keymap = vim.keymap

    keymap.set('n','<leader>ss', "<cmd>SessionSave<CR>", {desc = 'Save session for auto session rot directory'})
    keymap.set('n','<leader>sr', "<cmd>SessionRestore<CR>", {desc = 'Restore sessio for cwd'})
	end,
}
