require "plugins"

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
vim.api.nvim_set_keymap( "n", "wy", "WindowSwap#MarkWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "wp", "WindowSwap#DoWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "ww", "WindowSwap#EasyWindowSwap()<CR>", { noremap = true } )

-- Multiple cursor
vim.g.multi_cursor_use_default_mapping = 0
vim.g.multi_cursor_select_all_word_key = '<A-i>'
vim.g.multi_cursor_start_key = 'g<C-n>'
vim.g.multi_cursor_select_all_key = 'g<A-n>'
vim.g.multi_cursor_next_key = '<C-i>'
vim.g.multi_cursor_prev_key = '<C-z>'
vim.g.multi_cursor_skip_key = '<C-x>'
vim.g.multi_cursor_quit_key = '<Esc>'
vim.g.multi_cursor_start_word_key = "<C-i>"

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
