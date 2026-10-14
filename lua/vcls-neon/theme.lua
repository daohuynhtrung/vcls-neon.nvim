local M = {}

--- Generate all highlight groups and theme settings
---@param config table The configuration table
---@param palette_module table The palette module
---@return table { highlights = table, palette = table }
function M.setup(config, palette_module)
  local c = palette_module.get(config.palette_overrides)

  local editor = require("vcls-neon.groups.editor").get(c, config)
  local syntax = require("vcls-neon.groups.syntax").get(c, config)
  local treesitter = require("vcls-neon.groups.treesitter").get(c, config)
  local lsp = require("vcls-neon.groups.lsp").get(c, config)
  local plugins = require("vcls-neon.groups.plugins").get(c, config)

  local highlights = vim.tbl_extend("force", editor, syntax, treesitter, lsp, plugins)

  -- Apply user highlight overrides if provided
  if config.highlight_overrides then
    local overrides = config.highlight_overrides
    if type(overrides) == "function" then
      overrides = overrides(c)
    end
    if type(overrides) == "table" then
      highlights = vim.tbl_deep_extend("force", highlights, overrides)
    end
  end

  return {
    highlights = highlights,
    palette = c,
  }
end

--- Configure Neovim terminal colors based on the palette
---@param c table The palette table
function M.set_terminal_colors(c)
  vim.g.terminal_color_0 = c.bg.dark
  vim.g.terminal_color_1 = c.accents.red
  vim.g.terminal_color_2 = c.accents.green
  vim.g.terminal_color_3 = c.accents.yellow
  vim.g.terminal_color_4 = c.accents.blue
  vim.g.terminal_color_5 = c.accents.magenta
  vim.g.terminal_color_6 = c.accents.cyan
  vim.g.terminal_color_7 = c.fg.main
  vim.g.terminal_color_8 = c.fg.comment
  vim.g.terminal_color_9 = c.accents.red
  vim.g.terminal_color_10 = c.accents.green
  vim.g.terminal_color_11 = c.accents.yellow
  vim.g.terminal_color_12 = c.accents.blue
  vim.g.terminal_color_13 = c.accents.magenta
  vim.g.terminal_color_14 = c.accents.cyan
  vim.g.terminal_color_15 = c.fg.bright
end

return M
