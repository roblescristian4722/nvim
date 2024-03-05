-- General
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 1

-- Enabled getting to EOL on normal mode
vim.opt.ve = "onemore"
vim.opt.sel = "inclusive"

-- Displays row numbers
vim.opt.number = true

-- Relative row number
vim.opt.relativenumber = true

-- Limits popup menu height
vim.opt.pumheight = 20

-- Displays current line
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Displays git symbols next to row number
vim.opt.signcolumn = "yes"

-- Searching configs
vim.opt.hlsearch = true     -- highlights matches
vim.opt.incsearch = true    -- incremental searching
vim.opt.ignorecase = true   -- searches are case sensitive
vim.opt.smartcase = true    -- ...unless they contain at least one capital letter

-- Dark background
vim.opt.background = "dark"

-- Open new split panes at right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show whitespaces
vim.opt.list = true

-- Autoreload file
vim.opt.autoread = true
