local M = {}

--- Generate highlights for popular Neovim plugins
---@param c table The palette table
---@param opts table The user configuration options
---@return table<string, table>
function M.get(c, opts)
  local float_bg = opts.transparent and "NONE" or c.bg.float
  local dark_bg = opts.transparent and "NONE" or c.bg.dark

  return {
    -- GitSigns
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.git.delete },
    GitSignsAddNr = { fg = c.git.add },
    GitSignsChangeNr = { fg = c.git.change },
    GitSignsDeleteNr = { fg = c.git.delete },
    GitSignsAddLn = { bg = c.bg.line },
    GitSignsChangeLn = { bg = c.bg.line },
    GitSignsDeleteLn = { bg = c.bg.line },

    -- Telescope
    TelescopeNormal = { fg = c.fg.main, bg = float_bg },
    TelescopeBorder = { fg = c.bg.border, bg = float_bg },
    TelescopeTitle = { fg = c.fg.bright, bg = c.accents.blue, bold = true },
    TelescopePromptNormal = { fg = c.fg.bright, bg = c.bg.dark },
    TelescopePromptBorder = { fg = c.bg.border, bg = c.bg.dark },
    TelescopePromptTitle = { fg = c.bg.main, bg = c.accents.orange, bold = true },
    TelescopePromptPrefix = { fg = c.accents.orange },
    TelescopeSelection = { fg = c.fg.bright, bg = c.bg.selection, bold = true },
    TelescopeSelectionCaret = { fg = c.accents.orange },
    TelescopeMatching = { fg = c.accents.yellow, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg.main, bg = dark_bg },
    NvimTreeNormalNC = { fg = c.fg.muted, bg = dark_bg },
    NvimTreeRootFolder = { fg = c.accents.blue, bold = true },
    NvimTreeFolderIcon = { fg = c.accents.yellow },
    NvimTreeFolderName = { fg = c.fg.bright },
    NvimTreeOpenedFolderName = { fg = c.fg.bright, bold = true },
    NvimTreeEmptyFolderName = { fg = c.fg.subtle },
    NvimTreeIndentMarker = { fg = c.bg.border },
    NvimTreeGitDirty = { fg = c.git.dirty },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.accents.orange, underline = true },
    NvimTreeCursorLine = { bg = c.bg.line },

    -- Neo-tree
    NeoTreeNormal = { fg = c.fg.main, bg = dark_bg },
    NeoTreeNormalNC = { fg = c.fg.muted, bg = dark_bg },
    NeoTreeRootName = { fg = c.accents.blue, bold = true },
    NeoTreeDirectoryIcon = { fg = c.accents.yellow },
    NeoTreeDirectoryName = { fg = c.fg.bright },
    NeoTreeFileName = { fg = c.fg.main },
    NeoTreeGitAdded = { fg = c.git.add },
    NeoTreeGitModified = { fg = c.git.change },
    NeoTreeGitDeleted = { fg = c.git.delete },
    NeoTreeIndentMarker = { fg = c.bg.border },

    -- nvim-cmp
    CmpItemAbbr = { fg = c.fg.main },
    CmpItemAbbrDeprecated = { fg = c.fg.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.accents.yellow, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.accents.yellow, bold = true },
    CmpItemMenu = { fg = c.fg.comment },
    CmpItemKindDefault = { fg = c.accents.cyan },
    CmpItemKindKeyword = { fg = c.accents.magenta },
    CmpItemKindVariable = { fg = c.accents.orange },
    CmpItemKindConstant = { fg = c.accents.orange },
    CmpItemKindFunction = { fg = c.accents.blue },
    CmpItemKindMethod = { fg = c.accents.blue },
    CmpItemKindConstructor = { fg = c.accents.cyan },
    CmpItemKindClass = { fg = c.accents.cyan },
    CmpItemKindInterface = { fg = c.accents.cyan },
    CmpItemKindStruct = { fg = c.accents.cyan },
    CmpItemKindProperty = { fg = c.fg.main },
    CmpItemKindField = { fg = c.fg.main },
    CmpItemKindSnippet = { fg = c.accents.teal },
    CmpItemKindText = { fg = c.fg.main },

    -- blink.cmp
    BlinkCmpMenu = { fg = c.fg.main, bg = float_bg },
    BlinkCmpMenuBorder = { fg = c.bg.border, bg = float_bg },
    BlinkCmpLabel = { fg = c.fg.main },
    BlinkCmpLabelMatch = { fg = c.accents.yellow, bold = true },
    BlinkCmpDoc = { fg = c.fg.main, bg = float_bg },
    BlinkCmpDocBorder = { fg = c.bg.border, bg = float_bg },

    -- WhichKey
    WhichKey = { fg = c.accents.orange },
    WhichKeyGroup = { fg = c.accents.blue },
    WhichKeyDesc = { fg = c.fg.main },
    WhichKeySeparator = { fg = c.fg.subtle },
    WhichKeyFloat = { bg = float_bg },

    -- Indent Blankline (ibl)
    IblIndent = { fg = c.bg.line },
    IblWhitespace = { fg = c.bg.line },
    IblScope = { fg = c.bg.border },
    IndentBlanklineChar = { fg = c.bg.line },
    IndentBlanklineContextChar = { fg = c.bg.border },

    -- BufferLine
    BufferLineFill = { bg = c.bg.dark },
    BufferLineBackground = { fg = c.fg.subtle, bg = c.bg.dark },
    BufferLineBufferSelected = { fg = c.fg.bright, bg = c.bg.main, bold = true },
    BufferLineSeparator = { fg = c.bg.dark, bg = c.bg.dark },
    BufferLineSeparatorSelected = { fg = c.bg.dark, bg = c.bg.main },
    BufferLineIndicatorSelected = { fg = c.accents.yellow },
  }
end

return M
