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
    bashls,
    pkgbuild_language_server,
    clangd,
    csharp_ls,
    omnisharp_mono,
    cmake,
    neocmake,
    cssls,
    cssmodules_ls,
    unocss,
    eslint,
    golangci_lint_ls,
    gopls,
    graphql,
    groovyls,
    html,
    hls,
    jsonls,
    jdtls,
    java_language_server,
    tsserver,
    vtsls,
    kotlin_language_server,
    lua_ls,
    phpactor,
    perlnavigator,
    pyright,
    sqls,
    rust_analyzer,
    lemminx,
    yamlls
  },
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup({})
