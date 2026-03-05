local autocmd = vim.api.nvim_create_autocmd

-- 自动恢复光标位置
autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)

    -- 排除特定文件类型，并确保标记行号在有效范围内
    if mark[1] > 0 and mark[1] <= line_count then
      -- 排除 git 相关的 buffer
      if not vim.tbl_contains({ "gitcommit", "gitrebase" }, vim.bo[args.buf].filetype) then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end
  end,
})
