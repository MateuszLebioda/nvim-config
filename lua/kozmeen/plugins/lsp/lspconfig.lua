local Icons = require("kozmeen.core.icons")

local function keybinding()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local telescope = require("telescope.builtin")
			local opts = { buffer = ev.buf, silent = true }

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "<leader>ir", '<cmd>Telescope lsp_references path_display={"tail"}<CR>', opts)

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "<leader>iD", "<cmd>Telescope lsp_definitions <CR>", opts)
			opts.desc = "Show LSP definitions in split"
			vim.keymap.set("n", "<leader>id", function()
				telescope.lsp_definitions({ jump_type = "vsplit" })
			end, opts)

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "<leader>ii", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "<leader>it", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)

			opts.desc = "Open documentation for what is under cursor"
			vim.keymap.set("n", "<leader>od", function()
				vim.cmd("Lspsaga hover_doc")
				vim.defer_fn(function()
					vim.cmd("Lspsaga hover_doc")
				end, 200)
			end, opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>al", ":LspRestart<CR>", opts)
		end,
	})
end

local function create_signs()
	local signs = { Error = Icons.error, Warn = Icons.warn, Hint = Icons.actions, Info = Icons.info }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

local function create_gdscript_config(capabilities)
	local lspconfig = require("lspconfig")
	local gdscript_config = {
		capabilities = capabilities,
		filetypes = { "gd", "gdscript", "gdscript3" },
	}

	if vim.fn.has("win32") == 1 then
		gdscript_config["cmd"] = { "ncat", "localhost", "6005" }
	end

	lspconfig.gdscript.setup(gdscript_config)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		keybinding()
		create_signs()
		create_gdscript_config(capabilities)

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				local nvim_config_home = vim.fn.stdpath("config")
				lspconfig["ts_ls"].setup({
					init_options = {
						plugins = {
							{
								name = "@styled/typescript-styled-plugin",
								location = nvim_config_home .. "/node_modules/@styled/typescript-styled-plugin",
							},
						},
						preferences = {
							importModuleSpecifierEnding = "js",
						},
					},
				})
			end,
			["graphql"] = function()
				lspconfig["graphql"].setup({
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
