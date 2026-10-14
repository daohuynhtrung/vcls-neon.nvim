local M = {}

--- Generate LSP diagnostic and semantic highlight groups
---@param c table The palette table
---@param _ table The user configuration options
---@return table<string, table>
function M.get(c, _)
  return {
    -- Diagnostic Base
    DiagnosticError = { fg = c.diag.error },
    DiagnosticWarn = { fg = c.diag.warn },
    DiagnosticInfo = { fg = c.diag.info },
    DiagnosticHint = { fg = c.diag.hint },
    DiagnosticOk = { fg = c.diag.ok },

    -- Diagnostic Underlines
    DiagnosticUnderlineError = { sp = c.diag.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.diag.warn, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.diag.info, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.diag.hint, undercurl = true },
    DiagnosticUnderlineOk = { sp = c.diag.ok, undercurl = true },

    -- Diagnostic Virtual Text
    DiagnosticVirtualTextError = { fg = c.diag.error, bg = c.bg.dark },
    DiagnosticVirtualTextWarn = { fg = c.diag.warn, bg = c.bg.dark },
    DiagnosticVirtualTextInfo = { fg = c.diag.info, bg = c.bg.dark },
    DiagnosticVirtualTextHint = { fg = c.diag.hint, bg = c.bg.dark },
    DiagnosticVirtualTextOk = { fg = c.diag.ok, bg = c.bg.dark },

    -- Diagnostic Signs
    DiagnosticSignError = { fg = c.diag.error },
    DiagnosticSignWarn = { fg = c.diag.warn },
    DiagnosticSignInfo = { fg = c.diag.info },
    DiagnosticSignHint = { fg = c.diag.hint },
    DiagnosticSignOk = { fg = c.diag.ok },

    -- Diagnostic Floating Window
    DiagnosticFloatingError = { fg = c.diag.error },
    DiagnosticFloatingWarn = { fg = c.diag.warn },
    DiagnosticFloatingInfo = { fg = c.diag.info },
    DiagnosticFloatingHint = { fg = c.diag.hint },
    DiagnosticFloatingOk = { fg = c.diag.ok },

    -- LSP References & Inlay Hints
    LspReferenceText = { bg = c.bg.selection },
    LspReferenceRead = { bg = c.bg.selection },
    LspReferenceWrite = { bg = c.bg.selection, underline = true },
    LspSignatureActiveParameter = { fg = c.accents.orange, bold = true },
    LspInlayHint = { fg = c.fg.subtle, bg = c.bg.dark },

    -- LSP Semantic Token Types
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.macro"] = { link = "@constant.macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },
  }
end

return M
