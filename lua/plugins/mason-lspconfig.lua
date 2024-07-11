local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup({})

-- Fixes "multiple different client" error caused by clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require('mason-lspconfig').setup({
  ensure_installed = {
    -- "bashls",
    -- "pkgbuild_language_server",
    "clangd",
    -- "omnisharp_mono",
    "cmake",
    "eslint",
    -- "golangci_lint_ls",
    -- "gopls",
    -- "graphql",
    -- "groovyls",
    -- "html",
    "jsonls",
    "jdtls",
    -- "tsserver",
    "vtsls",
    -- "kotlin_language_server",
    "lua_ls",
    -- "perlnavigator",
    "pyright",
    -- "pylsp",
    "sqlls",
    -- "rust_analyzer",
    -- "lemminx",
    "yamlls"
  },
  automatic_installation = true
})

-- Local LSP server installations

-- bash
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
