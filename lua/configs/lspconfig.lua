-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "bashls", "ts_ls", "cmake", "pylsp" }
vim.lsp.enable(servers)
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
    "--fallback-style=Microsoft",
  },
})
vim.lsp.enable "clangd"
