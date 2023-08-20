-- This file can be loaded by calling `lua require('plugins')` from your init.vim
require("plugins.treesitter")

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

  -- Html auto close tag
  use 'alvan/vim-closetag'

  -- Comments usgin "gc" command
  use 'tpope/vim-commentary'

  -- Moving splitted windows
  use 'wesQ3/vim-windowswap'

  -- Mason (LSP server installer)
  use 'williamboman/mason.nvim'

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
end)
