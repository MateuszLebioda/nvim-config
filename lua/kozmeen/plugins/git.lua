-----------------------------------------------------------------
-- Plugin show special symbol in line bar to show git status line
-- Plugin also show blame in currant line
-----------------------------------------------------------------
local function update_status_await()
	vim.defer_fn(function()
		print("Half a second later...")
		vim.cmd("GitStatusRefresh")
	end, 500)
end

return {
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Stage (git add)
				vim.keymap.set("v", "<leader>gA", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					update_status_await()
				end, { desc = "Stage selected lines" })

				vim.keymap.set("n", "<leader>gA", function()
					gs.stage_hunk()
					update_status_await()
				end, { desc = "Stage selected hunk" })

				vim.keymap.set("n", "<leader>ga", function()
					vim.cmd("!git add " .. vim.api.nvim_buf_get_name(0))
					update_status_await()
				end, { desc = "Stage buffer" })

				vim.keymap.set("n", "<leader>g!a", function()
					vim.cmd("!git add -A")
					update_status_await()
				end, { desc = "Stage all files" })

				vim.keymap.set("n", "<leader>gcm", ":Git commit<CR>", { desc = "Commit" })
				vim.keymap.set("n", "<leader>gca", ":Git commit --amend<CR>", { desc = "Commit --ammedn" })

				--Diff
				vim.keymap.set("n", "<leader>gd", function()
					gs.preview_hunk()
				end, { desc = "Diff hunk" })
				vim.keymap.set("n", "<leader>gD", function()
					vim.cmd("tab split")
					gs.diffthis()
				end, { desc = "Diff in new tab" })

				-- Navigation hunks
				vim.keymap.set("n", "<leader>gn", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
				vim.keymap.set("n", "<leader>gp", gs.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })

				--Unstage (git reset)
				vim.keymap.set("v", "<leader>gU", function()
					gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					update_status_await()
				end, { buffer = bufnr, desc = "Undo stage selected lines" })

				vim.keymap.set("n", "<leader>gU", function()
					gs.undo_stage_hunk()
					update_status_await()
				end, { desc = "Undo stage selected hunk" })

				vim.keymap.set("n", "<leader>gu", function()
					vim.cmd("!git restore --staged " .. vim.api.nvim_buf_get_name(0))
					update_status_await()
				end, { desc = "Undo stage hunk" })

				vim.keymap.set("n", "<leader>g!u", function()
					vim.cmd("!git restore --staged *")
					update_status_await()
				end, { desc = "Stage all files" })

				-- Reset
				vim.keymap.set("n", "<leader>gE", function()
					gs.reset_hunk()
					update_status_await()
				end, { desc = "Reset hunk" })

				vim.keymap.set("v", "<leader>gE", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					update_status_await()
				end, { buffer = bufnr, desc = "Reset hunk" })

				vim.keymap.set("n", "<leader>ge", function()
					gs.reset_buffer()
					update_status_await()
				end, { buffer = bufnr, desc = "Reset buffer" })

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
			end,
		},
	},
}
