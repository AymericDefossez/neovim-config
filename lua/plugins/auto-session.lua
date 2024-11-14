return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local auto_session = require("auto-session")
    local auto_session_configs = require("configs.auto_session_configs")
    auto_session.setup(auto_session_configs)
    require("mappings.auto_session_mappings")
  end
}
