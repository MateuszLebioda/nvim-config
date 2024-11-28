------------------------------------
-- Setting max size of current panel
------------------------------------


return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>pm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
