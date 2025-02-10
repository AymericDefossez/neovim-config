local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.select_default(prompt_bufnr)
    return
  end
  actions.send_selected_to_qflist(prompt_bufnr)
  vim.cmd("cfdo edit")
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr)
end

return {
  defaults = {
    path_display = { "smart" },
    dynamic_preview_title = true,
    mappings = {
      i = {
        ["<CR>"] = telescope_custom_actions.multi_selection_open
      },
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    }
  }
}
