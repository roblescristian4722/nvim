local builtin = require('telescope.builtin')
local utils = require("telescope.utils")

vim.keymap.set('n', 'ff', function ()
  builtin.find_files()
  end,
  {}
)
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

return require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "*/target/*",
      "*/.ade_path/*",
      ".git/*",
      ".manifest/*",
      ".metadata/*",
      ".fullsource/*",
      ".ndep*",
      "*.jar"
    }
  },
}
