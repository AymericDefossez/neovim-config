return {
  float = {
    preview_split = "right",
    border = "rounded",
  },
  keymaps = {
    ["<esc>"] = function ()
      if not vim.bo.modified then
        require("oil").close()
      else
        vim.notify("Des modifications non enregistrées existent.")
      end
    end,
  },
}
