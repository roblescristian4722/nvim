-- COMMAND NOT YET AVAILABLE IN NATIVE LUA

-- Sets the colorscheme (theme)
vim.cmd [[colorscheme codedark]]

-- Enables syntax highlighting
vim.cmd [[syntax on]]

-- Enables filetype based indentation
vim.cmd [[filetype plugin indent on]]

-- Gray ruler at column 80
vim.cmd [[set colorcolumn=80]]
vim.cmd [[highlight ColorColumn ctermbg=gray guibg=gray]]

-- Set tab length depending on filetype
vim.cmd [[autocmd FileType javascript,javascriptreact setlocal shiftwidth=2 tabstop=2]]

-- Transparency
vim.cmd [["autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE"]]
