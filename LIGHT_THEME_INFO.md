# Vague Light Theme

This is a light variant of the popular [vague.nvim](https://github.com/vague2k/vague.nvim) colorscheme.

## Color Palette

The following colors have been adapted for light mode based on the omarchy-vaguelight-theme:

| Color Name | Hex Code | Usage |
|------------|----------|-------|
| bg | `#f8f8f9` | Main background |
| inactiveBg | `#ededf2` | Inactive window background |
| fg | `#2e2e30` | Main foreground text |
| floatBorder | `#737382` | Float window borders |
| line | `#e8e8ed` | Current line, visual selections |
| comment | `#737382` | Comments |
| builtin | `#4a6c8a` | Built-in functions/constants |
| func | `#b8475b` | Function names |
| string | `#d49a3d` | String literals |
| number | `#d49a3d` | Numbers |
| property | `#4a6c8a` | Object properties |
| constant | `#7878a3` | Constants |
| parameter | `#8b6b8d` | Function parameters |
| visual | `#b8c5d1` | Visual mode selection |
| error | `#b8475b` | Error messages |
| warning | `#d49a3d` | Warning messages |
| hint | `#4a6c8a` | Hint messages |
| operator | `#6b8aa3` | Operators |
| keyword | `#4a6c8a` | Keywords |
| type | `#6b8aa3` | Type names |
| search | `#dba654` | Search highlights |
| plus | `#5d7b45` | Git additions |
| delta | `#d49a3d` | Git changes |

## Terminal Colors

### Normal Colors
- Black: `#e8e8ed`
- Red: `#b8475b`
- Green: `#5d7b45`
- Yellow: `#d49a3d`
- Blue: `#4a6c8a`
- Magenta: `#8b6b8d`
- Cyan: `#7878a3`
- White: `#2e2e30`

### Bright Colors
- Bright Black: `#737382`
- Bright Red: `#c55770`
- Bright Green: `#70965a`
- Bright Yellow: `#dba654`
- Bright Blue: `#6b8aa3`
- Bright Magenta: `#a085a2`
- Bright Cyan: `#8e8eb4`
- Bright White: `#1a1a1c`

## Installation

```lua
{
  "your-username/vague-light.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      -- Optional: customize further
      transparent = false, -- Set to true for transparent background
      -- colors = { bg = "#ffffff" } -- Override specific colors
    })
    vim.cmd("colorscheme vague-light")
  end
}
```

## External Tools

The theme includes configurations for:
- Alacritty (`extras/alacritty/vague.toml`)
- Kitty (`extras/kitty/vague.conf`)
- Warp (`extras/warp/vague.yaml`)
- And others inherited from the original vague.nvim

## Development

This theme maintains the exact same architecture as vague.nvim, just with adjusted colors for light mode. See WARP.md for development guidance.

## Testing

To test the theme:

1. Clone/download this repository
2. Add it to your Neovim configuration
3. Run `:colorscheme vague-light`
4. Verify that text is readable and colors have proper contrast

## Credits

- Original vague.nvim theme by [vague2k](https://github.com/vague2k/vague.nvim)
- Light adaptation based on omarchy-vaguelight-theme
- Color palette carefully adjusted to maintain readability and aesthetic consistency
