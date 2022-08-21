local M = {}

-- 自动命令组
M.auto_group = vim.api.nvim_create_augroup("AutoGroup", {
  clear = true,
})
-- 自动命令方法
M.autocmd = vim.api.nvim_create_autocmd

---------------------------------- 常量 begin
-- nvim home 路径
M.HOME = vim.fn.stdpath("config")
---------------------------------- 常量 end
vim.notify("ww")

return M
