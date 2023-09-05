require('bufferline').setup({
  highlights = {
    buffer_selected = { bold = true },
    diagnostic_selected = { bold = true },
    info_selected = { bold = true },
    info_diagnostic_selected = { bold = true },
    warning_selected = { bold = true },
    warning_diagnostic_selected = { bold = true },
    error_selected = { bold = true },
    error_diagnostic_selected = { bold = true },
  },
  options = {
    show_close_icon = false,
    diagnostics = 'nvim_lsp',
    max_prefix_length = 8,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end
      if level:match('error') then
        return '!'
      elseif level:match('warning') then
        return '?'
      end
      return ''
    end,
    custom_filter = function(buf_number, buf_numbers)
      if vim.bo[buf_number].filetype ~= 'oil' then
        return true
      end
    end,
  },
})

vim.keymap.set('n', '<C-p>', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<C-c>', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', 'Ñ', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', 'J', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-Ñ>', '<CMD>BufferLineMoveNext<CR>')
vim.keymap.set('n', '<C-J>', '<CMD>BufferLineMovePrev<CR>')
vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')
