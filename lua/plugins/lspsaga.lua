local saga = require('lspsaga').setup({
  finder = {
    max_height = 0.6,
    keys = {
      toggle_or_open = "<CR>",
      quit = "<Esc>",
      vsplit = "v",
      split = "h",
      shuttle = "w",
    },
  },
  code_action = {
    keys = {
      quit = "<Esc>",
    }
  },
  definition = {
    keys = {
      vsplit = "v",
      split = "h",
      quit = "<Esc>",
      edit = "<CR>",
    }
  },
})

vim.keymap.set("n", "F", ":Lspsaga finder .<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "A", ":Lspsaga code_action .<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", ":Lspsaga peek_definition .<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'h', '<cmd>Lspsaga hover_doc')
vim.keymap.set({'n','t'}, 'T', '<cmd>Lspsaga term_toggle<CR>', {})

return saga
