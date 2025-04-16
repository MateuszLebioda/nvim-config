local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local function custom_input(opts, on_confirm)
	local default_opts = {
		position = {
			row = vim.fn.winline() + 1,
			col = vim.fn.wincol() - 20,
		},
		size = {
			width = 40,
		},
		border = {
			style = "rounded",
			text = { top = " " .. opts.prompt, top_align = "center" },
		},
		win_options = {
			winhighlight = "Normal:CustomNormal,FloatBorder:CustomBorder",
		},
	}

	opts = vim.tbl_extend("force", opts, default_opts)

	local input = Input(opts, {
		prompt = " > ",
		default_value = opts.default,
		on_submit = function(value)
			on_confirm(value)
		end,
	})
	input:mount()

	input:on(event.BufLeave, function()
		input:unmount()
	end)

	input:map("n", "<Esc>", function()
		input:unmount()
	end, { noremap = true, silent = true })
	input:map("i", "<Esc>", function()
		input:unmount()
	end, { noremap = true, silent = true })
end

vim.ui.input = custom_input -- nadpisz tymczasowo
