local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Colors",
    finder = finders.new_table {
      results = {
        { "red", "#ff0000" },
        { "green", "#00ff00" },
        { "blue", "#0000ff" },
        { "yellow", "#ffff00" },
        { "cyan", "#00ffff" },
        { "magenta", "#ff00ff" },
        { "black", "#000000" },
        { "white", "#ffffff" },
        { "gray", "#808080" },
        { "grey", "#808080" },
      },
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end
  }):find()
end

colors(require("telescope.themes").get_dropdown({}))
