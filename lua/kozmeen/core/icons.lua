local Icons = {
	actions = "󱐋",
	brackets = "󰅩",
	buffers = "",
	comment = " ",
	code = "󰘦",
	debug = "",
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
	trace = "✎",
	warn = "",
	wrap = "󰗅",
	session = "",
}

function Icons.with_space(icon)
	return " " .. icon .. " "
end

return Icons
