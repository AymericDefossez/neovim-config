return {
  "akinsho/toggleterm.nvim",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({})

    local map = vim.keymap.set
    map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>")
    map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>")
    map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>")
    map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
    map("t", "<C-x>", "<C-\\><C-n>")
  end
}
