-- COMMAND NOT YET AVAILABLE IN NATIVE LUA

-- Sets the colorscheme (theme)
vim.cmd [[colorscheme codedark]]

-- Enables syntax highlighting
vim.cmd [[syntax on]]

-- Enables filetype based indentation
vim.cmd [[filetype plugin indent on]]

-- Gray ruler at columns 80 and 100
vim.cmd [[set colorcolumn=80]]
vim.cmd [[highlight ColorColumn ctermbg=gray guibg=gray]]

-- Disables double $ for autocompletion in php files
vim.cmd [[autocmd FileType php set iskeyword+=$]]

-- Set comment type depending on filetype
vim.cmd [[autocmd FileType c,cpp,cs,java,js,jsx,php setlocal commentstring=//\ %s]]

-- Set tab length depending on filetype
vim.cmd [[autocmd FileType javascript,javascriptreact,typescript,typescriptreact,lua,xml,json setlocal shiftwidth=2 tabstop=2]]


-- Highlight tiling spaces red
vim.cmd [[ highlight RedundantSpaces ctermbg=203 guibg=#ff5f5f ]]
vim.cmd [[ match RedundantSpaces /\s\+$/ ]]

-- Show indentation spaces as dots
vim.cmd [[ set lcs+=space:· ]]

-- Call autoread whenever a buffer is focused
vim.cmd [[ au FocusGained,BufEnter * :silent! ! ]]

-- Transparency
-- vim.cmd [[autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE]]
