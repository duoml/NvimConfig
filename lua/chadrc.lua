---@class ChadrcConfig
local M = {}
M.base46 = {
  theme = "onedark",
  transparency = false,
}

M.ui = {
  cmp = {
    icons_left = true,
  },

  statusline = {
    theme = "default",
    separator_style = "arrow",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "pos", "cwd" },
    modules = {
      pos = "%#StText# %l/%c",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
}
return M
