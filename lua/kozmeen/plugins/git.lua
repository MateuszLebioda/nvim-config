-----------------------------------------------------------------
-- Plugin show special symbol in line bar to show git status line
-- Plugin also show blame in currant line
-----------------------------------------------------------------

return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]g", gs.next_hunk, "Next Hunk")
				map("n", "[g", gs.prev_hunk, "Prev Hunk")

				-- Actions
				-- Stage
				map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
				map("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")

				-- Reset
				map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

				map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

				-- Blame
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")

				vim.keymap.set("n", "<leader>gd", function()
					vim.cmd("tab split")
					gs.diffthis()
				end, { desc = "Diff in new tab" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		},
	},
}
