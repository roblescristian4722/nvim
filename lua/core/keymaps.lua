-- Close all buffers but the current one
vim.keymap.set("n", "cl", "<cmd>%bd|e#<cr>", {desc="Close all buffers but the current one"})


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

-- Creates new tab
vim.api.nvim_set_keymap( "n", "<C-n>", ":tabnew<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-n>", ":tabnew<CR>", { noremap = true } )

-- Iterates over tabs
vim.api.nvim_set_keymap( "n", "<C-p>", ":tabn<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-p>", ":tabn<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<C-PageUp>", ":tabn<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<C-PageUp>", ":tabn<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<C-PageDown>", ":tabp<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<PC-ageDown>", ":tabp<CR>", { noremap = true } )

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

-- Reposition windows
vim.api.nvim_set_keymap( "n", "wy", ":call WindowSwap#MarkWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "wp", ":call WindowSwap#DoWindowSwap()<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "ww", ":call WindowSwap#EasyWindowSwap()<CR>", { noremap = true } )

-- Keep visual mode after ident
vim.api.nvim_set_keymap( "v", ">", ">gv", { noremap = true } )
vim.api.nvim_set_keymap( "v", "<", "<gv", { noremap = true } )
