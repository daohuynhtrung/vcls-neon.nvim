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

return M
