local Utils = {}

function Utils.is_current_filetype(types)
	if type(types) ~= "table" then
		types = { types }
	end

	local filetype = vim.bo.filetype
	return vim.tbl_filter(function(e)
		return e == filetype
	end, types)
end

function Utils.get_current_buffer_directory()
	return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
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

---@param direction '"up"'|'"down"'|'"left"'|'"right"'
function Utils.OpenSplit(direction)
	local split_cmd = {
		up = "aboveleft split",
		down = "split",
		left = "leftabove vsplit",
		right = "vsplit",
	}

	if not split_cmd[direction] then
		vim.notify("Invalid direction: " .. tostring(direction), vim.log.levels.ERROR)
		return
	end
	vim.cmd(split_cmd[direction])
end
---
---@param direction '"up"'|'"down"'|'"left"'|'"right"'
function Utils.ChangeSplit(direction)
	local split_cmd = {
		up = "k",
		down = "j",
		left = "h",
		right = "l",
	}

	if not split_cmd[direction] then
		vim.notify("Invalid direction: " .. tostring(direction), vim.log.levels.ERROR)
		return
	end
	vim.cmd("wincmd " .. split_cmd[direction])
end

---@param direction '"up"'|'"down"'|'"left"'|'"right"'
function Utils.TryChangeOrCreateNewSplit(direction)
	if Utils.has_window_on(direction) then
		Utils.ChangeSplit(direction)
		return
	end
	Utils.OpenSplit(direction)
end

function Utils.CustomComplete(arg, items)
	return vim.tbl_filter(function(item)
		return vim.startswith(item, arg)
	end, items)
end

---@param direction '"up"'|'"down"'|'"left"'|'"right"'
function Utils.has_window_on(direction)
	local split_cmd = {
		up = "k",
		down = "j",
		left = "h",
		right = "l",
	}
	local current = vim.fn.winnr()
	local target = vim.fn.winnr(split_cmd[direction])
	return target ~= current
end

Utils.print_table = print_table
return Utils
