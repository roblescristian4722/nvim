call plug#begin('~/.config/nvim/autoload/plugged')
    " C++ syntax
    " Plug 'octol/vim-cpp-enhanced-highlight'
    " Plug 'bfrg/vim-cpp-modern'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " Snippets.
    Plug 'SirVer/ultisnips'
    " Default snippets
    Plug 'honza/vim-snippets'
    " React/JS/Typescript snippets
    Plug 'mlaursen/vim-react-snippets'

    " Surround
    Plug 'tpope/vim-surround'

    " Icons
    Plug 'ryanoasis/vim-devicons'

    " Shows indentation levels
    Plug 'Yggdroot/indentLine'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Coc Jedi
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

    " Android development
    Plug 'hsanson/vim-android'

    " Moving split windows
    Plug 'wesQ3/vim-windowswap'

    " JS syntax
    Plug 'pangloss/vim-javascript'
    " JSX syntax
    Plug 'junegunn/vim-plug'

    " Kotlin syntax
    Plug 'udalov/kotlin-vim'

    " python syntax
    Plug 'vim-python/python-syntax'

    " latex
    " Plug 'xuhdev/vim-latex-live-preview'

    " Comments usgin "gc" command
    Plug 'tpope/vim-commentary'

    " Status bar
    Plug 'vim-airline/vim-airline' 

    " html auto close tag
    Plug 'alvan/vim-closetag'

    " Support for Laravel
    "Plug 'tpope/vim-dispatch'             "| Optional
    "Plug 'tpope/vim-projectionist'        "|
    "Plug 'noahfrederick/vim-composer'     "|
    "Plug 'noahfrederick/vim-laravel'

    " PHP highlighting
    Plug 'StanAngeloff/php.vim'

    " HTML shorcuts
    Plug 'mattn/emmet-vim'

    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Auto pairs for tags
    Plug 'alvan/vim-closetag'
    
    " Dracula theme
    "Plug 'dracula/vim'
    
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Dark+ theme
    Plug 'tomasiser/vim-code-dark'
    Plug 'dunstontc/vim-vscode-theme'

    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'

call plug#end()
