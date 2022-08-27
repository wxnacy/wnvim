require('plugin-config/nvim-notify')
require('plugin-config/nvim-tree')
require('plugin-config/nvim-treesitter')
require('plugin-config/bufferline')
require('plugin-config/fzf')
require('plugin-config/LeaderF')
require('plugin-config/indent-blankline')
require('plugin-config/sniprun')
require('plugin-config/todo-comments')
require('plugin-config/telescope')
require('plugin-config/vim-fugitive')
require('plugin-config/gitsigns')
require('plugin-config/vim-illuminate')
require('plugin-config/hop')
require('plugin-config/vista')
require('plugin-config/dashboard-nvim')
require('plugin-config/lualine')

-- ===============================
-- nerdcommenter 快速注释
-- https://github.com/scrooloose/nerdcommenter
-- ===============================
vim.g.NERDSpaceDelims = 1   -- 注释后面保留一个空格

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
