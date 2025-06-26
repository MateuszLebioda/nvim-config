local Icons = {
	actions = "󱐋",
	brackets = "󰅩",
	buffers = "",
	comment = " ",
	code = "󰘦",
	debug = "",
	directory = "",
	error = "",
	explorer = "󰙅",
	find = "",
	git = "󰊢",
	info = "",
	mark = "󰙒",
	open = "󰏋",
	panels = "",
	replace = "",
	tabs = "󰓩",
	terminal = "",
	trace = "✎",
	warn = "",
	wrap = "󰗅",
	session = "",
	git_icon = {
		add = "",
		modified = "",
		unstaged = "",
	},
}

function Icons.with_space(icon)
	return " " .. icon .. " "
end

return Icons
