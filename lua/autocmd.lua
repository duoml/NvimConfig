local autocmd = vim.api.nvim_create_autocmd

-- open last read position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local ft = vim.opt_local.filetype:get()
    local exclude_fts = { gitcommit = true, gitrebase = true }
    if exclude_fts[ft] then
      return
    end

    local markpos = vim.api.nvim_buf_get_mark(0, '"')
    if markpos then
      local line = markpos[1]
      local col = markpos[2]
      if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
        vim.api.nvim_win_set_cursor(0, { line, col })
      end
    end
  end,
})
