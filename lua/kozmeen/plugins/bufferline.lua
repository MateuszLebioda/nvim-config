------------------------------
-- Plugin show preety tabs name
------------------------------
return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = { options = { mode = "tabs", show_buffer_close_icons = false, separator_style = "slant" } },
}
