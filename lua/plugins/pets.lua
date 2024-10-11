return {
  "giusgad/pets.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "giusgad/hologram.nvim"
  },
  config = function()
    require("pets").setup({
      row = 1,
      col = 0,
      speed_multiplier = 1,
      default_pet = "dog",
      default_style = "black",
    })
  end,
}
