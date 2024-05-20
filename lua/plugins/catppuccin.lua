local function init()
	vim.cmd.colorscheme "catppuccin" 
end

return {"catppuccin/nvim", nvimlazy = false, name = "catppuccin", priority = 1000, config = init }


