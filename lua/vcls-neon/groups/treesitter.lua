local M = {}

--- Generate Tree-sitter highlight groups
---@param c table The palette table
---@param opts table The user configuration options
---@return table<string, table>
function M.get(c, opts)
  local styles = opts.styles or {}

  return {
    -- Identifiers
    ["@variable"] = vim.tbl_extend("force", { fg = c.fg.main }, styles.variables or {}),
    ["@variable.builtin"] = { fg = c.accents.red },
    ["@variable.parameter"] = { fg = c.accents.orange },
    ["@variable.member"] = { fg = c.fg.main },

    -- Constants
    ["@constant"] = { fg = c.accents.orange },
    ["@constant.builtin"] = { fg = c.accents.orange, bold = true },
    ["@constant.macro"] = { fg = c.accents.pink },

    -- Modules
    ["@module"] = { fg = c.accents.cyan },
    ["@module.builtin"] = { fg = c.accents.cyan },
    ["@label"] = { fg = c.accents.cyan },

    -- Literals
    ["@string"] = vim.tbl_extend("force", { fg = c.accents.green }, styles.strings or {}),
    ["@string.documentation"] = { fg = c.fg.comment },
    ["@string.regex"] = { fg = c.accents.yellow },
    ["@string.escape"] = { fg = c.accents.teal },
    ["@string.special"] = { fg = c.accents.teal },
    ["@character"] = { fg = c.accents.green },
    ["@character.special"] = { fg = c.accents.teal },
    ["@boolean"] = { fg = c.accents.orange, bold = true },
    ["@number"] = { fg = c.accents.yellow },
    ["@number.float"] = { fg = c.accents.yellow },

    -- Types
    ["@type"] = { fg = c.accents.cyan },
    ["@type.builtin"] = { fg = c.accents.cyan },
    ["@type.definition"] = { fg = c.accents.cyan },
    ["@attribute"] = { fg = c.accents.pink },
    ["@property"] = { fg = c.fg.main },

    -- Functions
    ["@function"] = vim.tbl_extend("force", { fg = c.accents.blue }, styles.functions or {}),
    ["@function.builtin"] = { fg = c.accents.blue, bold = true },
    ["@function.call"] = { fg = c.accents.blue },
    ["@function.macro"] = { fg = c.accents.pink },
    ["@function.method"] = { fg = c.accents.blue },
    ["@function.method.call"] = { fg = c.accents.blue },
    ["@constructor"] = { fg = c.accents.cyan },
    ["@operator"] = { fg = c.accents.magenta },

    -- Keywords
    ["@keyword"] = vim.tbl_extend("force", { fg = c.accents.magenta }, styles.keywords or {}),
    ["@keyword.coroutine"] = { fg = c.accents.magenta },
    ["@keyword.function"] = { fg = c.accents.magenta },
    ["@keyword.operator"] = { fg = c.accents.magenta },
    ["@keyword.import"] = { fg = c.accents.pink },
    ["@keyword.type"] = { fg = c.accents.magenta },
    ["@keyword.modifier"] = { fg = c.accents.magenta },
    ["@keyword.repeat"] = { fg = c.accents.magenta },
    ["@keyword.return"] = { fg = c.accents.magenta },
    ["@keyword.debug"] = { fg = c.accents.red },
    ["@keyword.exception"] = { fg = c.accents.red },
    ["@keyword.conditional"] = { fg = c.accents.magenta },
    ["@keyword.directive"] = { fg = c.accents.pink },
    ["@keyword.directive.define"] = { fg = c.accents.pink },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = c.fg.muted },
    ["@punctuation.bracket"] = { fg = c.fg.muted },
    ["@punctuation.special"] = { fg = c.accents.teal },

    -- Comments
    ["@comment"] = vim.tbl_extend("force", { fg = c.fg.comment }, styles.comments or {}),
    ["@comment.documentation"] = { fg = c.fg.comment },
    ["@comment.error"] = { fg = c.diag.error, bold = true },
    ["@comment.warning"] = { fg = c.diag.warn, bold = true },
    ["@comment.todo"] = { fg = c.bg.main, bg = c.accents.yellow, bold = true },
    ["@comment.note"] = { fg = c.accents.blue, bold = true },

    -- Markup (Markdown, etc.)
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.accents.blue, bold = true },
    ["@markup.heading.1"] = { fg = c.accents.magenta, bold = true },
    ["@markup.heading.2"] = { fg = c.accents.blue, bold = true },
    ["@markup.heading.3"] = { fg = c.accents.cyan, bold = true },
    ["@markup.heading.4"] = { fg = c.accents.green, bold = true },
    ["@markup.heading.5"] = { fg = c.accents.yellow, bold = true },
    ["@markup.heading.6"] = { fg = c.accents.orange, bold = true },
    ["@markup.quote"] = { fg = c.fg.muted, italic = true },
    ["@markup.math"] = { fg = c.accents.teal },
    ["@markup.link"] = { fg = c.accents.cyan, underline = true },
    ["@markup.link.label"] = { fg = c.accents.blue },
    ["@markup.link.url"] = { fg = c.accents.teal, underline = true },
    ["@markup.raw"] = { fg = c.accents.yellow },
    ["@markup.list"] = { fg = c.accents.teal },
    ["@markup.list.checked"] = { fg = c.accents.green },
    ["@markup.list.unchecked"] = { fg = c.fg.muted },

    -- Tags (HTML, XML, JSX)
    ["@tag"] = { fg = c.accents.blue },
    ["@tag.attribute"] = { fg = c.accents.yellow },
    ["@tag.delimiter"] = { fg = c.fg.muted },
  }
end

return M
