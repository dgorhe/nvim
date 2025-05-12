return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require("configs.conform"),
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "vertical",
        size = vim.o.columns * 0.5
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup(require "configs.nvim-tree")
      -- Toggle nvim-tree with leader + e
      vim.keymap.set('n', '<leader>e', function()
        local api = require('nvim-tree.api')
        local view = require('nvim-tree.view')
        if view.is_visible() then
          api.tree.close()
        else
          api.tree.open()
        end
      end, { desc = 'Toggle file explorer' })
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require "configs.r"  -- Load R configuration
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup(require "configs.treesitter")
      require "configs.snakemake"
    end,
  },

  -- Add tabularize plugin
  {
    "godlygeek/tabular",
    lazy = false,
    config = function()
      -- Add keybinding for tabularize
      vim.keymap.set('n', '<leader>tt', ':Tabularize /', { desc = 'Tabularize with pattern' })
      vim.keymap.set('v', '<leader>tt', ':Tabularize /', { desc = 'Tabularize selection with pattern' })
    end,
  },
}
