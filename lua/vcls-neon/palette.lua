---@class VclsNeonPalette
--- Color palette definition for vcls-neon.nvim
--- Main background & accents: Jellybeans (#151515)
--- Foreground: Nightfox (#cdcecf fg1)
local M = {}

---@type table
M.colors = {
  -- =========================================================================
  -- BACKGROUND COLORS (Jellybeans shades)
  -- =========================================================================
  bg = {
    main = "#151515",      -- Jellybeans: Canonical dark charcoal background
    dark = "#101010",      -- Jellybeans: Popups, statusline, deep dark shade
    alt = "#121212",       -- Jellybeans: Alternate deep background
    dim = "#1a1a1a",       -- Jellybeans: Inactive window background
    line = "#1c1c1c",      -- Jellybeans: CursorLine, CursorColumn
    selection = "#404040", -- Jellybeans: Visual selection
    border = "#535d66",    -- Jellybeans: Window borders, VertSplit
    float = "#1c1c1c",     -- Jellybeans: Floating window background
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
