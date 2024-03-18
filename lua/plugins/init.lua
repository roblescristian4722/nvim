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

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    dependencies = {
      { "HiPhish/rainbow-delimiters.nvim" },
    }
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

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

  -- Pretty error list
  "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
   },

  -- Auto pairs for tags
  'alvan/vim-closetag',

  -- Comments usgin "gc" command
  'tpope/vim-commentary',

  -- Moving splitted windows
  'wesQ3/vim-windowswap',

  -- Surround
  'tpope/vim-surround',

  -- Icons
  'ryanoasis/vim-devicons',

  -- Shows indentation levels
  'Yggdroot/indentLine',

  -- nvim-lualine (lightweight lua statusline)
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      { 'nvimdev/lspsaga.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'rafamadriz/friendly-snippets' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      -- { 'rcarriga/cmp-dap' },
      -- { 'mfussenegger/nvim-dap' },
      -- { 'rcarriga/nvim-dap-ui' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    }
  },

  -- List available snippets using Telescope
  {
    "benfowler/telescope-luasnip.nvim",
    module = "telescope._extensions.luasnip",  -- if you wish to lazy-load
  },

  -- Nvim Tree (file browser)
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' }
    }
  },

  -- Gitsigns
  'lewis6991/gitsigns.nvim',

  -- Cheatsheet
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'desdic/telescope-rooter.nvim'
      }
  },

  -- Todo comments for Telescope
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },

  -- DAP (Debugger)
  {
  "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "firefox", "node2" }
      })
      end,
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "anuvyklack/hydra.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/cmp-dap",
    },
    keys = {
      { "<leader>d", desc = "Open Debug menu" },
    },
    cmd = {
      "DapContinue",
      "DapLoadLaunchJSON",
      "DapRestartFrame",
      "DapSetLogLevel",
      "DapShowLog",
      "DapStepInto",
      "DapStepOut",
      "DapStepOver",
      "DapTerminate",
      "DapToggleBreakpoint",
      "DapToggleRepl",
    },
    config = function()
      local ok_telescope, telescope = pcall(require, "telescope")
      if ok_telescope then
       telescope.load_extension("dap")
      end

      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
          sources = cmp.config.sources({
            { name = "dap" },
          }, {
            { name = "buffer" },
          }),
        })
      end
    end
  },

  -- Custom notifications
  'rcarriga/nvim-notify',

  -- Moving cursor faster
  'ggandor/lightspeed.nvim',

  -- Illuminate word all over the file
  'RRethy/vim-illuminate',

  -- Java language server (eclipse)
  'mfussenegger/nvim-jdtls',
}

local opts = {}

require("lazy").setup(plugins, opts)
require("plugins.treesitter")
require("plugins.lsp-zero")
require("plugins.mason-lspconfig")
require("plugins.lspsaga")
require("plugins.trouble")
require("plugins.nvimtree")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.bufferline")
require("plugins.telescope")
require("plugins.notify")
require("plugins.dap")
require("plugins.mason-nvim-dap")
