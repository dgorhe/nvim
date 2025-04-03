local options = {
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "python",
    "snakemake",
    "bash",
    "yaml",
    "json",
    "markdown",
    "html",
    "css",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
}

-- Add filetype detection for Snakefiles
vim.filetype.add({
  pattern = {
    ['.*Snakefile'] = 'snakemake',
    ['.*%.smk'] = 'snakemake',
  }
})

return options 