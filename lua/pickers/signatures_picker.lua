local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local method_definition_getter = require("pickers.getters.method_definition_getter")
local field_definition_getter = require("pickers.getters.field_definition_getter")
local function_declaration_getter = require("pickers.getters.function_declaration_getter")
local variable_declarator_getter = require("pickers.getters.variable_declarator_getter")

local M = {}

M.signatures_picker = function(opts)
  opts = opts or {}
  local signatures = {}

  vim.list_extend(signatures, method_definition_getter.get_method_definitions())
  vim.list_extend(signatures, field_definition_getter.get_field_definitions())
  vim.list_extend(signatures, function_declaration_getter.get_function_declarations())
  vim.list_extend(signatures, variable_declarator_getter.get_variable_declarators())

  -- sort the signatures by line number
  table.sort(signatures, function(a, b)
    return a.line < b.line
  end)

  pickers.new(opts, {
    prompt_title = "Functions",
    finder = finders.new_table({
      results = signatures,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name,
          ordinal = entry.name,
          path = entry.path,
          lnum = entry.line,
        }
      end
    }),
    sorter = conf.generic_sorter(opts),
    previewer = conf.grep_previewer(opts),
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_win_set_cursor(0, { selection.value.line, selection.value.col })
      end)

      return true
    end
  }):find()
end

return M
