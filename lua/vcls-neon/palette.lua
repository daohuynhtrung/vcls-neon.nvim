---@class VclsNeonPalette
--- Color palette definition for vcls-neon.nvim
--- Main background: Arctic (#1f1f1f)
--- Foreground: Nightfox (#cdcecf fg1)
--- Accents & Syntax: Jellybeans
local M = {}

---@type table
M.colors = {
  -- =========================================================================
  -- BACKGROUND COLORS (Arctic shades - softer, comfortable dark)
  -- =========================================================================
  bg = {
    main = "#1f1f1f",      -- Arctic norm_bg: Primary editor background
    dark = "#181818",      -- Arctic black4: Popups, statusline, deep dark shade
    alt = "#1c1c1c",       -- Arctic: Alternate deep background
    dim = "#252526",       -- Arctic black2: Inactive window / sidebar background
    line = "#282828",      -- Arctic black3: CursorLine, CursorColumn
    selection = "#343a41", -- Arctic: Visual selection background
    border = "#454545",    -- Arctic float_border_fg: Window borders, separators
    float = "#252526",     -- Arctic black2: Floating window background
  },

  -- =========================================================================
  -- FOREGROUND COLORS (Nightfox shades - PRESERVED)
  -- =========================================================================
  fg = {
    main = "#cdcecf",      -- Nightfox fg1: Default text foreground
    bright = "#d6d6d7",    -- Nightfox fg0: Lighter / prominent foreground
    muted = "#aeafb0",     -- Nightfox fg2: Status line / muted text
    subtle = "#71839b",    -- Nightfox fg3: Line numbers, fold columns
    comment = "#738091",   -- Nightfox comment: Code comments
  },

  -- =========================================================================
  -- ACCENT & SYNTAX COLORS (Jellybeans palette)
  -- =========================================================================
  accents = {
    red = "#cf6a4c",       -- Jellybeans red (Constants, errors, exceptions)
    green = "#99ad6a",     -- Jellybeans green (Strings, additions)
    yellow = "#fad07a",    -- Jellybeans yellow (Functions, warnings)
    blue = "#8197bf",      -- Jellybeans blue (Statements, operators)
    magenta = "#c6b6ee",   -- Jellybeans purple / lavender (Identifiers, keywords)
    cyan = "#8fbfdc",      -- Jellybeans light cyan / sky blue (Structure, preproc)
    orange = "#ffb964",    -- Jellybeans amber orange (Types, parameters)
    pink = "#de5577",      -- Jellybeans pink (Special identifiers, tags)
    teal = "#799d6a",      -- Jellybeans olive teal (Special chars, hints)
  },

  -- =========================================================================
  -- GIT / VCS COLORS (Jellybeans palette)
  -- =========================================================================
  git = {
    add = "#99ad6a",       -- Jellybeans green
    change = "#8197bf",    -- Jellybeans blue
    delete = "#cf6a4c",    -- Jellybeans red
    dirty = "#fad07a",     -- Jellybeans yellow
    text = "#71839b",      -- Nightfox subtle
  },

  -- =========================================================================
  -- DIAGNOSTICS COLORS (Jellybeans palette)
  -- =========================================================================
  diag = {
    error = "#cf6a4c",     -- Jellybeans red
    warn = "#fad07a",      -- Jellybeans yellow
    info = "#8fbfdc",      -- Jellybeans cyan / sky blue
    hint = "#799d6a",      -- Jellybeans teal
    ok = "#99ad6a",        -- Jellybeans green
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
