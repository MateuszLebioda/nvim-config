--------------------------------------------
-- Plugin using to snippers and autocomplete
--------------------------------------------

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    'saadparwaiz1/cmp_luasnip',
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    'rafamadriz/friendly-snippets'
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require('luasnip')
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').load({ paths = { "../snippets/snippets.code-snippets" } })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<A-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
           if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
        end, { 'i', 's' }),
        }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = 'luasnip' },   -- Źródło ze snippetami
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
          format = function(entry, vim_item)

      -- Dodanie ikon i podstawowych informacji
      vim_item.kind = string.format('%s', vim_item.kind)

      -- Pobierz szczegóły o źródle (np. biblioteka, moduł)
      local source_detail = entry.completion_item.detail or entry.completion_item.documentation
      if source_detail then
        vim_item.menu = string.format('[%s]', source_detail)
      else
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          path = "[Path]",
        })[entry.source.name]
      end

      return vim_item
    end,
      },
    })
  end,
}
