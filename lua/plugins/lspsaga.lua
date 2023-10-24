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
  ui = {
    code_action = ''
  },
  outline = {
    keys = {
      toggle_or_jump = '<CR>',
      quit = '<Esc>'
    }
  },
  rename = {
    keys = {
      quit = '<Esc>',
      exec = '<CR>'
    }
  }
})

vim.keymap.set("n", "F", ":Lspsaga finder .<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "A", ":Lspsaga code_action .<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", ":Lspsaga peek_definition tyd+ref+imp+def<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'h', '<cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'O', '<cmd>Lspsaga outline<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-r>', '<cmd>Lspsaga rename .<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 't' }, 'T', '<cmd>Lspsaga term_toggle<CR>', { noremap = true, silent = true })

return saga
