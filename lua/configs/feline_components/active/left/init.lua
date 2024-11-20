local left_border_component = require("configs.feline_components.active.left.left_border_component")
local vi_mode_component = require("configs.feline_components.active.left.vi_mode_component")
local file_info_component = require("configs.feline_components.active.left.file_info_component")
local position_component = require("configs.feline_components.active.left.position_component")
local diagnostic_errors = require("configs.feline_components.active.left.diagnostic_errors_component")
local diagnostic_warnings = require("configs.feline_components.active.left.diagnostic_warnings_component")
local diagnostic_hints = require("configs.feline_components.active.left.diagnostic_hints_component")
local diagnostic_info = require("configs.feline_components.active.left.diagnostic_info_component")

return {
  left_border_component,
  vi_mode_component,
  file_info_component,
  position_component,
  diagnostic_errors,
  diagnostic_warnings,
  diagnostic_hints,
  diagnostic_info,
}
