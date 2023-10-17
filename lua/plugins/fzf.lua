local fzf = require("fzf-lua").setup {}

vim.keymap.set("n", "F", ":FzfLua<CR>", { silent = true })
vim.keymap.set("n",
  "ff",
  "<cmd>lua require(\"fzf-lua\").files({ fzf_opts = {['--layout'] = 'reverse-list'}, cmd = \"find -not -path '*target*' -not -path '*.ade_path*'\" })<CR>",
  { silent = true }
)
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>lua require(\"fzf-lua\").blines({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true }
)
vim.keymap.set("n", "<C-g>",
  function()
    require("fzf-lua").live_grep_glob({
      cmd = "grep --exclude-dir='*target*' --exclude-dir='*.ade_path' -Rn",
    })
  end, { silent = true, desc = "Fuzzy complete file" })
