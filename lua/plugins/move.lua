local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<C-k>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<C-l>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<C-j>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<C-ñ>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<C-k>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<C-l>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-j>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<C-ñ>', ':MoveHBlock(1)<CR>', opts)
