local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load VSCode-style snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'dap' },
    { name = 'nvim_lsp_signature_help' }
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Supertab implementation replacing cmp_action.luasnip_supertab()
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- LuaSnip forward/backward jump replacing cmp_action.luasnip_jump_*
    ['<C-m>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(_, item)
      local icons = {
        Text = '󰊄', Snippet = '', Function = '󰡱', Method = '󰡱',
        Interface = '󰊕', Variable = '󰫧', Field = '󰀫', Class = '',
        Constant = 'π', Struct = '', Object = '', File = '',
        Folder = '', Keyword = '', Module = '', Reference = '󱈇',
        Constructor = '󰣪', Enum = '', Array = '', List = ''
      }
      item.menu = (icons[item.kind] or '') .. ' '
      return item
    end,
  },
})
