-- Enabled getting to EOL on normal mode
vim.opt.ve = "onemore"
vim.opt.sel = "inclusive"

-- Searching configs
vim.opt.hlsearch = true     -- highlights matches
vim.opt.incsearch = true    -- incremental searching
vim.opt.ignorecase = true   -- searches are case sensitive
vim.opt.smartcase = true  -- ...unless they contain at least one capital letter