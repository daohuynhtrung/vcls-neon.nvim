# vcls-neon.nvim 🍬🦊

A modern, highly modular Neovim colorscheme written entirely in Lua.

**vcls-neon** blends the rich, warm dark palette of **Jellybeans** (`#151515`) with the crisp, balanced foreground shades of **Nightfox** (`#cdcecf`). Its modular structure makes it effortless to customize and expand accent, syntax, and plugin colors.

---

## 🎨 Palette Foundations

| Role | Color | Hex | Origin |
| :--- | :--- | :--- | :--- |
| **Main Background** | ![#151515](https://via.placeholder.com/15/151515/000000?text=+) `#151515` | `#151515` | **Jellybeans** (main charcoal bg) |
| **Dark / Popups BG** | ![#101010](https://via.placeholder.com/15/101010/000000?text=+) `#101010` | `#101010` | **Jellybeans** |
| **Line / Fold BG** | ![#1c1c1c](https://via.placeholder.com/15/1c1c1c/000000?text=+) `#1c1c1c` | `#1c1c1c` | **Jellybeans** (`CursorLine`) |
| **Visual Selection** | ![#404040](https://via.placeholder.com/15/404040/000000?text=+) `#404040` | `#404040` | **Jellybeans** (`Visual`) |
| **Main Foreground** | ![#cdcecf](https://via.placeholder.com/15/cdcecf/000000?text=+) `#cdcecf` | `#cdcecf` | **Nightfox** (`fg1`) |
| **Bright Foreground** | ![#d6d6d7](https://via.placeholder.com/15/d6d6d7/000000?text=+) `#d6d6d7` | `#d6d6d7` | **Nightfox** (`fg0`) |
| **Muted Foreground** | ![#aeafb0](https://via.placeholder.com/15/aeafb0/000000?text=+) `#aeafb0` | `#aeafb0` | **Nightfox** (`fg2`) |
| **Subtle / Numbers** | ![#71839b](https://via.placeholder.com/15/71839b/000000?text=+) `#71839b` | `#71839b` | **Nightfox** (`fg3`) |
| **Comment** | ![#738091](https://via.placeholder.com/15/738091/000000?text=+) `#738091` | `#738091` | **Nightfox** (`comment`) |
| **Red (Constants/Errors)** | ![#cf6a4c](https://via.placeholder.com/15/cf6a4c/000000?text=+) `#cf6a4c` | `#cf6a4c` | **Jellybeans** |
| **Green (Strings)** | ![#99ad6a](https://via.placeholder.com/15/99ad6a/000000?text=+) `#99ad6a` | `#99ad6a` | **Jellybeans** |
| **Yellow (Functions)** | ![#fad07a](https://via.placeholder.com/15/fad07a/000000?text=+) `#fad07a` | `#fad07a` | **Jellybeans** |
| **Blue (Statements)** | ![#8197bf](https://via.placeholder.com/15/8197bf/000000?text=+) `#8197bf` | `#8197bf` | **Jellybeans** |
| **Purple (Keywords)** | ![#c6b6ee](https://via.placeholder.com/15/c6b6ee/000000?text=+) `#c6b6ee` | `#c6b6ee` | **Jellybeans** |
| **Cyan (Types/PreProc)** | ![#8fbfdc](https://via.placeholder.com/15/8fbfdc/000000?text=+) `#8fbfdc` | `#8fbfdc` | **Jellybeans** |
| **Orange (Types/Amber)** | ![#ffb964](https://via.placeholder.com/15/ffb964/000000?text=+) `#ffb964` | `#ffb964` | **Jellybeans** |

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

### How to update colors & instant reload:

1. Open [`lua/vcls-neon/palette.lua`](lua/vcls-neon/palette.lua).
2. Edit values in the `accents`, `git`, `diag`, or background/foreground tables.
3. Instant reload inside Neovim without restarting:
   - Run `:VclsNeonReload` to immediately apply changes.
   - Or run `:VclsNeonWatch` once: any time you save (`:w`) a palette or theme file, it will **auto-reload automatically**!

If you want to change how a color maps to a syntax item or UI element, edit the corresponding file in `lua/vcls-neon/groups/`.

---

## 🧪 Testing

You can run automated smoke tests in headless Neovim at any time:

```bash
nvim --headless -u NONE -c "set rtp+=." -l tests/test_colorscheme.lua
```

---

## 📄 License

[MIT](LICENSE)
