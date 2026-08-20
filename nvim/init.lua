require("config.lazy")


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.incsearch = true
vim.cmd("colorscheme default")
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
