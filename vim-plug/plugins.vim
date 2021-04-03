" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " C++ syntax
    "Plug 'arakashic/chromatica.nvim'

    " html auto close tag
    Plug 'alvan/vim-closetag'

    " Support for Laravel
    Plug 'tpope/vim-dispatch'             "| Optional
    Plug 'tpope/vim-projectionist'        "|
    Plug 'noahfrederick/vim-composer'     "|
    Plug 'noahfrederick/vim-laravel'

    " PHP highlighting
    Plug 'StanAngeloff/php.vim'

    " HTML shorcuts
    Plug 'mattn/emmet-vim'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Dracula theme
    "Plug 'dracula/vim'
    
    " ALE (C/C++ Linter)
    "Plug 'dense-analysis/ale'
    
    " YouCompleteMe
    "Plug 'ycm-core/YouCompleteMe'
    
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Dark+ theme
    Plug 'tomasiser/vim-code-dark'
    Plug 'dunstontc/vim-vscode-theme'
    
    " C++ Syntax highlighting
    "Plug 'bfrg/vim-cpp-modern'
    
    " Rainbow Pairs
    "Plug 'oblitum/rainbow'
    
    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    call plug#end()
