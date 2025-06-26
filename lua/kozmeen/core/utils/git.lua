-- lua/kozmeen/core/utils/git.lua
local Job = require("plenary.job")

local M = {}
local status_cache = ""

local function get_status_for_current_file()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" or vim.fn.filereadable(file) == 0 then
		status_cache = ""
		return
	end

	Job:new({
		command = "git",
		args = { "status", "--porcelain", file },
		cwd = vim.fn.getcwd(),
		on_exit = function(j)
			local output = j:result()
			local line = output[1]

			if not line or line == "" then
				status_cache = "Clean"
				return
			end

			local x, y = line:sub(1, 1), line:sub(2, 2)

			local map = {
				["M "] = "Staged",
				[" M"] = "Modified",
				["A "] = "Staged",
				[" D"] = "Deleted",
				["R "] = "Renamed",
				["??"] = "Unstaged",
				["AM"] = "Staged",
				["MM"] = "Modified",
				["UU"] = "Unmerged",
			}

			local key = x .. y
			status_cache = map[key] or "Unstaged"
		end,
	}):start()
end

function M.status()
	return status_cache or ""
end

function M.update_git_status()
	get_status_for_current_file()
	return status_cache
end

-- Set autocommands to update status
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "CursorHold" }, {
	callback = get_status_for_current_file,
})

return M
