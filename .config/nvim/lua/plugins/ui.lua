--  ╭──────────────────────────────────────────────────────────╮
--  │                   UI Configurations                      │
--  │          (colorscheme, snacks, lualine, etc.)            │
--  ╰──────────────────────────────────────────────────────────╯

return {

  -- ===================
  --     Colorscheme
  -- ===================

  {
    -- Plugin: tokyonight.nvim (A modern and minimal Neovim colorscheme)
    "tokyonight.nvim",

    -- Configuration options for the theme
    opts = function(_, _opts)
      return {
        -- Set theme style to "moon" (Available: night, storm, moon, day)
        style = "moon",

        -- Enable transparency for the entire background
        transparent = true,

        ---@param hl Highlights    -- Define highlight groups
        ---@param c ColorScheme    -- Reference to the theme color scheme
        on_highlights = function(hl, c)
          -- Custom background for Telescope prompt
          local prompt = "#2d3149"

          -- Customize Telescope (fuzzy finder) colors
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }

          -- Configure Treesitter Rainbow Brackets
          hl.TSRainbowRed = { fg = c.red }
          hl.TSRainbowYellow = { fg = c.yellow }
          hl.TSRainbowBlue = { fg = c.blue }
          hl.TSRainbowOrange = { fg = c.orange }
          hl.TSRainbowGreen = { fg = c.green2 }
          hl.TSRainbowViolet = { fg = c.purple }
          hl.TSRainbowCyan = { fg = c.cyan }

          -- LSP (Language Server Protocol) Inlay Hints
          hl.LspInlayHint = { link = "Comment" }

          -- Documentation string color
          hl["@string.documentation"] = { fg = c.yellow }

          -- Override default parameter highlight for Smali (Android assembly)
          hl["@parameter.builtin"] = { fg = "#efc890" }

          -- Configure LSP highlights for C#
          hl["@lsp.type.fieldName.cs"] = { link = "@field" }

          -- Character placeholders in printf functions
          hl["@character.printf"] = { link = "@type" }

          -- Rust-specific LSP type highlights
          hl["@lsp.type.selfTypeKeyword.rust"] = { link = "@variable.builtin" }
          hl["@lsp.type.constantName"] = { link = "@constant" }
          hl["@lsp.type.decorator.rust"] = { link = "@attribute" }
          hl["@lsp.type.deriveHelper.rust"] = { link = "@attribute" }
          hl["@lsp.type.extensionMethodName"] = { link = "@lsp.type.interface" }
          hl["@lsp.type.generic.rust"] = { link = "@variable" }
          hl["@lsp.type.formatSpecifier.rust"] = { link = "@punctuation.special" }
          hl["@lsp.type.variable.rust"] = { link = "@variable" }
          hl["@lsp.type.escapeSequence"] = { link = "@string.escape" }
          hl["@lsp.type.stringEscapeCharacter"] = { link = "@string.escape" }
          hl["@lsp.type.selfKeyword"] = { link = "@variable.builtin" }
          hl["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" }
          hl["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" }
          hl["@lsp.typemod.event.static"] = { link = "@lsp.type.interface" }
          hl["@lsp.typemod.function.defaultLibrary.rust"] = { link = "@function.builtin" }
          hl["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" }
          hl["@lsp.typemod.method.defaultLibrary.rust"] = { link = "@function.builtin" }
          hl["@lsp.typemod.method.trait"] = { link = "@lsp.type.interface" }
          hl["@lsp.typemod.parameter.callable"] = { link = "@function" }
          hl["@lsp.typemod.variable.constant.rust"] = { link = "@constant" }

          -- Disable unnecessary LSP keyword highlights
          hl["@lsp.type.keyword.cs"] = {}
          hl["@lsp.type.keyword.go"] = {}
          hl["@lsp.type.keyword.rust"] = {}
          hl["@lsp.type.generic.rust"] = {}
          hl["@lsp.type.keyword.zig"] = {}
          hl["@lsp.type.type.zig"] = {}

          -- Ensure injected language keywords are properly highlighted
          hl["@lsp.typemod.keyword.injected"] = { link = "@keyword" }

          -- Remove LSP string highlights for certain languages
          hl["@lsp.type.string.go"] = {}
          hl["@lsp.type.string.rust"] = {}
          hl["@lsp.type.string.zig"] = {}

          -- General LSP operator & constant highlighting
          hl["@lsp.type.operator"] = { link = "@operator" }
          hl["@lsp.type.const"] = { link = "@constant" }
        end,
      }
    end,
  },

  -- ===================
  --     Snacks.nvim
  -- ===================

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local colors = {
        blue = "#2ac3de",
        green = "#9ece6a",
        black = "#1a1b26",
        white = "#c0caf5",
        red = "#f7768e",
        violet = "#bb9af7",
        grey = "#24283b",
        yellow = "#e0af68",
        orange = "#9ece6a",
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
        symbols = { added = " ", modified = " ", removed = " " },
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
        return ("%02d:%02d"):format(time.hour, time.min)
      end

      local ins_mid = function()
        return "%="
      end

      return {
        options = {
          icons_enabled = true,
          theme = theme,
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
    end,
  },

  -- ===================
  --     Snacks.nvim
  -- ===================

  {

    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
          _______  _        _______                   _________ _______ 
|\     /|(  ___  )( (    /|(  ____ \|\     /||\     /|\__   __/(       )
| )   ( || (   ) ||  \  ( || (    \/( \   / )| )   ( |   ) (   | () () |
| (___) || |   | ||   \ | || (__     \ (_) / | |   | |   | |   | || || |
|  ___  || |   | || (\ \) ||  __)     \   /  ( (   ) )   | |   | |(_)| |
| (   ) || |   | || | \   || (         ) (    \ \_/ /    | |   | |   | |
| )   ( || (___) || )  \  || (____/\   | |     \   /  ___) (___| )   ( |
|/     \|(_______)|/    )_)(_______/   \_/      \_/   \_______/|/     \|
]],

        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },

        sections = {
          { section = "header" },
          { section = "keys", gap = 1 },
          {
            align = "center",
            text = { "󰗦 Shashank Singh 2025", hl = "Title" },
            padding = { 0, 3 },
          },
        },
      },
    },
  },
}
