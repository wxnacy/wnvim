-- https://github.com/easymotion/vim-easymotion
vim.g.EasyMotion_smartcase = 1
-- vim.api.nvim_command('let g:EasyMotion_smartcase = 1')
vim.keymap.set("n", "<Leader><Leader>j", "<Plug>(easymotion-j)")
vim.keymap.set("n", "<Leader><Leader>k", "<Plug>(easymotion-k)")
-- 重复上个操作
vim.keymap.set("n", "<Leader><Leader>.", "<Plug>(easymotion-repeat)")
-- 搜索某个字母
vim.keymap.set("n", "<Leader><Leader>s", "<Plug>(easymotion-overwin-f)")

return {}
