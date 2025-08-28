local curr_internal_conf = require("vague.config.internal").current
local M = {}

M.set_highlights = function()
  local c = curr_internal_conf.colors
  vim.g.terminal_color_0 = c.line -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.plus -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.keyword -- blue
  vim.g.terminal_color_5 = c.parameter -- purple
  vim.g.terminal_color_6 = c.constant -- cyan
  vim.g.terminal_color_7 = c.fg -- white
  vim.g.terminal_color_8 = c.comment -- gray
  vim.g.terminal_color_9 = "#c55770" -- bright red
  vim.g.terminal_color_10 = "#70965a" -- bright green
  vim.g.terminal_color_11 = "#dba654" -- bright yellow
  vim.g.terminal_color_12 = "#6b8aa3" -- bright blue
  vim.g.terminal_color_13 = "#a085a2" -- bright purple
  vim.g.terminal_color_14 = "#8e8eb4" -- bright cyan
  vim.g.terminal_color_15 = "#1a1a1c" -- bright white (darker for light theme)
end
return M
