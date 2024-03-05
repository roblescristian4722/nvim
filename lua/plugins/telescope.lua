local builtin = require('telescope.builtin')
local utils = require("telescope.utils")

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'G', builtin.live_grep, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fh', builtin.lsp_references, {})

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
