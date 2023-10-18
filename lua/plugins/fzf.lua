local fzf = require("fzf-lua").setup {}

vim.keymap.set("n", "F", ":FzfLua<CR>", { silent = true })

vim.keymap.set("n",
  "ff",
  function()
    require("fzf-lua").files({
      fzf_opts = {
        ['--layout'] = 'reverse-list',
      },
      cmd =
      'find . -not -path "*target*" -not -path "*.ade_path*" -not -path "*.git*" -not -path "*.manifest*" -not -path "*.metadata*" -not -name "*.jar"',
    }, "--ansi")
  end, { silent = true, desc = "Fuzzy complete file" }
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
      fzf_opts = {
        ['--layout'] = 'reverse-list',
      },
      cmd =
      "grep -RnaI --color --exclude-dir='target' --exclude-dir='.ade_path' --exclude-dir='.git' --exclude='.manifest' --exclude='.metadata' --exclude='.fullsource' --exclude='.ndep*'",
    }, "--ansi")
  end, { silent = true, desc = "Fuzzy complete file" }
)
