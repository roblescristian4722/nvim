local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'CD', api.tree.change_root_to_node, opts('Change root to node'))
  vim.keymap.set('n', 'cd', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- Opens NvimTree
vim.api.nvim_set_keymap( "n", "<C-o>", ":NvimTreeToggle<CR>", { noremap = true } )

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach
})
