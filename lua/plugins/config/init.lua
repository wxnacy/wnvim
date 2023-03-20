local utils = require("utils")

require('plugins.config/bufferline')
require('plugins.config/fzf')
require('plugins.config/todo-comments')
require('plugins.config/vim-fugitive')
require('plugins.config/hop')
require('plugins.config/vista')
require('plugins.config/dashboard-nvim')
require('plugins.config/mason')
require('plugins.config/null-ls')

-- ===============================
-- simnalamburt/vim-mundo
-- 恢复本地历史记录
-- https://github.com/simnalamburt/vim-mundo
-- ===============================
if 1 == 1 then
    vim.keymap.set('n', '<leader>h', '<Cmd>MundoToggle<CR>')
    vim.cmd([[
    set undofile
    set undodir=~/.local/share/nvim/undo
    ]])
end

-- ===============================
-- gitsigns
-- git 相关操作
-- https://github.com/lewis6991/gitsigns.nvim
-- ===============================
local gs_status, gitsigns = utils.require("gitsigns", true)
if gs_status then
    gitsigns.setup()
end
--
-- 设置主题
vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night
-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "tokyonight"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
if not utils.can_success_run_cmd("colorscheme " .. colorscheme) then
    vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
end

local ok, toggleterm = utils.require('toggleterm')
if ok then
    -- https://github.com/akinsho/toggleterm.nvim
    toggleterm.setup()
end
