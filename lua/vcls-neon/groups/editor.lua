local M = {}

--- Generate editor UI highlight groups
---@param c table The palette table
---@param opts table The user configuration options
---@return table<string, table>
function M.get(c, opts)
  local bg = opts.transparent and "NONE" or c.bg.main
  local float_bg = opts.transparent and "NONE" or c.bg.float

  return {
    -- Base UI
    Normal = { fg = c.fg.main, bg = bg },
    NormalNC = { fg = c.fg.muted, bg = opts.dim_inactive and c.bg.dim or bg },
    NormalFloat = { fg = c.fg.main, bg = float_bg },
    FloatBorder = { fg = c.bg.border, bg = float_bg },
    FloatTitle = { fg = c.fg.bright, bg = float_bg, bold = true },

    -- Cursor & selection
    Cursor = { fg = c.bg.main, bg = c.fg.bright },
    CursorLine = { bg = c.bg.line },
    CursorColumn = { bg = c.bg.line },
    ColorColumn = { bg = c.bg.line },
    Visual = { bg = c.bg.selection },
    VisualNOS = { bg = c.bg.selection },

    -- Line numbers & columns
    LineNr = { fg = c.fg.subtle },
    CursorLineNr = { fg = c.accents.yellow, bold = true },
    SignColumn = { fg = c.fg.subtle, bg = bg },
    FoldColumn = { fg = c.fg.subtle, bg = bg },
    Folded = { fg = c.fg.muted, bg = c.bg.line },

    -- Window splitters & separators
    WinSeparator = { fg = c.bg.border },
    VertSplit = { fg = c.bg.border },

    -- StatusLine & TabLine
    StatusLine = { fg = c.fg.main, bg = c.bg.alt },
    StatusLineNC = { fg = c.fg.subtle, bg = c.bg.dark },
    TabLine = { fg = c.fg.muted, bg = c.bg.dark },
    TabLineFill = { bg = c.bg.dark },
    TabLineSel = { fg = c.fg.bright, bg = c.bg.main, bold = true },

    -- Popup menu (auto-complete, etc.)
    Pmenu = { fg = c.fg.main, bg = c.bg.dark },
    PmenuSel = { fg = c.fg.bright, bg = c.bg.selection, bold = true },
    PmenuSbar = { bg = c.bg.dark },
    PmenuThumb = { bg = c.bg.border },

    -- Search & match
    Search = { fg = c.bg.main, bg = c.accents.yellow },
    IncSearch = { fg = c.bg.main, bg = c.accents.orange, bold = true },
    CurSearch = { fg = c.bg.main, bg = c.accents.orange, bold = true },
    Substitute = { fg = c.bg.main, bg = c.accents.red },
    MatchParen = { fg = c.accents.orange, bg = c.bg.selection, bold = true },

    -- Messages & prompts
    ModeMsg = { fg = c.accents.green, bold = true },
    MsgArea = { fg = c.fg.main },
    MsgSeparator = { fg = c.bg.border },
    MoreMsg = { fg = c.accents.blue, bold = true },
    Question = { fg = c.accents.blue },
    ErrorMsg = { fg = c.diag.error, bold = true },
    WarningMsg = { fg = c.diag.warn, bold = true },

    -- Diffs
    DiffAdd = { fg = c.git.add, bg = c.bg.line },
    DiffChange = { fg = c.git.change, bg = c.bg.line },
    DiffDelete = { fg = c.git.delete, bg = c.bg.line },
    DiffText = { fg = c.accents.yellow, bg = c.bg.selection, bold = true },

    -- Misc
    Conceal = { fg = c.fg.subtle },
    Directory = { fg = c.accents.blue },
    Title = { fg = c.fg.bright, bold = true },
    NonText = { fg = c.fg.subtle },
    SpecialKey = { fg = c.fg.subtle },
    Whitespace = { fg = c.bg.border },
    WildMenu = { fg = c.fg.bright, bg = c.bg.selection },
    QuickFixLine = { bg = c.bg.selection, bold = true },
  }
end

return M
