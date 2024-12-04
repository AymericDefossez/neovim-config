return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require("gitsigns").setup()
    require("mappings.gitsigns_mappings")
  end,
}
