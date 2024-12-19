local function toogle_spell_check()
	local value = not (vim.opt.spell:get())
	vim.opt.spell = value
	if value == true then
		vim.api.nvim_echo({ { "Spell now is not active", "None" } }, false, {})
	else
		vim.api.nvim_err_writeln("Spell now is not active")
	end
end

vim.keymap.set("n", "<F5>", toogle_spell_check, { desc = "Toogle spell check" })
