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
  -- Colorscheme (vscode clone)
  'tomasiser/vim-code-dark',

  -- Hydra
  'anuvyklack/hydra.nvim',

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- Multiple cursors
  'smoka7/multicursors.nvim',

  -- Auto pairs for '(' '[' '{'
  'jiangmiao/auto-pairs',

  -- Auto pairs for tags
  'alvan/vim-closetag',

  -- Comments usgin "gc" command
  'tpope/vim-commentary',

  -- Moving splitted windows
  'wesQ3/vim-windowswap',

  -- Snippets
  'SirVer/ultisnips',

  -- Default snippets
  'honza/vim-snippets',

  -- React/JS/Typescript snippets
  'mlaursen/vim-react-snippets',

  -- Surround
  'tpope/vim-surround',

  -- Icons
  'ryanoasis/vim-devicons',

  -- Shows indentation levels
  'Yggdroot/indentLine',

  -- Undotree
  'mbbill/undotree',

  -- Telescope (file finder)
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.2',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'mfussenegger/nvim-dap'},
      {'rcarriga/nvim-dap-ui'},
      {'mfussenegger/nvim-jdtls'}
    }
  },

  -- Nvim Tree (file browser)
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      {'nvim-tree/nvim-web-devicons'}
    }
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  },

  -- Gitutter
  'lewis6991/gitsigns.nvim',

  -- Cheatsheet
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Terminal toggler
  {
    "akinsho/toggleterm.nvim", version = '*', config = function()
      require("toggleterm").setup()
    end
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
require("plugins.treesitter")
require("plugins.undotree")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.mason-lspconfig")
require("plugins.nvimtree")
require("plugins.lualine")
require("plugins.gitgutter")
require("plugins.bufferline")
