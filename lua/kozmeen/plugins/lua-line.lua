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

local git = require("kozmeen.core.utils.git")
local git_icon = require("kozmeen.core.icons").git_icon
local icon_map = {
	Staged = { icon = git_icon.add, color = "#a6e22e" }, -- zielony +
	Modified = { icon = git_icon.modified, color = "#e6db74" }, -- żółty ~
	Unstaged = { icon = git_icon.unstaged, color = "#f92672" }, -- czerwony -
	-- Renamed = { icon = git_icon.rename, color = "#66d9ef" }, -- niebieski R
	-- Untracked = { icon = git_icon.untrack, color = "#888888" }, -- szary ?
	-- Conflict = { icon = git_icon.conflict, color = "#ff5f5f" }, -- jasnoczerwony
	-- Clean = { icon = "", color = "#5fafff" }, -- niebieski ✓
}

local function git_status()
	local status = git.status()
	local icon = icon_map[status] and icon_map[status].icon or ""
	return icon
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
				lualine_b = {
					{ "filename", color = "LualineWhite" },
					{
						git_status,
						color = function()
							local status = git.status()
							return icon_map[status] and { fg = icon_map[status].color } or {}
						end,
					},
					-- color = function()
					-- 	local status = git.component()
					-- 	local entry = icon_map[status]
					-- 	return entry and { fg = entry.color } or {}
					-- end,
				},
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
