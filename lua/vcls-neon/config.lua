---@class VclsNeonConfig
--- User configuration handling for vcls-neon.nvim
local M = {}

---@type table
M.defaults = {
  transparent = false,     -- Disable background for transparency
  terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*)
  dim_inactive = false,    -- Dim inactive window backgrounds
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = false },
    functions = { bold = false, italic = false },
    variables = {},
    strings = {},
  },
  palette_overrides = {},   -- Table to override specific colors in the palette
  highlight_overrides = {}, -- Table or function(colors) to override highlight groups
}

---@type table
M.options = vim.deepcopy(M.defaults)

--- Set user options
---@param opts? table
function M.set(opts)
  if opts then
    M.options = vim.tbl_deep_extend("force", M.defaults, opts)
  else
    M.options = vim.deepcopy(M.defaults)
  end
end

--- Get current configuration options
---@return table
function M.get()
  return M.options
end

return M
