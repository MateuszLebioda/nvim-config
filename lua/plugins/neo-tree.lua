local function init()
	require("neo-tree").setup({
	filtered_items = {
			visible = true,
			show_hidden_cout = true,
			hide_dotfile = false,
			hide_gitignore = false
		}
	})

	local function action()
	
		local manager = require("neo-tree.sources.manager")
  		local renderer = require("neo-tree.ui.renderer")

  		local state = manager.get_state("filesystem")
  		local window_exists = renderer.window_exists(state)

		if window_exists == true then 
			vim.cmd(":Neotree close")
		else
			vim.cmd(":Neotree filesystem reveal left")
		end

	end

	vim.keymap.set('n', '<C-b>', action)
end

return {"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}, config = init}
