local options = {
  formatters_by_ft = {
    lua = {
      {
        "stylua",
        stop_after_first = true,
      },
    },
    python = {
      {
        "black",
        stdin = true,
        args = { "--line-length", "120" }, -- Default black line length
        cwd = require("conform.util").root_file({
          "pyproject.toml",
          "setup.cfg",
          ".git",
        }),
        stop_after_first = true,
      },
    },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
