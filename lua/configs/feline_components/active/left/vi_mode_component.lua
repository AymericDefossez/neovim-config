local vi_mode_utils = require("feline.providers.vi_mode")

return {
  provider = "vi_mode",
  hl = function()
    return {
      name = vi_mode_utils.get_mode_highlight_name(),
      fg = vi_mode_utils.get_mode_color(),
      style = "bold",
    }
  end,
}
