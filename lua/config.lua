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
-- 插件 home 路径
M.PLUGIN_HOME = vim.fn.stdpath("data") .. "/site/pack/packer/start"
-- 皮质 home 路径
M.CONFIG_HOME = os.getenv("HOME") .. "/Documents/Configs/nvim_plugins"
---------------------------------- 常量 end
-- vim.notify("ww")

return M
