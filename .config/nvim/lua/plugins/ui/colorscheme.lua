return {
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
}
