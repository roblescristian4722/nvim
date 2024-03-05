local conform = require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { { "isort" }, { "black" } },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    java = {{ "google-java-format", "astyle" }}
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Automatically format on save
-- require("conform").setup({
--   format_on_save = {
--     -- These options will be passed to conform.format()
--     timeout_ms = 500,
--     lsp_fallback = true,
--   },
-- })

vim.keymap.set({ "n", "v" }, "<space>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end)
