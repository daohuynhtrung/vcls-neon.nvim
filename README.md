# vcls-neon.nvim 🌊🦊

A modern, highly modular Neovim colorscheme written entirely in Lua.

**vcls-neon** blends the iconic ink background of **Kanagawa** (`#1F1F28`) with the crisp, balanced foreground of **Nightfox** (`#cdcecf`). Its modular structure makes it effortless to customize and expand accent, syntax, and plugin colors.

---

## 🎨 Palette Foundations

| Role | Color | Hex | Origin |
| :--- | :--- | :--- | :--- |
| **Main Background** | ![#1F1F28](https://via.placeholder.com/15/1F1F28/000000?text=+) `#1F1F28` | `#1F1F28` | **Kanagawa** (`sumiInk3`) |
| **Dark / Floats BG** | ![#16161D](https://via.placeholder.com/15/16161D/000000?text=+) `#16161D` | `#16161D` | **Kanagawa** (`sumiInk0`) |
| **Line / Fold BG** | ![#2A2A37](https://via.placeholder.com/15/2A2A37/000000?text=+) `#2A2A37` | `#2A2A37` | **Kanagawa** (`sumiInk4`) |
| **Visual Selection** | ![#363646](https://via.placeholder.com/15/363646/000000?text=+) `#363646` | `#363646` | **Kanagawa** (`sumiInk5`) |
| **Main Foreground** | ![#cdcecf](https://via.placeholder.com/15/cdcecf/000000?text=+) `#cdcecf` | `#cdcecf` | **Nightfox** (`fg1`) |
| **Bright Foreground** | ![#d6d6d7](https://via.placeholder.com/15/d6d6d7/000000?text=+) `#d6d6d7` | `#d6d6d7` | **Nightfox** (`fg0`) |
| **Muted Foreground** | ![#aeafb0](https://via.placeholder.com/15/aeafb0/000000?text=+) `#aeafb0` | `#aeafb0` | **Nightfox** (`fg2`) |
| **Subtle / Numbers** | ![#71839b](https://via.placeholder.com/15/71839b/000000?text=+) `#71839b` | `#71839b` | **Nightfox** (`fg3`) |
| **Comment** | ![#738091](https://via.placeholder.com/15/738091/000000?text=+) `#738091` | `#738091` | **Nightfox** (`comment`) |

*All syntax accents, Git tokens, and diagnostics are modularly organized in `lua/vcls-neon/palette.lua` for easy updates.*

---

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "vcls-neon.nvim", -- or your repo path e.g. "username/vcls-neon.nvim"
  lazy = false,
  priority = 1000,
  config = function()
    require("vcls-neon").setup({
      -- your configuration here (optional)
    })
    vim.cmd.colorscheme("vcls-neon")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "username/vcls-neon.nvim",
  config = function()
    require("vcls-neon").setup()
    vim.cmd.colorscheme("vcls-neon")
  end,
})
```

---

## ⚙️ Configuration

`vcls-neon` comes with sensible defaults. You can override any setting:

```lua
require("vcls-neon").setup({
  transparent = false,     -- Set to true to disable background colors (transparent terminal)
  terminal_colors = true,  -- Automatically configure Neovim's terminal colors
  dim_inactive = false,    -- Dim inactive window backgrounds
  styles = {
    comments = { italic = true },
    keywords = { bold = false, italic = false },
    functions = { bold = false, italic = false },
    variables = {},
    strings = {},
  },
  palette_overrides = {
    -- Override any palette color directly
    -- accents = { yellow = "#E6C384" },
  },
  highlight_overrides = {
    -- Override or define custom highlight groups
    -- Normal = { bg = "#1A1A22" },
  },
})
```

---

## 🧩 Project Architecture & Updating Colors Later

The codebase is organized into cleanly separated modules so you can easily update colors and highlight rules:

```
vcls-neon.nvim/
├── colors/
│   └── vcls-neon.lua             # Entry point for `:colorscheme vcls-neon`
└── lua/
    └── vcls-neon/
        ├── init.lua              # Public API (setup, load, colors)
        ├── config.lua            # Default user options
        ├── palette.lua           # 🎨 Core color definitions (Kanagawa bg, Nightfox fg, accents)
        ├── theme.lua             # Aggregator (merges groups, sets terminal colors)
        └── groups/               # Highlight group definitions
            ├── editor.lua        # Editor UI (Normal, CursorLine, LineNr, StatusLine, Pmenu, etc.)
            ├── syntax.lua        # Standard syntax highlighting (Comment, Keyword, Function, etc.)
            ├── treesitter.lua    # Tree-sitter captures (@variable, @keyword, @markup, etc.)
            ├── lsp.lua           # LSP diagnostics and semantic tokens
            └── plugins.lua       # Integrations (Telescope, Neo-tree, NvimTree, Cmp, WhichKey, etc.)
```

### How to update colors:

1. Open [`lua/vcls-neon/palette.lua`](lua/vcls-neon/palette.lua).
2. Edit values in the `accents`, `git`, or `diag` tables.
3. If you want to change how a color maps to a syntax item or UI element, edit the corresponding file in `lua/vcls-neon/groups/`.

---

## 🧪 Testing

You can run automated smoke tests in headless Neovim at any time:

```bash
nvim --headless -u NONE -c "set rtp+=." -l tests/test_colorscheme.lua
```

---

## 📄 License

[MIT](LICENSE)
