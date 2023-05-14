local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  gui = 'italic',
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. "", warn = icons.diagnostics.Warning .. "" },
  colored = false,
  update_in_insert = false,
  always_visible = false,
  separator = "%#SLSeparator#" .. " │" .. "%*"
}

local diff = {
  "diff",
  gui = 'italic',
  colored = false,
  symbols = {
    added = icons.git.Add .. "",
    modified = icons.git.Mod .. "",
    removed = icons.git.Remove .. ""
  }, -- changes diff symbols
  cond = hide_in_width,
  separator = "%#SLSeparator#" .. "│ " .. "%*"
}

local filetype = {
  "filetype",
  gui = 'italic',
  icons_enabled = true,
  separator = "%#SLSeparator#" .. "│ " .. "%*"
  -- icon = nil,
}

local branch = {
  gui = 'italic',
  "branch",
  icon = "%#SLGitIcon#" .. " " .. "%*" .. "%#SLBranchName#",
}

local current_signature = function()
  if not pcall(require, "lsp_signature") then return end
  local sig = require("lsp_signature").status_line(60)
  -- return "🐼" .. sig.label  .. sig.hint
  return sig.label .. "%#SLSeparator# " .. sig.hint .. "%*"
end

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = {
    "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  -- return chars[index]
  return "%#SLProgress#" .. chars[index] .. "%*"
end

local spaces = {
  function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  padding = 0,
  separator = "%#SLSeparator#" .. " │" .. "%*"
}

local location = {
  "location",
}

local mode = {
  -- mode component
  function()
    -- return "▊"
    -- return "  "
    return "  "
  end,
  padding = 0,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    -- theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true
  },
  sections = {
    lualine_a = { mode, branch},
    lualine_b = { },
    lualine_c = { { current_signature, cond = hide_in_width } },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    lualine_x = { diagnostics, diff, spaces, filetype },
    lualine_y = { progress },
    lualine_z = { location }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
