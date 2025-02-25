-- Config for nvim-cmp (A completion plugin for neovim coded in Lua)

return {
  "hrsh7th/nvim-cmp",
  optional = true,
  opts = function(_, opts)
    -- C/CPP
    opts.sorting = opts.sorting or {}
    opts.sorting.comparators = opts.sorting.comparators or {}
    table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))

    -- Python
    opts.auto_brackets = opts.auto_brackets or {}
    table.insert(opts.auto_brackets, "python")
  end,
}
