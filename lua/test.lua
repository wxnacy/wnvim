local plugin_configs = {
    -- Packer can manage itself
    -- {'wbthomason/packer.nvim'},
    -- -- wvim 基础设置
    -- {'wxnacy/wvim' },
    -- 底部状态栏
    -- https://github.com/vim-airline/vim-airline
    -- use { 'bling/vim-airline' }
    -- 替换 vim-airline
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            print("w")
        end
    }
}
for _, value in ipairs(plugin_configs) do
    for _, n in ipairs(value) do
        print(n)
    end
end


local plugin_setups = {
    ['lualine.nvim'] = function ()
        require('lualine').setup {
            options = {
                -- ... your lualine config
                theme = 'tokyonight'
                -- ... your lualine config
            }
        }
    end
}
for key, value in pairs(plugin_setups) do
    print(key, value)
end
