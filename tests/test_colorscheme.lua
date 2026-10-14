-- Smoke test for vcls-neon colorscheme
local function hex_to_dec(hex)
  return tonumber(hex:gsub("#", ""), 16)
end

print(">>> Starting vcls-neon tests...")

-- 1. Test basic colorscheme loading
vim.cmd("colorscheme vcls-neon")
assert(vim.g.colors_name == "vcls-neon", "vim.g.colors_name should be 'vcls-neon'")

-- 2. Verify Normal highlight matches Kanagawa bg (#1F1F28) and Nightfox fg (#cdcecf)
local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
local expected_bg = hex_to_dec("#1F1F28")
local expected_fg = hex_to_dec("#cdcecf")

assert(normal_hl.bg == expected_bg, string.format("Normal bg expected %d (#1F1F28), got %s", expected_bg, tostring(normal_hl.bg)))
assert(normal_hl.fg == expected_fg, string.format("Normal fg expected %d (#cdcecf), got %s", expected_fg, tostring(normal_hl.fg)))
print("  ✓ Normal highlight matches Kanagawa background (#1F1F28) and Nightfox foreground (#cdcecf)")

-- 3. Verify key syntax highlights
local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
local expected_comment = hex_to_dec("#738091")
assert(comment_hl.fg == expected_comment, "Comment fg should match Nightfox comment (#738091)")
assert(comment_hl.italic == true, "Comment should be italic by default")
print("  ✓ Syntax highlights loaded correctly")

-- 4. Verify Treesitter & LSP highlights
local ts_var = vim.api.nvim_get_hl(0, { name = "@variable" })
assert(ts_var.fg == expected_fg, "@variable fg should match Nightfox fg")

local diag_err = vim.api.nvim_get_hl(0, { name = "DiagnosticError" })
assert(diag_err.fg ~= nil, "DiagnosticError should have fg set")
print("  ✓ Treesitter and LSP diagnostic groups loaded")

-- 5. Test configuration options (e.g. transparency)
require("vcls-neon").setup({ transparent = true })
vim.cmd("colorscheme vcls-neon")
local transparent_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
assert(transparent_normal.bg == nil, "Transparent mode should not set bg")
print("  ✓ Transparent background configuration works")

-- 6. Test palette overrides
require("vcls-neon").setup({
  transparent = false,
  palette_overrides = {
    accents = {
      yellow = "#FFD700",
    },
  },
})
vim.cmd("colorscheme vcls-neon")
local number_hl = vim.api.nvim_get_hl(0, { name = "Number" })
assert(number_hl.fg == hex_to_dec("#FFD700"), "Number fg should reflect overridden yellow")
print("  ✓ Palette overrides work as expected")

-- 7. Reset to default
require("vcls-neon").setup({})
vim.cmd("colorscheme vcls-neon")

print(">>> All tests passed successfully!")
