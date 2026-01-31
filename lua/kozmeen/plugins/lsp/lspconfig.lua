local Utils = require("kozmeen.core.utils")
local Icons = require("kozmeen.core.icons")

local function open_split_in_buffor(fn)
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, _)
		if err or not result or vim.tbl_isempty(result) then
			vim.notify("Definition not found", vim.log.levels.WARN)
			return
		end

		fn()

		vim.lsp.util.jump_to_location(result[1], "utf-8")

		vim.cmd("normal! zz")
	end)
end

---@param direction '"up"'|'"down"'|'"left"'|'"right"'
local function open_split_definitions(direction)
	open_split_in_buffor(function()
		Utils.OpenSplit(direction)
	end)
end

---@param direction '"up"'|'"down"'|'"left"'|'"right"'
local function open_split_definitions_in_exist(direction)
	open_split_in_buffor(function()
		Utils.TryChangeOrCreateNewSplit(direction)
	end)
end

local function keybinding()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local opts = { buffer = ev.buf, silent = true }
			local builtin = require("telescope.builtin")

			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gr", '<cmd>Telescope lsp_references path_display={"tail"}<CR>', opts)

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", function()
				builtin.lsp_definitions()
				vim.cmd("normal! zz")
			end, opts)

			opts.desc = "Show LSP definitions - split down"
			vim.keymap.set("n", "gdj", function()
				open_split_definitions("down")
			end, opts)

			opts.desc = "Show LSP definitions - try open in down"
			vim.keymap.set("n", "gdJ", function()
				open_split_definitions_in_exist("down")
			end, opts)

			opts.desc = "Show LSP definitions - split up"
			vim.keymap.set("n", "gdk", function()
				open_split_definitions("up")
			end, opts)

			opts.desc = "Show LSP definitions - try open in up"
			vim.keymap.set("n", "gdK", function()
				open_split_definitions_in_exist("up")
			end, opts)

			opts.desc = "Show LSP definitions - split left"
			vim.keymap.set("n", "gdh", function()
				open_split_definitions("left")
			end, opts)

			opts.desc = "Show LSP definitions - try open in left"
			vim.keymap.set("n", "gdH", function()
				open_split_definitions_in_exist("left")
			end, opts)

			opts.desc = "Show LSP definitions - split right"
			vim.keymap.set("n", "gdl", function()
				open_split_definitions("right")
			end, opts)

			opts.desc = "Show LSP definitions - try open in right"
			vim.keymap.set("n", "gdL", function()
				open_split_definitions_in_exist("right")
			end, opts)

			opts.desc = "Show LSP definitions - tab"
			vim.keymap.set("n", "gdt", function()
				builtin.lsp_definitions({ jump_type = "tab" })
			end, opts)

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)

			opts.desc = "Open documentation for what is under cursor"
			vim.keymap.set("n", "<leader>od", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>al", ":LspRestart<CR>", opts)
		end,
	})
end
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim", -- ważne, by był w zależnościach
		"williamboman/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = Icons.error,
					[vim.diagnostic.severity.WARN] = Icons.warn,
					[vim.diagnostic.severity.INFO] = Icons.info,
					[vim.diagnostic.severity.HINT] = Icons.hint,
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				},
			},
		})

		keybinding()

		vim.lsp.config("ts_ls", {
			init_options = {
				plugins = {
					{
						name = "@styled/typescript-styled-plugin",
						location = vim.fn.stdpath("config") .. "/node_modules/@styled/typescript-styled-plugin",
					},
				},
				preferences = { importModuleSpecifierEnding = "minimal" },
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "gdscript",
			callback = function()
				vim.lsp.start({
					name = "godot",
					cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
					root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
				})
			end,
		})
	end,
}
