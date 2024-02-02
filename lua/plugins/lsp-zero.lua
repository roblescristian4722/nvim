local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local luasnip = require('luasnip.loaders.from_vscode').lazy_load()

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

-- Disables jdtls individually
lsp.skip_server_setup({ 'jdtls' })

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup({
  manage_nvim_cmp = {
    set_extra_mappings = true,
  }
})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'dap' },
    { name = 'nvim_lsp_signature_help' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-m>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = { 'menu', 'abbr', 'kind' },

    -- here is where the change happens
    format = function(_, item)
      local icons = {
        Text = '󰊄',
        Snippet = '',
        Function = '󰡱',
        Method = '󰡱',
        Interface = '󰊕',
        Variable = '󰫧',
        Field = '󰀫',
        Class = '',
        Constant = 'π',
        Struct = '',
        Object = '',
        File = '',
        Folder = '',
        Keyword = '',
        Module = '',
        Reference = '󱈇',
        Constructor = '󰣪',
        Enum = '',
        Array = '',
        List = ''
      }
      item.menu = (icons[item.kind] or '') .. ' '
      return item
    end,
  },
})

local telescope = require("telescope.builtin")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', function()
        telescope.lsp_implementations()
      end,
      opts
    )
    vim.keymap.set('n', 'H', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', 'wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', 'wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      opts
    )
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', function()
      telescope.lsp_references()
    end, opts
    )
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
