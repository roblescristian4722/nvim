if vim.g.neovide then
  -- Resize text
  local map = vim.keymap.set

  local function neovideScale(amount)
  local temp = vim.g.neovide_scale_factor + amount

  if temp < 0.5 then
    return
  end

  vim.g.neovide_scale_factor = temp
  end

  map({"n", "v"}, "<C-+>", function()
    neovideScale(0.1)
  end)

  map({"n", "v"}, "<C-->", function()
    neovideScale(-0.1)
  end)

  -- Default font
  vim.opt.guifont = {
    "Inconsolata Nerd Font", ":h15"
  }

  -- Enable copy/paste
  vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<C-S-C>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-V>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-V>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-V>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-V>', '<ESC>l"+Pli') -- Paste insert mode
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_cursor_antialiasing = false

  vim.g.neovide_refresh_rate = 144
end
