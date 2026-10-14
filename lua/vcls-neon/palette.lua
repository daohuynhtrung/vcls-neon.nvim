---@class VclsNeonPalette
--- Color palette definition for vcls-neon.nvim
--- Main background: Kanagawa (#1F1F28 sumiInk3)
--- Foreground: Nightfox (#cdcecf fg1)
--- Other colors: Initial palette values ready to be updated later
local M = {}

---@type table
M.colors = {
  -- =========================================================================
  -- BACKGROUND COLORS (Kanagawa Wave / Ink shades)
  -- =========================================================================
  bg = {
    main = "#1F1F28",      -- Kanagawa sumiInk3: Primary editor background
    dark = "#16161D",      -- Kanagawa sumiInk0: Floating windows, popups, sidebars
    alt = "#181820",       -- Kanagawa sumiInk1: Alternative deep background
    dim = "#1A1A22",       -- Kanagawa sumiInk2: Inactive / dim background
    line = "#2A2A37",      -- Kanagawa sumiInk4: CursorLine, fold background
    selection = "#363646", -- Kanagawa sumiInk5: Visual selection, PmenuSel
    border = "#54546D",    -- Kanagawa sumiInk6: Window borders, separators
    float = "#16161D",     -- Floating window background
  },

  -- =========================================================================
  -- FOREGROUND COLORS (Nightfox shades)
  -- =========================================================================
  fg = {
    main = "#cdcecf",      -- Nightfox fg1: Default text foreground
    bright = "#d6d6d7",    -- Nightfox fg0: Lighter / prominent foreground
    muted = "#aeafb0",     -- Nightfox fg2: Status line / muted text
    subtle = "#71839b",    -- Nightfox fg3: Line numbers, fold columns
    comment = "#738091",   -- Nightfox comment: Code comments
  },

  -- =========================================================================
  -- ACCENT & SYNTAX COLORS (PLACEHOLDER PALETTE - UPDATE LATER)
  -- =========================================================================
  -- Modify these hex codes to adjust syntax highlighting and UI accents:
  accents = {
    red = "#c94f6d",       -- Errors, exceptions, deletes
    green = "#81b29a",     -- Strings, additions, success
    yellow = "#dbc074",    -- Warnings, numbers, special symbols
    blue = "#719cd6",      -- Functions, methods, titles
    magenta = "#9d79d6",   -- Statements, operators, keywords
    cyan = "#63cdcf",      -- Types, builtins, regex
    orange = "#f4a261",    -- Constants, parameters, tags
    pink = "#d67ad2",      -- Preprocessors, special identifiers
    teal = "#7AA89F",      -- Hints, special tags
  },

  -- =========================================================================
  -- GIT / VCS COLORS (UPDATE LATER)
  -- =========================================================================
  git = {
    add = "#81b29a",
    change = "#719cd6",
    delete = "#c94f6d",
    dirty = "#dbc074",
    text = "#71839b",
  },

  -- =========================================================================
  -- DIAGNOSTICS COLORS (UPDATE LATER)
  -- =========================================================================
  diag = {
    error = "#c94f6d",
    warn = "#dbc074",
    info = "#719cd6",
    hint = "#63cdcf",
    ok = "#81b29a",
  },
}

--- Returns the color palette with user overrides applied
---@param overrides? table
---@return table
function M.get(overrides)
  if not overrides or vim.tbl_isempty(overrides) then
    return vim.deepcopy(M.colors)
  end
  return vim.tbl_deep_extend("force", vim.deepcopy(M.colors), overrides)
end

return M
