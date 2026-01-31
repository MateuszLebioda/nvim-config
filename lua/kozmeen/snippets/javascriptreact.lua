local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function component_name()
	local name = vim.fn.expand("%:t:r")
	return name:sub(1, 1):upper() .. name:sub(2)
end

ls.add_snippets("javascriptreact", {
	s("rafc", {
		t({ "import React from 'react'", "", "" }),
		t("export default function "),
		f(component_name),
		t({ "() {", "  return <div>" }),
		i(1),
		t({ "</div>;", "}" }),
	}),
})
