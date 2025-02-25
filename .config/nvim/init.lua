--  ╭──────────────────────────────────────────────────────────────────────────────╮
--  │                        Neovim Initialization File                            │
--  │       (bootstraps LazyVim, lazy.nvim, and user-defined plugins)              │
--  ╰──────────────────────────────────────────────────────────────────────────────╯

require("config.lazy")

-- Limit the number of notifications

local MAX_NOTIFICATIONS = 4
local active_notifications = {}

vim.notify = function(msg, level, opts)
  if #active_notifications >= MAX_NOTIFICATIONS then
    -- Remove the oldest notification when limit is reached
    local removed = table.remove(active_notifications, 1)
    if removed then
      pcall(vim.api.nvim_buf_clear_namespace, 0, removed, 0, -1)
    end
  end

  -- Create a new notification and store its ID
  local id = vim.api.nvim_notify(msg, level, opts or {})
  table.insert(active_notifications, id)
end
