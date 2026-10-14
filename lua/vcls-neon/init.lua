local config = require("vcls-neon.config")
local palette = require("vcls-neon.palette")
local theme = require("vcls-neon.theme")

local M = {}

--- Expose the active palette table for inspection or third-party integrations
--- e.g., local colors = require("vcls-neon").colors
M.colors = palette.colors

--- Configure vcls-neon options
---@param opts? table User options
function M.setup(opts)
  config.set(opts)
end

--- Load the colorscheme into Neovim
function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "vcls-neon"

  local cfg = config.get()
  local thm = theme.setup(cfg, palette)

  -- Apply highlight groups
  for group, hl in pairs(thm.highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- Apply terminal ANSI colors if enabled
  if cfg.terminal_colors then
    theme.set_terminal_colors(thm.palette)
  end
end

-- Alias for convenience
M.colorscheme = M.load

--- Purge cached modules and reload the theme with current file contents
function M.reload()
  local last_opts = config.get()
  for k in pairs(package.loaded) do
    if k:match("^vcls%-neon") then
      package.loaded[k] = nil
    end
  end
  local reloaded = require("vcls-neon")
  reloaded.setup(last_opts)
  reloaded.load()
  vim.notify("vcls-neon: Theme and palette reloaded!", vim.log.levels.INFO)
end

--- Automatically reload whenever any vcls-neon Lua file is saved
function M.watch()
  local group = vim.api.nvim_create_augroup("VclsNeonWatch", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = { "*/vcls-neon/*.lua", "*/vcls-neon.nvim/**/*.lua" },
    callback = function()
      M.reload()
    end,
    desc = "Auto-reload vcls-neon on file save",
  })
  vim.notify("vcls-neon: Live reload enabled! Changes will reload on save (:w).", vim.log.levels.INFO)
end

-- Create user commands if running inside an active Neovim session
if vim.api.nvim_create_user_command then
  vim.api.nvim_create_user_command("VclsNeonReload", function()
    M.reload()
  end, { desc = "Reload vcls-neon colorscheme and palette" })

  vim.api.nvim_create_user_command("VclsNeonWatch", function()
    M.watch()
  end, { desc = "Watch vcls-neon files and auto-reload on save" })
end

return M

