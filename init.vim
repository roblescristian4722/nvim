" Polyglot
set nocompatible

" Defines the source file for pluggins
source $HOME/.config/nvim/vim-plug/plugins.vim

" ruler at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightcyan guibg=blue

" statusline info (filepath \ line \ column)
set statusline+=%F\ %l\:%c

" limit syntax highlighting
set synmaxcol=128
syntax sync minlines=256

" Rainbow Pairs
let g:rainbow_active = 1

" Shows current line
set cursorline

" Shows line numbers
set number

if (has("termguicolors"))
 set termguicolors
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
noremap <silent> <C-s-up> :call <SID>swap_up()<CR>
noremap <silent> <C-s-down> :call <SID>swap_down()<CR>

" Multiple cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-i>'
let g:multi_cursor_select_all_word_key = '<A-i>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-i>'
let g:multi_cursor_prev_key            = '<C-k>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" YouCompleteMe configs
"let g:ycm_clangd_binary_path = "/usr/bin/clangd"
"let g:ycm_global_ycm_extra_conf = "~kristo/.config/nvim/.ycm_extra_conf.py"
"set conceallevel=2
"set concealcursor=vin
"let g:clang_snippets=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='clang_complete'
" Complete options (disable preview scratch window, longest removed to aways show menu)
" set completeopt=menu,menuone
" Limit popup menu height
set pumheight=20

" COC
source $HOME/.config/nvim/plug-config/coc.vim

" imported from $HOME/.vimrc
syntax on
filetype plugin indent on
" Dark Plus 1
"colorscheme codedark
" Dark Plus 2
colorscheme codedark
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
" Opens NERDTree
map <C-o> :NERDTreeToggle<CR>
" Creates new tab
map <C-n> :tabnew<CR>
" Iterates over tabs
map <C-p> :tabn<CR>
" Iterates over tabs
map <C-l> :tabp<CR>
" Splits window horizontally
map <C-v> :sp<CR>
" Splits window vertically
map <C-h> :vsp<CR>
" Undo
map <C-z> :undo<CR>
" Redo
map <C-y> :redo<CR>
" resize ++
map <C-0> :resize +2
" resize --
map <C-9> :resize -2
"Ctrl + s to Save changes
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

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
