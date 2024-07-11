local lint = require('lint')
lint.linters_by_ft = {
  python = { "pylint" }
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Create events for linter
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end
})

-- Keymap that enables linter
vim.keymap.set("n", "M", function()
  lint.try_lint()
end)
