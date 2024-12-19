local nvim_config_home = vim.fn.stdpath("config")
vim.env.PATH = vim.env.PATH .. nvim_config_home .. "/node_modules"
