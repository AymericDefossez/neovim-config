return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- cmd = "<Cmd>source ~/shared_files/.profile<CR>",
  config = function()
    local toggleterm_configs = require("configs.toggleterm_configs")
    require("toggleterm").setup(toggleterm_configs)
    require("mappings.toggleterm_mappings")
  end,
}
