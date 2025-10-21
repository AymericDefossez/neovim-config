local map = vim.keymap.set
local opts = require("mappings.default_mappings_opts")
local oil = require("oil")

map("n", "-", "<cmd>Oil --float<CR>", opts("Open Oil float window"))
-- map("n", "<esc>",
--   function ()
--     if not vim.bo.modified then
--       oil.close()
--     else
--       vim.notify("Des modifications non enregistrées existent.")
--     end
--   end,
--   opts("Close Oil if no changes")
-- )
