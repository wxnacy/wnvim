local M = {}

M.plugins = {}

-- ===============================
-- 底部状态栏
-- https://github.com/vim-airline/vim-airline
-- use { 'bling/vim-airline' }
-- 替换 vim-airline
-- https://github.com/nvim-lualine/lualine.nvim
-- ===============================
table.insert(M.plugins, {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function ()
        require('lualine').setup {
            options = {
                theme = 'tokyonight'
            }
        }
    end
})

return M
