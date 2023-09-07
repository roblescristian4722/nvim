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
    "bashls",
    "pkgbuild_language_server",
    "clangd",
    "omnisharp_mono",
    "cmake",
    "cssls",
    "cssmodules_ls",
    "unocss",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "graphql",
    "groovyls",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "vtsls",
    "kotlin_language_server",
    "lua_ls",
    "perlnavigator",
    "pyright",
    "sqlls",
    "rust_analyzer",
    "lemminx",
    "yamlls"
  },
  automatic_installation = true
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup({})
