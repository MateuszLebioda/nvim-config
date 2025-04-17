local Utils = {}

local function is_no_name_buffer()
	local buf_name = vim.api.nvim_buf_get_name(0) -- 0 oznacza bieżący bufor
	print(buf_name)
	return buf_name == ""
end

function Utils.file_exists(filepath)
	local f = io.open(filepath, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

function Utils.open_or_switch_to_file(file_path)
	local absolute_path = vim.fn.fnamemodify(file_path, ":p")

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local bufer_name = vim.api.nvim_buf_get_name(buf)
			if bufer_name == absolute_path then
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_win_get_buf(win) == buf then
						vim.api.nvim_set_current_win(win)
						return
					end
				end
				vim.cmd("tabnew")
				vim.cmd("buffer " .. buf)
				return
			end
		end
	end
	print(is_no_name_buffer())
	if is_no_name_buffer() then
		vim.cmd("e " .. vim.fn.fnameescape(file_path))
	else
		vim.cmd("tabnew " .. vim.fn.fnameescape(file_path))
	end
end

function Utils.print_table_keys(table)
	local indent = 1
	if type(table) ~= "table" then
		print(string.rep(" ", indent) .. tostring(table))
		return
	end

	for k, v in pairs(table) do
		local key_str = string.rep(" ", indent) .. tostring(k) .. ":"
		print(key_str)
	end
end

local function print_table(table, indent)
	indent = indent or 0
	if type(table) ~= "table" then
		print(string.rep(" ", indent) .. tostring(table))
		return
	end

	for k, v in pairs(table) do
		local key_str = string.rep(" ", indent) .. tostring(k) .. ":"
		if type(v) == "table" then
			print(key_str .. "{")
			print_table(v, indent + 1)
			print(string.rep(" ", indent) .. "}")
		else
			print(key_str .. tostring(v))
		end
	end
end

Utils.print_table = print_table
return Utils
