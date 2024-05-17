local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }}
}
local opts = {}

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opt)
require("catppuccin").setup()

local builtin = require("telescope.builtin")

local function toogle_spell_check()
	vim.opt.spell = not(vim.opt.spell:get())
end

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
vim.keymap.set('n', '<F5>', toogle_spell_check)
vim.cmd("set spelllang=en_us,pl")
vim.cmd("setlocal spell")
vim.cmd("set relativenumber")
vim.cmd.colorscheme "catppuccin" 


