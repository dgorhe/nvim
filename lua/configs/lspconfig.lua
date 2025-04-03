-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pylsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    pylsp = {
      plugins = {
        autopep8 = {
          enabled = true,
          args = { "--max-line-length=120" }
        },
        flake8 = {
          enabled = true,
          maxLineLength = 120
        },
        pycodestyle = {
          enabled = true,
          maxLineLength = 120
        },
        pylsp_mypy = { enabled = true },
        pylsp_rope = { enabled = true },
        pyflakes = { enabled = true },
        pylint = { enabled = false },
      }
    }
  }
}
