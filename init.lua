require "plugins"
require "nvim-cmp"
require "vim-vsnip"

-- cmp-path
require'cmp'.setup {
  sources = {
    { name = 'path' }
  }
}

-- Sets encoding to UTF-8
vim.opt.encoding = "utf-8"

-- general settings
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 1

-- Transparent background and theme
vim.cmd(":colorscheme codedark")

-- Enables getting to the end of the line on normal mode
vim.opt.ve = "onemore"
vim.opt.sel = "inclusive"

-- Shows line numbers
vim.opt.number = true

-- Limits popup menu height
vim.opt.pumheight = 20

-- Gray ruler at column 80
vim.cmd("set colorcolumn=80")
vim.cmd("highlight ColorColumn ctermbg=gray guibg=gray")

-- Shows current line
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Set tab length depending on filetype
vim.cmd("autocmd FileType javascript,javascriptreact setlocal shiftwidth=2 tabstop=2")

-- Shows git signs next to line numbers
vim.opt.signcolumn = "yes"

-- Reposition windows
vim.cmd("let g:windowswap_map_keys = 0") -- Prevents default windows
vim.api.nvim_set_keymap( "n", "wy", ":call WindowSwap#MarkWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "wp", ":call WindowSwap#DoWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "ww", ":call WindowSwap#EasyWindowSwap()<CR>", { noremap = true } )

-- Multiple cursor
vim.cmd([[
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
    let g:VM_leader = 'h'
]])

-- Searching configs
vim.opt.hlsearch = true     -- highlights matches
vim.opt.incsearch = true    -- incremental searching
vim.opt.ignorecase = true   -- searches are case sensitive
vim.opt.smartcase = true    -- ... unless they contain at least one capital letter

-- Keep visual mode after ident
vim.api.nvim_set_keymap( "v", ">", ">gv", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<", "<gv", { noremap = true } )

-- Smart way to move between panes
vim.api.nvim_set_keymap( "n", "<C-s-up>", "<C-w><up>", {} )
vim.api.nvim_set_keymap( "n", "<C-s-down>", "<C-w><down>", {} )
vim.api.nvim_set_keymap( "n", "<C-s-left>", "<C-w><left>", {} )
vim.api.nvim_set_keymap( "n", "<C-s-right>", "<C-w><right>", {} )

-- Uses system clipboard instead of vim's clipboard
vim.api.nvim_set_keymap( "n", "y", '"+y', { noremap = true } )
vim.api.nvim_set_keymap( "n", "Y", '"+Y', { noremap = true } )
vim.api.nvim_set_keymap( "n", "p", '"+p', { noremap = true } )
vim.api.nvim_set_keymap( "n", "P", '"+P', { noremap = true } )
vim.api.nvim_set_keymap( "n", "d", '"+d', { noremap = true } )
vim.api.nvim_set_keymap( "n", "D", '"+D', { noremap = true } )
vim.api.nvim_set_keymap( "n", "c", '"+c', { noremap = true } )
vim.api.nvim_set_keymap( "n", "C", '"+C', { noremap = true } )

vim.api.nvim_set_keymap( "v", "y", '"+y', { noremap = true } )
vim.api.nvim_set_keymap( "v", "Y", '"+Y', { noremap = true } )
vim.api.nvim_set_keymap( "v", "p", '"+p', { noremap = true } )
vim.api.nvim_set_keymap( "v", "P", '"+P', { noremap = true } )
vim.api.nvim_set_keymap( "v", "d", '"+d', { noremap = true } )
vim.api.nvim_set_keymap( "v", "D", '"+D', { noremap = true } )
vim.api.nvim_set_keymap( "v", "c", '"+c', { noremap = true } )
vim.api.nvim_set_keymap( "v", "C", '"+C', { noremap = true } )

-- remaping hjlk keys
vim.api.nvim_set_keymap( "n", "j", "h", { noremap = true } )
vim.api.nvim_set_keymap( "n", "k", "j", { noremap = true } )
vim.api.nvim_set_keymap( "n", "l", "k", { noremap = true } )
vim.api.nvim_set_keymap( "n", "ñ", "l", { noremap = true } )

vim.api.nvim_set_keymap( "v", "j", "h", { noremap = true } )
vim.api.nvim_set_keymap( "v", "k", "j", { noremap = true } )
vim.api.nvim_set_keymap( "v", "l", "k", { noremap = true } )
vim.api.nvim_set_keymap( "v", "ñ", "l", { noremap = true } )

-- Opens NERDTree
vim.api.nvim_set_keymap( "n", "<C-o>", ":NERDTreeToggle<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-o>", ":NERDTreeToggle<CR>", { noremap = true } )

-- Creates new tab
vim.api.nvim_set_keymap( "n", "<C-n>", ":tabnew<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-n>", ":tabnew<CR>", { noremap = true } )

-- Iterates over tabs
vim.api.nvim_set_keymap( "n", "<C-p>", ":tabn<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-p>", ":tabn<CR>", { noremap = true } )

-- Splits window horizontally
vim.api.nvim_set_keymap( "n", "<C-h>", ":sp<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-h>", ":sp<CR>", { noremap = true } )

-- Splits window vertically
vim.api.nvim_set_keymap( "n", "<C-v>", ":vsp<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-v>", ":vsp<CR>", { noremap = true } )

-- Undo
vim.api.nvim_set_keymap( "n", "<C-z>", ":undo<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-z>", ":undo<CR>", { noremap = true } )

-- Redo
vim.api.nvim_set_keymap( "n", "<C-y>", ":redo<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-y>", ":redo<CR>", { noremap = true } )

-- Ctrl + s to save changes
vim.api.nvim_set_keymap( "n", "<C-s>", ":update<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-s>", "<C-C>:update<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "i", "<C-s>", "<C-O>:update<CR>", { noremap = true } )

-- Maps Alt-[j,k,l, ñ] to resizing a window split
vim.api.nvim_set_keymap( "n", "<A-Up>", ":resize -2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<A-Up>", ":resize -2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "i", "<A-Up>", ":resize -2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<A-Down>", ":resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<A-Down>", ":resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "i", "<A-Down>", ":resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<A-Left>", ":vertical resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<A-Left>", ":vertical resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "i", "<A-Left>", ":vertical resize +2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<A-Right>", ":vertical resize -2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<A-Right>", ":vertical resize -2<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "i", "<A-Right>", ":vertical resize -2<CR>", { noremap = true } )

-- Vscode theme
vim.opt.background = "dark"
vim.cmd("autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE")

-- Python syntax highlight
vim.g.python_highlight_all = 1

-- lightline shows full path for current file along git info
vim.g.lightline = { component_function = { filename = 'LightlineFilename' } }

vim.cmd([[
    function! LightlineFilename()
      let root = fnamemodify(get(b:, 'git_dir'), ':h')
      let path = expand('%:p')
      if path[:len(root)-1] ==# root
        return path[len(root)+1:]
      endif
      return expand('%')
    endfunction
]])

-- Move lines up and down (functions)
vim.cmd([[
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

    noremap <silent> <C-l> :call <SID>swap_up()<CR>
    noremap <silent> <C-k> :call <SID>swap_down()<CR>
]])

-- Open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Terminal on split screen
vim.cmd([[
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
]])
