return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
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

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
}
