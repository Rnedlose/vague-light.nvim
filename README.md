# Vague Light

A light colorscheme for Neovim based on the [vague.nvim](https://github.com/vague2k/vague.nvim) theme.
<img width="3840" height="2160" alt="image" src="https://github.com/user-attachments/assets/a1cf035f-6237-4291-8621-2d65b5e67c6f" />



## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "your-username/vague-light.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      -- optional configuration here
    })
    vim.cmd("colorscheme vague-light")
  end
},
```

Using Neovim 0.12 built-in plugin manager `vim.pack`:

```lua
vim.pack.add({
  "https://github.com/your-username/vague-light.nvim",
})

require("vague").setup({
    -- optional configuration here
})

vim.cmd("colorscheme vague-light")
```

## Default configuration

```lua
require("vague").setup({
  transparent = false, -- don't set background
  -- disable bold/italic globally in `style`
  bold = true,
  italic = true,
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    boolean = "bold",
    number = "none",
    float = "none",
    error = "bold",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "italic",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "bold",
    builtin_functions = "none",
    builtin_types = "bold",
    builtin_variables = "none",
  },
  -- plugin styles where applicable
  -- make an issue/pr if you'd like to see more styling options!
  plugins = {
    cmp = {
      match = "bold",
      match_fuzzy = "bold",
    },
    dashboard = {
      footer = "italic",
    },
    lsp = {
      diagnostic_error = "bold",
      diagnostic_hint = "none",
      diagnostic_info = "italic",
      diagnostic_ok = "none",
      diagnostic_warn = "bold",
    },
    neotest = {
      focused = "bold",
      adapter_name = "bold",
    },
    telescope = {
      match = "bold",
    },
  },

  -- Override highlights or add new highlights
  on_highlights = function(highlights, colors) end,

  -- Override colors (default light theme colors shown)
  colors = {
    bg = "#f8f8f9",
    inactiveBg = "#ededf2",
    fg = "#2e2e30",
    floatBorder = "#737382",
    line = "#e8e8ed",
    comment = "#737382",
    builtin = "#4a6c8a",
    func = "#b8475b",
    string = "#d49a3d",
    number = "#d49a3d",
    property = "#4a6c8a",
    constant = "#7878a3",
    parameter = "#8b6b8d",
    visual = "#b8c5d1",
    error = "#b8475b",
    warning = "#d49a3d",
    hint = "#4a6c8a",
    operator = "#6b8aa3",
    keyword = "#4a6c8a",
    type = "#6b8aa3",
    search = "#dba654",
    plus = "#5d7b45",
    delta = "#d49a3d",
  },
})
```

## Explicitly Supported plugins

- [Blink-cmp](https://github.com/Saghen/blink.cmp)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Diffview](https://github.com/sindrets/diffview.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [Snacks](https://github.com/folke/snacks.nvim)
- [Rainbow delimiters](https://github.com/hiphish/rainbow-delimiters.nvim)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [Vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)

## Extras

Extra color configs for other tools can be found in [extras](extras/).

## Contributing

PR's are welcome and encouraged.

If you would like to propose support for a specific plugin, you can make a PR with your modifications to the `lua/vague/groups` directory
