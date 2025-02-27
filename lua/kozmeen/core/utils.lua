local Utils = {}

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

Utils.print_table = print_table
return Utils
