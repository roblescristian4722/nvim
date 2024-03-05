local notify = require("notify")

vim.opt.termguicolors = true

notify.setup({
  fps = 144,
  timeout = 1000,
  render = "compact",
  stages = "slide"
})

vim.notify = notify
