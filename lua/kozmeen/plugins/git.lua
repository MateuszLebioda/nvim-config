-----------------------------------------------------------------
-- Plugin show special symbol in line bar to show git status line
-- Plugin also show blame in currant line
-----------------------------------------------------------------
local function undo_stage_buffer()
	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		print("Brak pliku do cofnięcia stage")
		return
	end

	-- Upewnij się, że plik jest zapisany przed cofnięciem stage
	vim.cmd("write")

	-- Cofnij stage tylko dla bieżącego pliku
	local cmd = string.format("git restore --staged %q", bufname)
	vim.fn.system(cmd)

	-- Odśwież gitsigns, żeby pokazał aktualny stan
	require("gitsigns").refresh()
end

-- Mapowanie np. pod leader + gs
vim.keymap.set("n", "<leader>gs", undo_stage_buffer, { desc = "Undo Git stage buffer" })

return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Navigation hunks
				vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
				vim.keymap.set("n", "<leader>gn", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })

				-- Actions
				-- Stage
				vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
				vim.keymap.set("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { buffer = bufnr, desc = "Stage hunk" })
				vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })

				vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
				vim.keymap.set("v", "<leader>gu", function()
					gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { buffer = bufnr, desc = "Undo stage hunk" })
				vim.keymap.set("n", "<leader>gU", undo_stage_buffer, { buffer = bufnr, desc = "Undo stage hunk" })

				-- Reset
				vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
				vim.keymap.set("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { buffer = bufnr, desc = "Reset hunk" })
				vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })

				-- Blame
				vim.keymap.set("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, { buffer = bufnr, desc = "Blame line" })
				vim.keymap.set(
					"n",
					"<leader>gB",
					gs.toggle_current_line_blame,
					{ buffer = bufnr, desc = "Toggle line blame" }
				)

				vim.keymap.set("n", "<leader>gd", function()
					vim.cmd("tab split")
					gs.diffthis()
				end, { desc = "Diff in new tab" })
			end,
		},
	},
}
