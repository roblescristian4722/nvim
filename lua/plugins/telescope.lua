local builtin = require('telescope.builtin')
local utils = require("telescope.utils")
require('telescope').load_extension('luasnip')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'G', builtin.live_grep, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'fh', builtin.lsp_references, {})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

return require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "*/target/*",
      "*/.ade_path/*",
      ".git/*",
      ".manifest/*",
      ".metadata/*",
      ".fullsource/*",
      ".ndep*",
      "*.jar"
    },
    path_display = filenameFirst,
  },
  pickers = {
    diagnostics = {
      path_display = filenameFirst,
      preview = {
        hide_on_startup = false,
      }
    }
  }
}
