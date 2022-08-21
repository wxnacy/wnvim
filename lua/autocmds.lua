local config = require("config")

-- nvim-tree 自动关闭
config.autocmd("BufEnter", {
  nested = true,
  group = config.group_auto,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- vista.vim 自动关闭
config.autocmd("BufEnter", {
  nested = true,
  group = config.auto_group,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("__vista__") ~= nil then
      vim.cmd("quit")
    end
  end,
})
