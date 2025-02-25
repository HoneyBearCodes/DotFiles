-- Configs for nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "java",
      -- Python
      "ninja",
      "rst",
    },
  },
}
