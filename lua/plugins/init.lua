-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_maps = {
        ['Find Under'] = "<C-d>",
        ['Find Subword Under'] = '<C-d>',
        ['Select All'] = '<C-a>',
        ['Visual All'] = '<C-a>',
      }
    end,
  },

  -- Comments usgin "gc" command
  'tpope/vim-commentary',

  -- Surround
  'tpope/vim-surround',
}

local opts = {}

require("lazy").setup(plugins, opts)
