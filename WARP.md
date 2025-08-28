# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

**Note: This is vague-light.nvim, a light colorscheme based on vague.nvim**

## Table of Contents

1. [Development Commands](#development-commands)
2. [High-Level Architecture](#high-level-architecture)
3. [Codebase Structure](#codebase-structure)
4. [Installation & Configuration](#installation--configuration)
5. [Plugin Support & Extending](#plugin-support--extending)
6. [Development Workflow](#development-workflow)

## Development Commands

### Code Formatting
```bash
# Format all Lua code using the project's StyLua configuration
stylua .
```

### Testing
```bash
# Test the colorscheme loads without errors (headless Neovim)
nvim --headless +"lua require('vague')._colorscheme()" +qa

# Visual testing workflow (see VISUAL-TESTS.md)
# Open different language files to verify syntax highlighting
nvim test_files/example.py  # Python
nvim test_files/example.go  # Go
nvim test_files/example.rs  # Rust
```

### Linting (Optional)
```bash
# If luacheck is installed
luacheck lua/ --globals vim

# If selene is installed  
selene lua/
```

## High-Level Architecture

The vague-light.nvim colorscheme follows a modular architecture with clear data flow (inherited from vague.nvim):

1. **Configuration Layer** (`lua/vague/config/`)
   - `internal.lua`: Default configuration merged with user options
   - `meta.lua`: Type definitions and annotations

2. **Highlight Groups** (`lua/vague/groups/`)
   - Each file defines highlight groups for specific contexts (syntax, LSP, plugins)
   - Groups are assembled in `groups/init.lua` and return color mappings

3. **Application Layer**
   - `highlights.lua`: Iterates through all groups and applies vim highlight commands
   - `terminal.lua`: Sets terminal color variables
   - `utilities.lua`: Color blending and manipulation functions

4. **Entry Points**
   - `colors/vague.lua`: Neovim runtime colorscheme entry point
   - `lua/vague/init.lua`: Main module with setup() and palette access

### Data Flow
```
require('vague').setup(user_config)
  ↓
config/internal.lua (merge defaults + user config)
  ↓
groups/*.lua (generate highlight tables using merged config)
  ↓
highlights.set_highlights() (apply vim highlight commands)
  +
terminal.set_highlights() (set terminal colors)
  ↓
colors/vague-light.lua (:colorscheme vague-light entry point)
```

## Codebase Structure

```
vague-light.nvim/
├── colors/
│   └── vague-light.lua        # Neovim colorscheme entry point
├── lua/vague/
│   ├── config/
│   │   ├── internal.lua       # Default config and user merge logic
│   │   └── meta.lua          # Type definitions for config
│   ├── groups/
│   │   ├── init.lua          # Aggregates all highlight groups
│   │   ├── common.lua        # Basic vim highlights
│   │   ├── syntax.lua        # Syntax highlighting
│   │   ├── treesitter.lua    # TreeSitter highlights
│   │   ├── lsp-native.lua    # Native LSP highlights  
│   │   └── *.lua             # Plugin-specific highlights
│   ├── highlights.lua        # Applies highlight groups to vim
│   ├── init.lua             # Main module interface
│   ├── terminal.lua         # Terminal color configuration
│   └── utilities.lua        # Color manipulation utilities
├── extras/                  # External tool color themes
│   ├── alacritty/
│   ├── kitty/
│   ├── warp/
│   └── ...
├── .stylua.toml            # Code formatting configuration
├── .luarc.json             # Lua LSP configuration
├── README.md               # User documentation
└── VISUAL-TESTS.md         # Testing methodology
```

## Installation & Configuration

### Basic Installation (lazy.nvim)
```lua path=null start=null
{
  "your-username/vague-light.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      -- optional configuration
    })
    vim.cmd("colorscheme vague-light")
  end
}
```

### Key Configuration Options
- `transparent`: Remove background colors
- `bold`/`italic`: Global enable/disable for text styles  
- `style`: Fine-grained control over syntax element styling
- `colors`: Override default color palette
- `plugins`: Plugin-specific style configuration
- `on_highlights`: Custom highlight override function

## Plugin Support & Extending

### Currently Supported Plugins
- Blink-cmp, nvim-cmp (completion)
- Dashboard, Neo-tree, Telescope (UI)
- LSP diagnostics, Treesitter, Gitsigns
- Neotest, Mini.nvim, Lualine
- Snacks.nvim, Rainbow delimiters

### Adding New Plugin Support

1. **Create highlight group file**:
```lua path=null start=null
-- lua/vague/groups/newplugin.lua
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  
  return {
    NewPluginHighlight = { fg = c.fg, bg = c.bg },
    NewPluginSpecial = { fg = c.keyword, gui = "bold" },
  }
end

return M
```

2. **Register in groups/init.lua**:
```lua path=null start=null
-- Add to the return table
newplugin = require("vague.groups.newplugin").get_colors(curr_internal_conf),
```

3. **Test the integration**:
```bash
nvim --headless +"lua require('vague')._colorscheme()" +"lua print('OK')" +qa
```

## Development Workflow

### Code Style
- Use StyLua for consistent formatting (`stylua .`)
- Follow existing patterns in highlight group files
- Maintain type annotations using lua-language-server

### Testing Changes
1. Visual test with different language files (see VISUAL-TESTS.md)
2. Test with supported plugins installed
3. Verify both light and dark terminal backgrounds
4. Check transparent mode compatibility

### Color Palette Access
```lua path=null start=null
-- Get current color palette for external tools
local palette = require('vague').get_palette()
print(palette.bg)  -- "#f8f8f9"
```

### Adding External Tool Themes
External tool configurations go in `extras/<tool>/` and should match the core Neovim palette defined in `lua/vague/config/internal.lua`.
