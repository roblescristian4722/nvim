local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- Disables jdtls individually
lsp.skip_server_setup({'jdtls'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup({
  manage_nvim_cmp = {
    set_extra_mappings = true,
  }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'path'}
  },
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<M-k>'] = cmp.mapping.scroll_docs(-4),
    ['<M-l>'] = cmp.mapping.scroll_docs(4),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

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
        Struct = '',
        Object = '',
        File = '',
        Folder = '',
        Keyword = '',
        Module = '',
        Reference = '󱈇',
        Constructor = '󰣪',
      }

      item.menu = ( icons[item.kind] or '' ) .. ' '
      return item
    end,
  },
})
