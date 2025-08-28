local M = {}

---@class VagueColorscheme.InternalConfig
local DEFAULT_SETTINGS = {

  ---@type boolean
  transparent = false,
  ---@type boolean
  bold = true,
  ---@type boolean
  italic = true,
  ---@class VagueColorscheme.InternalConfig.style
  style = {
    ---@type string
    boolean = "bold",
    ---@type string
    number = "none",
    ---@type string
    float = "none",
    ---@type string
    error = "bold",
    ---@type string
    comments = "italic",
    ---@type string
    conditionals = "none",
    ---@type string
    functions = "none",
    ---@type string
    headings = "bold",
    ---@type string
    operators = "none",
    ---@type string
    strings = "italic",
    ---@type string
    variables = "none",

    ---@type string
    keywords = "none",
    ---@type string
    keyword_return = "italic",
    ---@type string
    keywords_loop = "none",
    ---@type string
    keywords_label = "none",
    ---@type string
    keywords_exception = "none",

    builtin_constants = "bold",
    ---@type string
    builtin_functions = "none",
    ---@type string
    builtin_types = "bold",
    ---@type string
    builtin_variables = "none",
  },

  ---@param highlights table<string, vim.api.keyset.highlight>
  ---@param colors VagueColorscheme.InternalConfig.colors
  on_highlights = function(highlights, colors) end,

  ---@class VagueColorscheme.InternalConfig.plugins
  plugins = {
    ---@class VagueColorscheme.InternalConfig.plugins.cmp
    cmp = {
      ---@type string
      match = "bold",
      ---@type string
      match_fuzzy = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.dashboard
    dashboard = {
      ---@type string
      footer = "italic",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.lsp
    lsp = {
      ---@type string
      diagnostic_error = "bold",
      ---@type string
      diagnostic_hint = "none",
      ---@type string
      diagnostic_info = "italic",
      ---@type string
      diagnostic_ok = "none",
      ---@type string
      diagnostic_warn = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.neotest
    neotest = {
      ---@type string
      focused = "bold",
      ---@type string
      adapter_name = "bold",
    },
    ---@class VagueColorscheme.InternalConfig.plugins.telescope
    telescope = {
      ---@type string
      match = "bold",
    },
  },
  ---@class VagueColorscheme.InternalConfig.colors
  colors = {
    ---@type string
    bg = "#f8f8f9",
    ---@type string
    inactiveBg = "#ededf2",
    ---@type string
    fg = "#2e2e30",
    ---@type string
    floatBorder = "#737382",
    ---@type string
    line = "#e8e8ed",
    ---@type string
    comment = "#737382",
    ---@type string
    builtin = "#4a6c8a",
    ---@type string
    func = "#b8475b",
    ---@type string
    string = "#d49a3d",
    ---@type string
    number = "#d49a3d",
    ---@type string
    property = "#4a6c8a",
    ---@type string
    constant = "#7878a3",
    ---@type string
    parameter = "#8b6b8d",
    ---@type string
    visual = "#b8c5d1",
    ---@type string
    error = "#b8475b",
    ---@type string
    warning = "#d49a3d",
    ---@type string
    hint = "#4a6c8a",
    ---@type string
    operator = "#6b8aa3",
    ---@type string
    keyword = "#4a6c8a",
    ---@type string
    type = "#6b8aa3",
    ---@type string
    search = "#dba654",
    ---@type string
    plus = "#5d7b45",
    ---@type string
    delta = "#d49a3d",
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = vim.deepcopy(DEFAULT_SETTINGS)

local opts = type(vim.g.vague_colorscheme) == "function" and vim.g.vague_colorscheme() or vim.g.vague_colorscheme or {}

---@param user_opts VagueColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
