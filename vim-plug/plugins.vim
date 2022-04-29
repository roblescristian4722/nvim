" auto-install vim-plug
"if empty(glob('~/.config/nvim/autoload/plug.vim'))
"  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  "autocmd VimEnter * PlugInstall
"  "autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " C++ syntax
    " Plug 'octol/vim-cpp-enhanced-highlight'
    " Plug 'bfrg/vim-cpp-modern'
    " Plug 'jackguo380/vim-lsp-cxx-highlight'

    " LSP config
    Plug 'neovim/nvim-lspconfig'

    " Git
    Plug 'tpope/vim-fugitive'

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

    " Vim Plug
    Plug 'junegunn/vim-plug'

    " Kotlin syntax
    Plug 'udalov/kotlin-vim'

    " python syntax
    Plug 'vim-python/python-syntax'

    " latex
    " Plug 'xuhdev/vim-latex-live-preview'
   
    " Golang
    Plug 'fatih/vim-go'

    " Comments usgin "gc" command
    Plug 'tpope/vim-commentary'

    " Status bar
    Plug 'itchyny/lightline.vim'
    " Plug 'vim-airline/vim-airline'

    " html auto close tag
    Plug 'alvan/vim-closetag'

    " PHP highlighting
    Plug 'StanAngeloff/php.vim'

    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Auto pairs for tags
    Plug 'alvan/vim-closetag'
    
    " Stable version of coc
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " colorschemes
    Plug 'tomasiser/vim-code-dark'
    
    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'

call plug#end()
