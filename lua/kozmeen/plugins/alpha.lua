---------------------------------
-- Plugin showing welcome page
---------------------------------

local function keybinding()
	local alpha = require("alpha")
	vim.api.nvim_create_augroup("AlphaKeyMappings", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = "AlphaKeyMappings",
		pattern = "alpha",
		callback = function()
			vim.api.nvim_buf_set_keymap(0, "n", "c", "", {
				desc = "Close alpha",
				callback = function()
					vim.cmd("b#")
				end,
			})

			vim.api.nvim_buf_set_keymap(0, "n", "n", "", {
				desc = "Close Alpha if open and open new buffer",
				callback = function()
					vim.cmd("bd") -- zamyka Alpha (buffer delete)
					vim.cmd("enew") -- otwiera nowy pusty bufor
				end,
			})
		end,
	})

	vim.keymap.set("n", "<leader>oa", function()
		alpha.start()
	end, { desc = "Open welcome page" })
end

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header to display
		dashboard.section.header.val = {
			"██╗  ██╗  ██████╗  ███████╗ ███╗   ███╗ ███████╗ ███████╗ ███╗   ██╗",
			"██║ ██╔╝ ██╔═══██╗ ╚══███╔╝ ████╗ ████║ ██╔════╝ ██╔════╝ ████╗  ██║",
			"█████╔╝  ██║   ██║   ███╔╝  ██╔████╔██║ █████╗   █████╗   ██╔██╗ ██║",
			"██╔═██╗  ██║   ██║  ███╔╝   ██║╚██╔╝██║ ██╔══╝   ██╔══╝   ██║╚██╗██║",
			"██║  ██╗ ╚██████╔╝ ███████╗ ██║ ╚═╝ ██║ ███████╗ ███████╗ ██║ ╚████║",
			"╚═╝  ╚═╝  ╚═════╝  ╚══════╝ ╚═╝     ╚═╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═══╝",
			"          ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"          ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"          ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"          ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"          ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                             ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>Neotree toggle<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "󰈬  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("n", "  > Open [No Name] buffer"),
			dashboard.button("SPC sr", "󰁯  > Restore session for cwd", "<cmd>SessionRestore<CR>"),
			dashboard.button("c", "  > Close welcome page"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
		}

		alpha.setup(dashboard.opts)

		keybinding()
	end,

	init = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				require("alpha").start()
			end,
		})
	end,
}
