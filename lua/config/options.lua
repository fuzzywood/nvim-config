vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local root = vim.fs.find({ ".git", "Makefile", "package.json" }, { upward = true, stop = vim.loop.os_homedir() })[1]
    if root then
      vim.api.nvim_set_current_dir(vim.fs.dirname(root))
    end
  end,
})
