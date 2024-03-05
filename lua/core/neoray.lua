if vim.g.neoray then
  -- Enable copy/paste
  vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true }) -- Save
  vim.keymap.set('v', '<C-S-C>', '"+y', { silent = true }) -- Copy
  vim.keymap.set('n', '<C-S-V>', '"+P', { silent = true }) -- Paste normal mode
  vim.keymap.set('v', '<C-S-V>', '"+P', { silent = true }) -- Paste visual mode
  vim.keymap.set('c', '<C-S-V>', '<C-R>+', { silent = true }) -- Paste command mode
  vim.keymap.set('i', '<C-S-V>', '<ESC>l"+Pli', { silent = true }) -- Paste insert mode
  -- Settings
  vim.cmd [[
    set guifont=InconsolataNerdFont-Regular:h14
    NeoraySet CursorAnimTime 0.009
    NeoraySet Transparency   0.1
    NeoraySet TargetTPS      144
    NeoraySet ContextMenu    TRUE
    NeoraySet BoxDrawing     TRUE
    NeoraySet ImageViewer    TRUE
    NeoraySet KeyFullscreen  <F11>
    NeoraySet KeyZoomIn      <C-ScrollWheelUp>
    NeoraySet KeyZoomOut     <C-ScrollWheelDown>
    NeoraySet KeyZoomIn      <C-+>
    NeoraySet KeyZoomOut     <C-->
  ]]
end
