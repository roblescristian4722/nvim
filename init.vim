" Defines the source file for pluggins
source $HOME/.config/nvim/vim-plug/plugins.vim

" limit syntax highlighting
set synmaxcol=128
syntax sync minlines=256

" Rainbow Pairs
let g:rainbow_active = 1

" Shows current line
:set cursorline

" Shows line numbers
:set number

if (has("termguicolors"))
 set termguicolors
endif

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
" Ctrl + s to Save changes
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" remaping hjlk keys
noremap j h
noremap k j
noremap l k
noremap ñ l

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
