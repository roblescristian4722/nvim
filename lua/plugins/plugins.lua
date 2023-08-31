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

  -- LSP Support
  use 'neovim/nvim-lspconfig'             -- Required
  use 'williamboman/mason.nvim'           -- Optional
  use 'williamboman/mason-lspconfig.nvim' -- Optional

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'     -- Required
  use 'hrsh7th/cmp-nvim-lsp' -- Required
  use 'L3MON4D3/LuaSnip'     -- Required
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  
  -- JDTLS
  use 'mfussenegger/nvim-jdtls'
end)
