local git_branch = require("configs.feline_components.active.right.git_branch_component")
local git_diff_added = require("configs.feline_components.active.right.git_diff_added_component")
local git_diff_changed = require("configs.feline_components.active.right.git_diff_changed_component")
local git_diff_removed = require("configs.feline_components.active.right.git_diff_removed_component")
local line_percentage = require("configs.feline_components.active.right.line_percentage_component")

return {
  git_branch,
  git_diff_added,
  git_diff_changed,
  git_diff_removed,
  line_percentage,
}
