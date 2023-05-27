colorscheme = "tokyonight"

require ("user.themes." ..colorscheme)
vim.opt.background = 'dark'

vim.cmd([[colorscheme ]] .. colorscheme)
