----------------------------------------
-- Plugin using to customise bottom line
----------------------------------------


local function init()
	require('lualine').setup({
		options = {
			theme = "codedark",
			sections = {lualine_b = {"branch", "diff"}}, 
			component_separators = { left = '/', right = ''},
		}
	})
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, config = init
}
