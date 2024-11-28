-- Telescope: 
---------------------------------------------------------
-- Plugin to fusy find files in cwd ( and not only here )
---------------------------------------------------------

-- Telescope ui:
----------------------------------------------------------------
-- Plugin to open some kind of inputs (using for example in LSP)
----------------------------------------------------------------

local actions = require("telescope.actions")
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
      vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cws" })
    end,
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<A-k>"] = actions.move_selection_previous, -- Alt + k -> Up
            ["<A-j>"] = actions.move_selection_next, -- Alt + j -> Down
          },
        },
      },
    }),
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
