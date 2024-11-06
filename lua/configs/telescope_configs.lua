return {
  defaults = {
    path_display = { "smart" },
    dynamic_preview_title = true,
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    }
  }
}
