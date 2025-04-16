----------------------------------------
-- Plugin using to customise bottom line
----------------------------------------

-- Colors using in plugin
local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local function macro()
	local char = vim.fn.reg_recording()
	if char ~= "" then
		return "<" .. char .. ">"
	else
		return ""
	end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "codedark",
				component_separators = { left = "/", right = "" },
			},
			sections = {
				lualine_b = { { "filename", color = "LualineWhite" } },
				lualine_c = {
					{ "branch", icon = { "" }, color = "LualineGreen" },
					"diff",
					"diagnostics",
				},
				lualine_x = {
					{ macro, icon = { "󰑋", color = { fg = "#cc3300" } } },
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
