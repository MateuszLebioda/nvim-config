-- Telescope:
---------------------------------------------------------
-- Plugin to fusy find files in cwd ( and not only here )
---------------------------------------------------------

-- Telescope ui:
----------------------------------------------------------------
-- Plugin to open some kind of inputs (using for example in LSP)
----------------------------------------------------------------

function godot_file_filter()
	local telescope = require("telescope")
	local utils = require("kozmeen.core.utils")
	local goodot_project_file = vim.fn.getcwd() .. "/project.godot"

	if utils.file_exists(goodot_project_file) then
		telescope.setup({
			defaults = {
				file_ignore_patterns = godot_ignore_patterns(),
			},
		})
	end
end

function godot_ignore_patterns()
	return {
		"%.png",
		"%.jpg",
		"%.jpeg",
		"%.bmp",
		"%.gif",
		"%.tiff",
		"%.svg",
		"%.tmp",
	}
end

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

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"isak102/telescope-git-file-history.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cws" })

			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })

			vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<CR>", { desc = "List or registers" })

			vim.keymap.set("n", "<leader>fG", "<cmd>Telescope git_file_history<CR>", { desc = "Git file commits" })
			vim.keymap.set("n", "<leader>fg", function()
				require("telescope.builtin").git_status()
			end, { desc = "Git chages files" }) -- show diagnostics for file

			vim.keymap.set("n", "<leader>fo", function()
				require("telescope.builtin").oldfiles({
					cwd_only = true,
					path_display = { "relative" },
				})
			end, { desc = "List old files" })

			vim.keymap.set(
				"n",
				"<leader>fd",
				"<cmd>Telescope diagnostics bufnr=0<CR>",
				{ desc = "Errors in current file" }
			) -- show diagnostics for file
			vim.keymap.set("n", "<leader>fm", "<cmd>Telescope notify <CR>", { desc = "Messages" }) -- show diagnostics for file
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags <CR>", { desc = "Help" }) -- show diagnostics for file
			registerTerminalPicker()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<A-k>"] = require("telescope.actions").preview_scrolling_up,
							["<A-j>"] = require("telescope.actions").preview_scrolling_down,
							["<Esc>"] = require("telescope.actions").close,
						},
						n = {
							["<A-k>"] = require("telescope.actions").preview_scrolling_up,
							["<A-j>"] = require("telescope.actions").preview_scrolling_down,
							["s"] = require("telescope.actions").select_vertical,
							["t"] = require("telescope.actions").select_tab,
						},
					},
					layout_strategy = "vertical",
					layout_config = {
						width = 0.8,
						height = 0.9,
						mirror = true,
						preview_cutoff = 1,
						preview_height = 0.6,
					},
				},
			})
			godot_file_filter()
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
