---------------------------
-- @author: Shashank Singh
--
-- Lunarvim configurations
---------------------------

---------------------------
-- General Configurations
---------------------------

lvim.format_on_save = true
vim.diagnostic.config({ virtual_text = false })
vim.opt.cmdheight = 1
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })

---------------------------
-- Keybindings
---------------------------

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><Space>"] = ":noh<cr>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<cr>"
lvim.keys.insert_mode["jk"] = "<ESC>"

---------------------------
-- LSP Configurations
---------------------------

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "black",
    filetypes = { "python" }
  },
  {
    command = "isort",
    filetypes = { "python" }
  },
  {
    command = "prettierd",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "json" },
  }
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  -- {
  --   command = "eslint_d",
  --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
  -- },
  {
    command = "codespell",
    filetypes = { "javascript", "python", "typescript", "typescriptreact" },
  },
}


---------------------------
-- Plugins Configurations
---------------------------

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.alpha.dashboard.section.header.val = {
  [[          _______  _        _______                   _________ _______ ]],
  [[|\     /|(  ___  )( (    /|(  ____ \|\     /||\     /|\__   __/(       )]],
  [[| )   ( || (   ) ||  \  ( || (    \/( \   / )| )   ( |   ) (   | () () |]],
  [[| (___) || |   | ||   \ | || (__     \ (_) / | |   | |   | |   | || || |]],
  [[|  ___  || |   | || (\ \) ||  __)     \   /  ( (   ) )   | |   | |(_)| |]],
  [[| (   ) || |   | || | \   || (         ) (    \ \_/ /    | |   | |   | |]],
  [[| )   ( || (___) || )  \  || (____/\   | |     \   /  ___) (___| )   ( |]],
  [[|/     \|(_______)|/    )_)(_______/   \_/      \_/   \_______/|/     \|]],
  [[                                                                        ]],

}
lvim.builtin.alpha.dashboard.section.footer.val = "© Shashank Singh 2025"
lvim.builtin.treesitter.ignore_install = { "haskell" }

---------------------------
-- Import Lualine Config
---------------------------

local lualine_config = require("lualine_conf")
lvim.builtin.lualine.options = lualine_config.options
lvim.builtin.lualine.sections = lualine_config.sections
lvim.builtin.lualine.inactive_sections = lualine_config.inactive_sections
