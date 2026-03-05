local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  formatters = {
    shfmt = {
      -- -i 4: 缩进 4 个空格
      -- -ci: 连续行缩进
      append_args = { "-i", "4", "-ci" },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
