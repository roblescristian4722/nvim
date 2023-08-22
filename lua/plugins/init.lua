-- This file can be loaded by calling `lua require('plugins')` from your init.vim
require("plugins.treesitter")
require("plugins.undotree")
require("plugins.telescope")
require("plugins.lsp")
require("plugins.mason")

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Vim Airline (status bar)
  use 'vim-airline/vim-airline'

  -- Colorscheme (vscode clone)
  use 'tomasiser/vim-code-dark'

  -- NERD Tree
  use 'scrooloose/NERDTree'

  -- Hydra
  use 'anuvyklack/hydra.nvim'

  -- Treesitter
  use (
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  )

  -- Multiple cursors
  use 'smoka7/multicursors.nvim'

  -- Auto pairs for '(' '[' '{'
  use 'jiangmiao/auto-pairs'

  -- Auto pairs for tags
  use 'alvan/vim-closetag'

  -- Comments usgin "gc" command
  use 'tpope/vim-commentary'

  -- Moving splitted windows
  use 'wesQ3/vim-windowswap'

  -- FZF
  use (
    'junegunn/fzf',
    { run = 'fzf#install()' }
  )
  use 'junegunn/fzf.vim'

  -- Snippets
  use 'SirVer/ultisnips'

  -- Default snippets
  use 'honza/vim-snippets'

  -- React/JS/Typescript snippets
  use 'mlaursen/vim-react-snippets'

  -- Surround
  use 'tpope/vim-surround'

  -- Icons
  use 'ryanoasis/vim-devicons'

  -- Shows indentation levels
  use 'Yggdroot/indentLine'

  -- Undotree
  use 'mbbill/undotree'

  -- Telescope (file finder)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
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
  }
}
end)
