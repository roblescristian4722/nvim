local fzf = require("fzf-lua").setup {}

vim.keymap.set("n", "F", ":FzfLua<CR>", { silent = true })
vim.keymap.set("n", "ff", "<cmd>lua require(\"fzf-lua\").files()<CR>", { silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>lua require(\"fzf-lua\").grep_visual()<CR>", { silent = true })
