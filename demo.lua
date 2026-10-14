-- ============================================================================
-- vcls-neon.nvim Theme Showcase / Visual Test
-- Test with: nvim -u NONE -c "set rtp+=." -c "syntax on" -c "colorscheme vcls-neon" demo.lua
-- ============================================================================

local M = {}

--- Configuration table with various types
M.config = {
  theme_name = "vcls-neon",
  active = true,
  background = "#1f1f1f", -- Arctic norm_bg
  foreground = "#cdcecf", -- Nightfox fg1
  count = 42,
  ratio = 3.14159,
  tags = { "neovim", "lua", "colorscheme", "arctic", "jellybeans", "nightfox" },
}

--- Calculate stats
---@param items table
---@param factor number
---@return table
function M.calculate(items, factor)
  local results = {}
  for index, val in ipairs(items) do
    if type(val) == "number" then
      table.insert(results, val * factor)
    else
      print(string.format("[INFO] Skipping non-numeric item at %d: %s", index, tostring(val)))
    end
  end
  return results
end

-- Exception handling demonstration
function M.safe_run(action)
  local ok, err = pcall(action)
  if not ok then
    error("Operation failed: " .. tostring(err))
  end
  return true
end

return M
