local function registerTerminalPicker()
	local toggleterm = require("toggleterm.terminal")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local previewers = require("telescope.previewers")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local function toggleterm_picker()
		local terms = toggleterm.get_all()
		local entries = {}

		for _, term in ipairs(terms) do
			table.insert(entries, {
				display = "Terminal " .. term.id,
				ordinal = tostring(term.id),
				id = term.id,
				bufnr = term.bufnr,
			})
		end

		pickers
			.new({}, {
				prompt_title = "ToggleTerm Terminals",
				finder = finders.new_table({
					results = entries,
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry.display,
							ordinal = entry.ordinal,
							bufnr = entry.bufnr,
						}
					end,
				}),
				sorter = conf.generic_sorter({}),
				previewer = previewers.new_buffer_previewer({
					define_preview = function(self, entry)
						local bufnr = entry.value.bufnr
						if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
							vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "Brak zawartości terminala" })
							return
						end

						local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
						if #lines == 0 then
							lines = { "[terminal pusty]" }
						end

						vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
					end,
				}),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						local term = toggleterm.get(selection.value.id)
						if term then
							term:toggle()
						end
					end)
					return true
				end,
			})
			:find()
	end

	-- Przykład mapowania klawisza
	vim.keymap.set("n", "<leader>ft", toggleterm_picker, { desc = "ToggleTerm Picker (Telescope)" })
end

return registerTerminalPicker
