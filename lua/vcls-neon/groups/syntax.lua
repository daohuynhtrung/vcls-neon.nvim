local M = {}

--- Generate standard syntax highlight groups
---@param c table The palette table
---@param opts table The user configuration options
---@return table<string, table>
function M.get(c, opts)
  local styles = opts.styles or {}

  return {
    -- Comments
    Comment = vim.tbl_extend("force", { fg = c.fg.comment }, styles.comments or {}),

    -- Constants
    Constant = { fg = c.accents.orange },
    String = vim.tbl_extend("force", { fg = c.accents.green }, styles.strings or {}),
    Character = { fg = c.accents.green },
    Number = { fg = c.accents.yellow },
    Boolean = { fg = c.accents.orange, bold = true },
    Float = { fg = c.accents.yellow },

    -- Identifiers
    Identifier = vim.tbl_extend("force", { fg = c.fg.main }, styles.variables or {}),
    Function = vim.tbl_extend("force", { fg = c.accents.blue }, styles.functions or {}),

    -- Statements
    Statement = { fg = c.accents.magenta },
    Conditional = { fg = c.accents.magenta },
    Repeat = { fg = c.accents.magenta },
    Label = { fg = c.accents.cyan },
    Operator = { fg = c.accents.magenta },
    Keyword = vim.tbl_extend("force", { fg = c.accents.magenta }, styles.keywords or {}),
    Exception = { fg = c.accents.red },

    -- PreProc
    PreProc = { fg = c.accents.pink },
    Include = { fg = c.accents.pink },
    Define = { fg = c.accents.pink },
    Macro = { fg = c.accents.pink },
    PreCondit = { fg = c.accents.pink },

    -- Types
    Type = { fg = c.accents.cyan },
    StorageClass = { fg = c.accents.magenta },
    Structure = { fg = c.accents.cyan },
    Typedef = { fg = c.accents.cyan },

    -- Special
    Special = { fg = c.accents.teal },
    SpecialChar = { fg = c.accents.teal },
    Tag = { fg = c.accents.blue },
    Delimiter = { fg = c.fg.muted },
    SpecialComment = { fg = c.accents.teal, italic = true },
    Debug = { fg = c.accents.red },

    -- Underlined, Error, Todo
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = c.fg.subtle },
    Error = { fg = c.diag.error, bold = true },
    Todo = { fg = c.bg.main, bg = c.accents.yellow, bold = true },
  }
end

return M
