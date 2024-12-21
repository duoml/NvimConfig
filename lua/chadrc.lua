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
    separator_style = "arrow",
  },
}

M.nvdash = {
  load_on_startup = true,
}
return M
