require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Add your new Telescope mapping here
-- This is the recommended 'live_grep' for general 'find text'
map("n", "<leader>ft", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope Live Grep (Find Text)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
