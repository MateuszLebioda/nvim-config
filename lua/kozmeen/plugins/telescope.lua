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
	-- local sorters = require("telescope.sorters")
	local goodot_project_file = vim.fn.getcwd() .. "/project.godot"

	if utils.file_exists(goodot_project_file) then
		telescope.setup({
			defaults = {
				file_ignore_patterns = godot_ignore_patterns(),
				-- sorting_strategy = "ascending",
			},
			-- pickers = {
			-- 	find_files = {
			-- 		sorter = sorters.Sorter:new({ scoring_function = godot_file_order }),
			-- 	},
			-- },
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

-- function godot_file_order(_, prompt, line)
-- 	local utils = require("kozmeen.core.utils")
-- 	local priority = {
-- 		[".gd"] = 1,
-- 	}
--
-- 	local defualt_priority = 10
--
-- 	-- utils.print_table(prompt)
-- 	utils.print_table(line)
-- 	-- local ext1 = entry1.value:match("^.+(%..+)$") or ""
-- 	-- local ext2 = entry2.value:match("^.+(%..+)$") or ""
-- 	--
-- 	-- local priority1 = priority[ext1] or defualt_priority
-- 	-- local priority2 = priority[ext2] or defualt_priority
-- 	--
-- 	-- if priority1 ~= priority2 then
-- 	-- 	return priority1 < priority2
-- 	-- end
-- 	--
-- 	-- return entry1.value < entry2.value
-- end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cws" })
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })
			vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<CR>", { desc = "List or registers" })
			vim.keymap.set("n", "<leader>fo", function()
				require("telescope.builtin").oldfiles({
					cwd_only = true,
					path_display = { "relative" },
				})
			end, { desc = "List old files" })

			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<A-k>"] = require("telescope.actions").move_selection_previous, -- Alt + k -> Up
							["<A-j>"] = require("telescope.actions").move_selection_next, -- Alt + j -> Down
						},
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
