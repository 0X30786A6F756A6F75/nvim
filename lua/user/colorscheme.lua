-- local colorscheme = "tokyonight"
local colorscheme = "edge"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  colorscheme = "tokyonight"
end

pcall(require, "user." .. colorscheme)

vim.o.background = "dark" -- or "light" for light mode

-- global colorscheme
vim.cmd([[ colorscheme ]] .. colorscheme)
