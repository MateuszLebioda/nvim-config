local Icons = {
	actions = "󱐋",
	brackets = "󰅩",
	buffers = "",
	comment = " ",
	code = "󰘦",
	debug = "",
	directory = "",
	error = "󰅝",
	explorer = "󰙅",
	find = "",
	git = "󰊢",
	hint = "",
	info = "",
	mark = "󰙒",
	open = "󰏋",
	panels = "",
	replace = "",
	tabs = "󰓩",
	terminal = "",
	trace = "",
	warn = "",
	wrap = "󰗅",
	session = "",
	git_icon = {
		add = "",
		modified = "",
		unstaged = "",
	},
}

Icons.diagnostics_icon = {
	info = Icons.info,
	error = Icons.error,
	warn = Icons.warn,
	hint = Icons.hint,
}

function Icons.with_space(icon)
	return " " .. icon .. " "
end

return Icons
