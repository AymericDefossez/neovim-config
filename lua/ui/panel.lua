local Popup = require("nui.popup")
local Layout = require("nui.layout")

local popup_1 = Popup({
  enter = true,
  focusable = true,
  border = "single",
})
local popup_2 = Popup({
  border = "double",
})

local layout = Layout(
  {
    position = "50%",
    size = {
      width = "80%",
      height = "80%",
    },
  },
  Layout.Box({
    Layout.Box(popup_1, { size = "40%" }),
    Layout.Box(popup_2, { size = "60%" }),
  }, { dir = "row" })
)

local current_dir = "row"

popup_1:map("n", "r", function ()
  if current_dir == "col" then
    layout:update(Layout.Box({
      Layout.Box(popup_1, { size = "40%" }),
      Layout.Box(popup_2, { size = "60%" }),
    }, { dir = "row" }))

    current_dir = "row"
  else
    layout:update(Layout.Box({
      Layout.Box(popup_1, { size = "40%" }),
      Layout.Box(popup_2, { size = "60%" }),
    }, { dir = "col" }))

    current_dir = "col"

  end
end, {})

vim.keymap.set("n", "<leader>o", function ()
  layout:mount()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", function ()
  layout:unmount()
end, { noremap = true, silent = true })
