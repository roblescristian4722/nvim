" Defines the source file for pluggins
source $HOME/.config/nvim/vim-plug/plugins.vim

" coc configurations
source $HOME/.config/nvim/coc.vim

let g:lsp_cxx_hl_use_text_props = 1

" Disables double $ for autocompletion in php files
autocmd FileType php set iskeyword+=$

" imported from $HOME/.vimrc
syntax on
filetype plugin indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab

" Folding
set foldmethod=syntax
set nofoldenable
set foldlevel=1

" Transparent background
set t_Co=256
set t_ut=
:colorscheme codedark

" enables getting to the end of line on normal mode
set ve+=onemore
set sel=inclusive
" Shows line numbers
set number
"set encoding
set encoding=UTF-8
" Uses system clipboard instead of vim's clipboard
set clipboard=unnamedplus
noremap  y "+y
noremap  Y "+Y
noremap  p "+p
noremap  P "+P
noremap  d "_d
noremap  c "+C
noremap  C "+C
vnoremap y "+y
vnoremap Y "+Y
vnoremap p "+p
vnoremap P "+P
vnoremap d "_d
vnoremap D "_D
vnoremap C "+C
vnoremap c "+c

" Limit popup menu height
set pumheight=20

" Highlight TODO and FIXME
syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo

" C++ syntax highlighting
"let g:cpp_concepts_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

" ruler at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=gray guibg=gray

" Shows current line
set cursorline
set termguicolors
" Shows git signs next to line number
set signcolumn=yes

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case sensitive
set smartcase   " ... unless they contain at least one capital letter

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Set comment type depending on filetype
autocmd FileType c,cpp,cs,java,js,jsx,php setlocal commentstring=//\ %s

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

" Latex preview
" noremap <silent> <A-o> :LLPStartPreview<CR>
" let g:livepreview_engine = 'xelatex'

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

" lightline shows full path for current file along git info
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Move lines up and down - commands
"noremap <silent> <C-s-up> :call <SID>swap_up()<CR>
"noremap <silent> <C-s-down> :call <SID>swap_down()<CR>
noremap <silent> <C-l> :call <SID>swap_up()<CR>
noremap <silent> <C-k> :call <SID>swap_down()<CR>

" Opens NERDTree
map <silent><C-o> :NERDTreeToggle<CR>
" Creates new tab
map <silent><C-n> :tabnew<CR>
" Next tab
map <silent><C-p> :tabn<CR>
" Prev tab
map <silent>P :tabp<CR>
" Splits window horizontally
map <silent><C-h> :sp<CR>
" Splits window vertically
map <silent><C-v> :vsp<CR>
" Undo
map <silent><C-z> :undo<CR>
" Redo
map <silent><C-y> :redo<CR>

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

"Ctrl + s to Save changes
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Multiple cursors
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Switch Mode"]        = '<C-m>'

" vscode theme
set background=dark
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

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

" Snippets
let g:UltiSnipsExpandTrigger       = '<c-p>'
let g:UltiSnipsJumpForwardTrigger  = '<c-m>'
let g:UltiSnipsJumpBackwardTrigger = '<c-n>'
