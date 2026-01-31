local SnippetsUtils = require("kozmeen.snippets.snippets-utils")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

SnippetsUtils.add_snippet_to_filetypes({ "javascript", "javascriptreact", "typescriptreact", "typescript" }, {
	s("cl", {
		t({ "console.log(" }),
		i(1),
		t({ ");" }),
	}),
})
