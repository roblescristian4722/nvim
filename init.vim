let g:polyglot_disabled = ['c', 'c++', 'c/c++', 'php', 'python']
let g:lsp_cxx_hl_use_text_props = 1

" imported from $HOME/.vimrc
syntax on
set clipboard=unnamedplus
filetype plugin indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
" enables getting to the end of line on normal mode
set ve+=onemore
" Shows line numbers
set number
"set encoding
set encoding=UTF-8

" Polyglot
set nocompatible
" C++ syntax highlighting
"let g:cpp_concepts_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

" ruler at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightcyan guibg=blue

" limit syntax highlighting
set synmaxcol=128
syntax sync minlines=256

" Shows current line
set cursorline
set termguicolors

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case sensitive
set smartcase   " ... unless they contain at least one capital letter

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" snippet using Alt
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-d>"

" Set comment type depending on filetype
autocmd FileType c,cpp,cs,java,js,jsx setlocal commentstring=//\ %s

" Set tab length depending on filetype
autocmd FileType javascript,javascriptreact setlocal shiftwidth=2 tabstop=2

" Smart way to move between panes
map <C-s-up> <C-w><up>
map <C-s-down> <C-w><down>
map <C-s-left> <C-w><left>
map <C-s-right> <C-w><right>

" Change split windows
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> wy :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> wp :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> ww :call WindowSwap#EasyWindowSwap()<CR>

" Python syntax
let g:python_highlight_all = 1
let g:python_highlight_builtins = 1

"Spanish spell check
set spelllang=es
" Toggle spellchecking
function! ToggleSpellCheck()
    set spell!
    if &spell
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

nnoremap <silent> <C-u> :call ToggleSpellCheck()<CR>

" Defines the source file for pluggins
source $HOME/.config/nvim/vim-plug/plugins.vim

" Latex preview
" noremap <silent> <A-o> :LLPStartPreview<CR>

" Coc remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-pairs', 'coc-clangd', 'coc-kotlin',
            \ 'coc-cmake', 'coc-angular', 'coc-css', 'coc-html',
            \ 'coc-git', 'coc-go', 'coc-highlight', 'coc-tsserver',
            \ 'coc-phpactor', 'coc-rome',
            \ 'coc-java', 'coc-pydocstring', 'coc-pyright']

" (COC) update time
set updatetime=2000

" (COC) Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" airline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Move lines up and down - functions
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

" Move lines up and down - commands
"noremap <silent> <C-s-up> :call <SID>swap_up()<CR>
"noremap <silent> <C-s-down> :call <SID>swap_down()<CR>
noremap <silent> <C-l> :call <SID>swap_up()<CR>
noremap <silent> <C-k> :call <SID>swap_down()<CR>

" Multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-i>'
let g:multi_cursor_select_all_word_key = '<A-i>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-i>'
let g:multi_cursor_prev_key            = '<C-z>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Limit popup menu height
set pumheight=20

" vscode theme
:colorscheme codedark
" Transparent background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
set background=dark

" Opens NERDTree
map <C-o> :NERDTreeToggle<CR>
" Creates new tab
map <C-n> :tabnew<CR>
" Iterates over tabs
map <C-p> :tabn<CR>
" Splits window horizontally
map <C-h> :sp<CR>
" Splits window vertically
map <C-v> :vsp<CR>
" Undo
map <C-z> :undo<CR>
" Redo
map <C-y> :redo<CR>

" Maps Alt-[j,k,l, ñ] to resizing a window split
noremap <silent> <A-Up> :resize -2<CR>
noremap <silent> <A-Down> :resize +2<CR>
noremap <silent> <A-Left> :vertical resize +2<CR>
noremap <silent> <A-Right> :vertical resize -2<CR>

" remaping hjlk keys
noremap j h
noremap k j
noremap l k
noremap ñ l

" remaping hjlk keys for uppercase
noremap J h
noremap K j
noremap L k
noremap Ñ l

"Ctrl + s to Save changes
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" disable vim-airline extensions
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#quickfix#enabled = 0
let g:airline#extensions#netrw#enabled = 0
let g:airline#extensions#coc#enabled = 1

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
