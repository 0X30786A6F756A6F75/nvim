local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then return end

tokyonight.setup {
  style = "night",
  light_style = "light",
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- comments = { italic = true, bg = "#24283b", fg = "#5B6268" },
    comments = { italic = true},
    keywords = { italic = true },
    sidebars = "normal",
    floats = "normal",
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 1, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
}
