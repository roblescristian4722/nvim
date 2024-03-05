local opts = { noremap = true, silent = true }

-- Close all buffers but the current one
vim.keymap.set("n", "CL", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })

-- Toggle all folds
local foldKey = vim.keymap.set
foldKey('n', "<C-j>",
  function()
    local get_opt = vim.api.nvim_win_get_option
    local set_opt = vim.api.nvim_win_set_option

    if get_opt(0, "foldlevel") >= 20 then
      set_opt(0, "foldlevel", 0)
    else
      set_opt(0, "foldlevel", 20)
    end
  end,
  opts
)

-- yank relative file path
vim.keymap.set( { "n", "v" }, "file", ':let @+ = expand("%")<CR>', opts)

-- yank full file path
vim.keymap.set( { "n", "v" }, "dir", ':let @+ = expand("%:p")<CR>', opts)

-- Scroll up
-- nnoremap <c-e> <c-u>
vim.keymap.set( { "n", "v" }, "<PageUp>", "<C-y>" )
vim.keymap.set( { "n", "v" }, "<PageDown>", "<C-e>" )

-- move lines up and down
vim.keymap.set("n", "<C-l>", ":m .-2<CR>==")
vim.keymap.set("n", "<C-k>", ":m .+1<CR>==")

-- move line chunks up and down
vim.keymap.set("v", "<C-l>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '>+1<CR>gv=gv")

-- Smart way to move between panes
vim.keymap.set( { "n", "v" }, "<C-s-up>", "<C-w><up>", {})
vim.keymap.set( { "n", "v" }, "<C-s-down>", "<C-w><down>", {})
vim.keymap.set( { "n", "v" }, "<C-s-left>", "<C-w><left>", {})
vim.keymap.set( { "n", "v" }, "<C-s-right>", "<C-w><right>", {})

-- Uses system clipboard instead of vim's clipboard
vim.keymap.set( {"n", "v" }, "y", '"+y', opts)
vim.keymap.set( {"n", "v" }, "Y", '"+Y', opts)
vim.keymap.set( {"n", "v" }, "p", '"+p', opts)
vim.keymap.set( {"n", "v" }, "P", '"+P', opts)
vim.keymap.set( {"n", "v" }, "d", '"+d', opts)
vim.keymap.set( {"n", "v" }, "D", '"+D', opts)
vim.keymap.set( {"n", "v" }, "c", '"+c', opts)
vim.keymap.set( {"n", "v" }, "C", '"+C', opts)

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', opts)
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', opts)
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', opts)
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', opts)

-- remaping hjlk keys
vim.keymap.set( { "n", "v" }, "j", "h", opts)
vim.keymap.set( { "n", "v" }, "k", "j", opts)
vim.keymap.set( { "n", "v" }, "l", "k", opts)
vim.keymap.set( { "n", "v" }, "ñ", "l", opts)

-- Splits window horizontally
vim.keymap.set( { "n", "v" }, "<C-h>", ":sp<CR>", opts)

-- Splits window vertically
vim.keymap.set( { "n", "v" }, "<C-v>", ":vsp<CR>", opts)

-- Undo
vim.keymap.set( { "n", "v" }, "<C-z>", ":undo<CR>", opts)

-- Redo
vim.keymap.set( { "n", "v" }, "<C-y>", ":redo<CR>", opts)

-- Ctrl + s to save changes
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":update<CR>", opts)

-- Save changes using sudo
vim.keymap.set('c', 'w!!', "<esc>:lua require('core.utils').sudo_write()<CR>", { silent = true })

-- Maps Alt-[j,k,l, ñ] to resizing a window split
vim.keymap.set( { "n", "v", "i" }, "<A-Up>", ":resize -2<CR>", opts)
vim.keymap.set( { "n", "v", "i" }, "<A-Down>", ":resize +2<CR>", opts)
vim.keymap.set( { "n", "v", "i" }, "<A-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set( { "n", "v", "i" }, "<A-Right>", ":vertical resize -2<CR>", opts)

-- Reposition windows
vim.keymap.set("n", "wy", ":call WindowSwap#MarkWindowSwap()<CR>", opts)
vim.keymap.set("n", "wp", ":call WindowSwap#DoWindowSwap()<CR>", opts)
vim.keymap.set("n", "ww", ":call WindowSwap#EasyWindowSwap()<CR>", opts)

-- Keep visual mode after ident
vim.keymap.set("n", "<Tab>", ">>",  opts)
vim.keymap.set("n", "<S-Tab>", "<<",  opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
