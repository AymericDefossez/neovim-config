return {
  "akinsho/toggleterm.nvim",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
        return 20
      end
    })

    local map = vim.keymap.set
    map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>")
    map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>")
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>")
    map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
    map("t", "<C-x>", "<C-\\><C-n>")
  end
}
