local options = {
  formatters_by_ft = {
    lua = {
      "stylua",
      stop_after_first = true,
    },
    python = {
      "autopep8",
      stop_after_first = true,
    },
  },

  formatters = {
    black = {
      prepend_args = { "--line-length", "120" },
      cwd = require("conform.util").root_file {
        "pyproject.toml",
        "setup.cfg",
        ".git",
      },
    },
    autopep8 = {
      prepend_args = { "--max-line-length", "120" },
      timeout_ms = 5000, -- set timeout to 5 seconds
    },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
