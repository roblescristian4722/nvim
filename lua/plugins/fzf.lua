local fzf = require("fzf-lua").setup {}

-- vim.keymap.set("n", "F", ":FzfLua<CR>", { silent = true })

vim.keymap.set("n",
  "ff",
  function()
    require("fzf-lua").files({
      fzf_opts = {
        ['--layout'] = 'reverse-list',
      },
      cmd =
      "rg --files -Lc --glob '!*target*' --glob '!*.jar'",
      -- 'find . -not -path "*target*" -not -path "*.ade_path*" -not -path "*.git*" -not -path "*.manifest*" -not -path "*.metadata*" -not -name "*.jar"',
    })
  end, { silent = true, desc = "Fuzzy complete file" }
)

vim.keymap.set("n",
  "ref",
  function()
    require("fzf-lua").lsp_references({
      fzf_opts = {
        ['--layout'] = 'reverse-list',
      },
    }, "--ansi")
  end, { silent = true, desc = "Fuzzy complete file" }
)

vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>lua require(\"fzf-lua\").blines({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true }
)

vim.keymap.set("n", "G",
  function()
    require("fzf-lua").live_grep_glob({
      fzf_opts = {
        ['--layout'] = 'reverse-list',
      },
      cmd =
      "rg -Lc --glob '!*target*'"
      -- "grep -RnaI --color --exclude-dir='target' --exclude-dir='.ade_path' --exclude-dir='.git' --exclude='.manifest' --exclude='.metadata' --exclude='.fullsource' --exclude='.ndep*'",
    })
  end, { silent = true, desc = "Fuzzy complete file" }
)
