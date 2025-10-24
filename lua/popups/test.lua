local popup = require("plenary.popup")
local win_id

function ShowMenu(opts, cb)
  local height = 20
  local width = 30
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  win_id = popup.create(opts, {
    title = "MyProjects",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
    callback = cb,
  })
  local bufnr = vim.api.nvim_win_get_buf(win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { noremap = true, silent = true })
end

function CloseMenu()
  vim.api.nvim_win_close(win_id, true)
end

function MyMenu()
  local opts = {
    "Option 1",
    "Option 2",
    "Option 3",
  }
  local cb = function(_, sel)
    print("Selected: ", sel)
  end
  ShowMenu(opts, cb)
end

-- vim.keymap.set("n", "<leader>o", "<cmd>lua MyMenu()<CR>", { noremap = true, silent = true })
