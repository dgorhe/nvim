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
    r = {
      "styler",
      stop_after_first = true,
    },
  },

  formatters = {
    black = {
      prepend_args = { 
        "--line-length", "120",
        "--skip-string-normalization",
        "--skip-magic-trailing-comma",
        "--preview",
      },
      cwd = require("conform.util").root_file {
        "pyproject.toml",
        "setup.cfg",
        ".git",
      },
    },
    autopep8 = {
      prepend_args = { 
        "--max-line-length", "120",
        "--ignore", "E731",  -- Ignore lambda to def conversion
      },
      timeout_ms = 5000, -- set timeout to 5 seconds
    },
    styler = {
      prepend_args = {
        "--style=tidyverse",
        "--indent_by=4",
      },
      timeout_ms = 5000,
    },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
