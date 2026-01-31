local SnippetsUtils = {}

function SnippetsUtils.indent(level)
	local sw = vim.api.nvim_buf_get_option(0, "shiftwidth")
	return string.rep(" ", sw * (level or 1))
end

function SnippetsUtils.add_snippet_to_filetypes(filetypes, snippet)
	for _, ft in ipairs(filetypes) do
		ls.add_snippets(ft, snippet)
	end
end

return SnippetsUtils
