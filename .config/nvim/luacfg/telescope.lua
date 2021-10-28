
require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    -- ...
  }
})

