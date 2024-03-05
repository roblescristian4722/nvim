-- Close all buffers but the current one
vim.keymap.set("n", "CL", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })

-- Toggle all folds
local foldKey = vim.keymap.set
local foldSilent = { noremap = true, silent = true }
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
  foldSilent)

-- yank relative file path
-- vim.keymap.set( { "n", "v" }, "dir", ':let @+ = expand("%")<CR>', { noremap = true })
-- yank full file path
vim.keymap.set( { "n", "v" }, "dir", ':let @+ = expand("%:p")<CR>', { noremap = true })

-- Scroll up
-- nnoremap <c-e> <c-u>
vim.keymap.set( { "n", "v" }, "<PageUp>", "<C-y>" )
vim.keymap.set( { "n", "v" }, "<PageDown>", "<C-e>" )

-- Smart way to move between panes
vim.keymap.set( { "n", "v" }, "<C-s-up>", "<C-w><up>", {})
vim.keymap.set( { "n", "v" }, "<C-s-down>", "<C-w><down>", {})
vim.keymap.set( { "n", "v" }, "<C-s-left>", "<C-w><left>", {})
vim.keymap.set( { "n", "v" }, "<C-s-right>", "<C-w><right>", {})

-- Uses system clipboard instead of vim's clipboard
vim.keymap.set( {"n", "v" }, "y", '"+y', { noremap = true })
vim.keymap.set( {"n", "v" }, "Y", '"+Y', { noremap = true })
vim.keymap.set( {"n", "v" }, "p", '"+p', { noremap = true })
vim.keymap.set( {"n", "v" }, "P", '"+P', { noremap = true })
vim.keymap.set( {"n", "v" }, "d", '"+d', { noremap = true })
vim.keymap.set( {"n", "v" }, "D", '"+D', { noremap = true })
vim.keymap.set( {"n", "v" }, "c", '"+c', { noremap = true })
vim.keymap.set( {"n", "v" }, "C", '"+C', { noremap = true })

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- remaping hjlk keys
vim.keymap.set( { "n", "v" }, "j", "h", { noremap = true })
vim.keymap.set( { "n", "v" }, "k", "j", { noremap = true })
vim.keymap.set( { "n", "v" }, "l", "k", { noremap = true })
vim.keymap.set( { "n", "v" }, "ñ", "l", { noremap = true })

-- Splits window horizontally
vim.keymap.set( { "n", "v" }, "<C-h>", ":sp<CR>", { noremap = true })

-- Splits window vertically
vim.keymap.set( { "n", "v" }, "<C-v>", ":vsp<CR>", { noremap = true })

-- Undo
vim.keymap.set( { "n", "v" }, "<C-z>", ":undo<CR>", { noremap = true })

-- Redo
vim.keymap.set( { "n", "v" }, "<C-y>", ":redo<CR>", { noremap = true })

-- Ctrl + s to save changes
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":update<CR>", { noremap = true })

-- Save changes using sudo
vim.keymap.set('c', 'w!!', "<esc>:lua require('core.utils').sudo_write()<CR>", { silent = true })

-- Maps Alt-[j,k,l, ñ] to resizing a window split
vim.keymap.set( { "n", "v", "i" }, "<A-Up>", ":resize -2<CR>", { noremap = true })
vim.keymap.set( { "n", "v", "i" }, "<A-Down>", ":resize +2<CR>", { noremap = true })
vim.keymap.set( { "n", "v", "i" }, "<A-Left>", ":vertical resize +2<CR>", { noremap = true })
vim.keymap.set( { "n", "v", "i" }, "<A-Right>", ":vertical resize -2<CR>", { noremap = true })

-- Reposition windows
vim.keymap.set("n", "wy", ":call WindowSwap#MarkWindowSwap()<CR>", { noremap = true })
vim.keymap.set("n", "wp", ":call WindowSwap#DoWindowSwap()<CR>", { noremap = true })
vim.keymap.set("n", "ww", ":call WindowSwap#EasyWindowSwap()<CR>", { noremap = true })

-- Keep visual mode after ident
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
