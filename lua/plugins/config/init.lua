local utils = require("utils")
local config = require("config")
if utils.is_install_plugin("wvim") then
    vim.api.nvim_command("source " .. config.PLUGIN_HOME .. "/wvim/vimrcs/basic.vim")
    vim.api.nvim_command("source " .. config.PLUGIN_HOME .. "/wvim/vimrcs/mapping.vim")
end

if utils.is_install_plugin("packer.nvim") then
    vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
    vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>")
end
-- require('plugins.config/nvim-notify')
-- require('plugins.config/nvim-tree')
require('plugins.config/nvim-treesitter')
require('plugins.config/bufferline')
require('plugins.config/fzf')
require('plugins.config/LeaderF')
-- require('plugins.config/indent-blankline')
require('plugins.config/sniprun')
require('plugins.config/todo-comments')
require('plugins.config/telescope')
require('plugins.config/vim-fugitive')
-- require('plugins.config/gitsigns')
require('plugins.config/hop')
require('plugins.config/vista')
require('plugins.config/dashboard-nvim')
-- require('plugins.config/lualine')
require('plugins.config/mason')
require('plugins.config/null-ls')


-- ===============================
-- nerdcommenter 快速注释
-- https://github.com/scrooloose/nerdcommenter
-- ===============================
-- vim.g.NERDSpaceDelims = 1   -- 注释后面保留一个空格

-- ===============================
-- vim-better-whitespace 修复多余空格
-- https://github.com/bronson/vim-trailing-whitespace
-- ===============================
if 1 == 1 then
    -- 修复空格
    vim.keymap.set('n', '<leader><space>', ':StripWhitespace<CR>')
    -- 展示 dashboard 时不高亮空格
    vim.cmd([[ let g:better_whitespace_filetypes_blacklist = ['dashboard'] ]])
end

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
-- https://github.com/hrsh7th/vim-vsnip
if utils.is_install_plugin('vim-vsnip') then
    vim.cmd([[
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
    smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
    imap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
    smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    imap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
    smap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
    ]])
    -- 设置代码片段目录
    vim.g.vsnip_snippet_dir = config.HOME .. '/config/vsnip'
end

