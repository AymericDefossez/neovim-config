return {
  "feline-nvim/feline.nvim",
  config = function ()
    local feline_configs = require("configs.feline_configs")
    require("feline").setup(feline_configs)
  end,
}
