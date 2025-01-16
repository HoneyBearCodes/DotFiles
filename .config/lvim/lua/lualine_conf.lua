------------------------------------------------
-- @author: Shashank Singh
-- Theme: Tokyonight
--
-- Lualine configurations with Tokyonight theme
------------------------------------------------

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- stylua: ignore
local colors = {
  blue   = '#2ac3de',
  green  = '#9ece6a',
  black  = '#1a1b26',
  white  = '#c0caf5',
  red    = '#f7768e',
  violet = '#bb9af7',
  grey   = '#24283b',
  yellow = '#e0af68',
  orange = '#9ece6a'
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.grey },
    x = { fg = colors.white, bg = colors.grey },
    y = { fg = colors.white, bg = colors.grey },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.yellow } },
  replace = { a = { fg = colors.black, bg = colors.orange } },

  inactive = {
    a = { fg = colors.white, bg = colors.grey },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.grey },
  },
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local first_to_upper = function(str)
  return (str:gsub("^%l", string.upper))
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return str
  end,
}

local filetype = {
  "filetype",
  fmt = function(str)
    return first_to_upper(str)
  end,
  icons_enabled = true,
  icon = nil,
}

local fileformat = {
  "fileformat",
  symbols = {
    unix = "",
    dos = "",
    mac = "",
  },
}

local encoding = {
  "encoding",
  fmt = function(str)
    return string.upper(str)
  end,
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 1,
  icon = "",
  fmt = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    return row .. ":" .. col
  end,
}

local time = function()
  local time = os.date("*t")
  local fmt_time = ("%02d:%02d"):format(time.hour, time.min)
  return fmt_time
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- insert this before a component to place it in the middle
local ins_mid = function()
  return "%="
end

local config = {
  options = {
    icons_enabled = true,
    theme = theme,
    -- theme = 'tokyonight',
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diagnostics },
    lualine_c = { ins_mid, diff },
    lualine_x = { filetype },
    lualine_y = { fileformat, encoding, { time, icon = "" } },
    lualine_z = { location },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

return config
