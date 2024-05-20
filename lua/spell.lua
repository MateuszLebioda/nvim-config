
local function toogle_spell_check()
	vim.opt.spell = not(vim.opt.spell:get())
end


vim.keymap.set('n', '<F5>', toogle_spell_check)
vim.cmd("set spelllang=en_us,pl")
vim.cmd("setlocal spell")
