require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

local M = {}

-- 通用配置
M.general = {
  {
    modes = { "n", "i", "v" },
    key = "<C-s>",
    action = "<cmd> w <cr>",
    desc = "Save file",
  },
  {
    modes = { "n" },
    key = ";",
    action = ":",
    desc = "Enter command mode",
  },
  {
    modes = { "n" },
    key = "<leader>q",
    action = "<cmd> q <cr>",
    desc = "Quit",
  },
  {
    modes = { "i" },
    key = "jj",
    action = "<ESC>",
    desc = "Exit insert mode",
  },
  {
    modes = { "n" },
    key = "<F3>",
    action = function()
      require("nvim-navbuddy").open()
    end,
    desc = "Open structure",
  },
  {
    modes = { "v" },
    key = "<leader>fm",
    action = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
    desc = "format selected",
  },
  {
    modes = { "x", "o" },
    key = "af",
    action = function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
    end,
    desc = "",
  },
  {
    modes = { "x", "o" },
    key = "if",
    action = function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
    end,
    desc = "",
  },
  {
    modes = { "x", "o" },
    key = "aa",
    action = function()
      require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
    end,
    desc = "",
  },
  {
    modes = { "x", "o" },
    key = "ia",
    action = function()
      require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
    end,
    desc = "",
  },
}

-- SSR 配置
M.ssr = {
  {
    modes = { "n", "v" },
    key = "<leader>sr",
    action = function()
      require("ssr").open()
    end,
    desc = "Structural search and replace",
  },
}

-- Hop 配置
local BC = { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
local AC = { direction = require("hop.hint").HintDirection.AFTER_CURSOR }

M.hop = {
  {
    modes = { "n" },
    key = "<leader><leader>w",
    action = function()
      require("hop").hint_words(AC)
    end,
    desc = "words AC",
  },
  {
    modes = { "n" },
    key = "<leader><leader>b",
    action = function()
      require("hop").hint_words(BC)
    end,
    desc = "words BC",
  },
  {
    modes = { "n" },
    key = "<leader><leader>j",
    action = function()
      require("hop").hint_lines_skip_whitespace(AC)
    end,
    desc = "lines AC",
  },
  {
    modes = { "n" },
    key = "<leader><leader>k",
    action = function()
      require("hop").hint_lines_skip_whitespace(BC)
    end,
    desc = "lines BC",
  },
  {
    modes = { "n" },
    key = "f",
    action = function()
      require("hop").hint_char1(AC)
    end,
    desc = "chars AC",
  },
  {
    modes = { "n" },
    key = "F",
    action = function()
      require("hop").hint_char1(BC)
    end,
    desc = "chars BC",
  },
}

-- LSP 配置
M.lsp = {
  {
    modes = { "n" },
    key = "<leader>fd",
    action = function()
      vim.diagnostic.open_float()
    end,
    desc = "open float diagnostic",
  },
}

-- Gitsigns 配置
M.gitsigns = {
  {
    modes = { "n" },
    key = "<leader>gn",
    action = function()
      require("gitsigns").nav_hunk "next"
    end,
    desc = "next hunk",
  },
  {
    modes = { "n" },
    key = "<leader>gp",
    action = function()
      require("gitsigns").nav_hunk "prev"
    end,
    desc = "prev hunk",
  },
  {
    modes = { "n" },
    key = "<leader>ph",
    action = function()
      require("gitsigns").preview_hunk()
    end,
    desc = "preview hunk",
  },
  {
    modes = { "n" },
    key = "<leader>rh",
    action = function()
      require("gitsigns").reset_hunk()
    end,
    desc = "reset hunk",
  },
  {
    modes = { "n" },
    key = "<leader>bl",
    action = function()
      require("gitsigns").blame_line()
    end,
    desc = "blame line",
  },
}

-- Telescope 配置
M.telescope = {
  {
    modes = { "n" },
    key = "<leader>gr",
    action = function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "Find lsp references",
  },
}

-- 要禁用的键位
local disabled = {
  {
    modes = { "n" },
    key = "<leader>h",
  },
  {
    modes = { "n" },
    key = "<leader>v",
  },
}

-- 应用禁用的键位
for _, config in ipairs(disabled) do
  for _, mode in ipairs(config.modes) do
    nomap(mode, config.key)
  end
end

-- 应用所有键位映射
for group_name, group in pairs(M) do
  for _, mapping in ipairs(group) do
    local full_desc = group_name .. " " .. mapping.desc
    map(mapping.modes, mapping.key, mapping.action, { desc = full_desc })
  end
end
