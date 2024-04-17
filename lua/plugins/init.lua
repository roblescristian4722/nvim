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

  -- Formatter
  'mhartington/formatter.nvim',

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

  -- Floating command line
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function ()
      require('fine-cmdline').setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = ': '
        },
        popup = {
          position = {
            row = '45%',
            col = '50%',
          },
          size = {
            width = '60%',
          },
          border = {
            style = 'rounded',
          },
          win_options = {
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
          },
        }
      })
      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end
  },

  -- DAP (Debugger)
  -- {
  -- "rcarriga/nvim-dap-ui",
   --  dependencies = {
      -- "mfussenegger/nvim-dap",
      -- "theHamsta/nvim-dap-virtual-text",
      -- "anuvyklack/hydra.nvim",
      -- "nvim-telescope/telescope-dap.nvim",
      -- "rcarriga/cmp-dap",
      -- "nvim-neotest/nvim-nio",
    -- },
    -- config = function ()
      -- local dap = require("dap")
      -- local dapui = require("dapui")
      -- dap.listeners.before.attach.dapui_config = function()
        -- dapui.open()
      -- end
      -- dap.listeners.before.launch.dapui_config = function()
        -- dapui.open()
      -- end
      -- dap.listeners.before.event_terminated.dapui_config = function()
        -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
        -- dapui.close()
      -- end
    -- end
  -- },

  -- Mason DAP
  -- {
    -- "jay-babu/mason-nvim-dap.nvim",
    -- event = "VeryLazy",
    -- dependencies = {
      -- "mfussenegger/nvim-dap",
      -- 'williamboman/mason.nvim',
    -- },
    -- opts = {
      -- handlers = {},
      -- ensure_installed = {
        -- "cpptools",
        -- "codelldb"
      -- }
    -- }
  -- },

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
require("plugins.nvimtree")
require("plugins.indent-blankline")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.bufferline")
require("plugins.telescope")
require("plugins.notify")
require("plugins.format")
-- require("plugins.dap")
