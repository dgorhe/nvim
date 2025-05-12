-- R specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "r",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.opt_local.commentstring = "# %s"
  end,
})

-- Create .lintr file in the project root if it doesn't exist
local function create_lintr_config()
  local lintr_config = [[
linters: with_defaults(
  line_length_linter(120),
  object_name_linter = NULL,
  commented_code_linter = NULL,
  object_usage_linter = NULL,
  object_length_linter = NULL
)
]]
  local file = io.open(".lintr", "w")
  if file then
    file:write(lintr_config)
    file:close()
  end
end

-- Create .lintr file when opening R files
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.R",
  callback = create_lintr_config,
}) 