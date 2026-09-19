-- 1. Setup Mason first
require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- 2. Define autocompletion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Setup Mason-LSPConfig and configure servers via handlers
require('mason-lspconfig').setup({
  ensure_installed = {
    "clangd",
    "cmake",
    "eslint",
    "jsonls",
    "jdtls",
    "vtsls",
    "lua_ls",
    "pyright",
    "sqlls",
    "yamlls"
  },
  automatic_installation = true,
  
  -- Handlers automatically set up every server installed by Mason
  handlers = {
    -- Default handler for all servers (replaces manual lua_ls setup)
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
    
    -- Dedicated handler for clangd to apply your specific fixes
    clangd = function()
      require('lspconfig').clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      })
    end,
  }
})

-- 4. Local LSP server installations (unmanaged by Mason)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
