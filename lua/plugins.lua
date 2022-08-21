local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("n", "<leader>ps", ":PackerSync<CR>", opt)
map("n", "<leader>pi", ":PackerInstall<CR>", opt)

local is_install_plugin = require("utils").is_install_plugin
local config = require("config")
local packer = require('packer')

packer.reset()
packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- wvim 基础设置
    use 'wxnacy/wvim'
    -- ============================ 主题/美观 begin
    -- gruvbox theme
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    use 'shaunsingh/nord.nvim'
    -- 主题 https://github.com/glepnir/zephyr-nvim
    use({ 'glepnir/zephyr-nvim', })
    -- 主题
    use { 'folke/tokyonight.nvim' }
    --https://github.com/nvim-telescope/telescope.nvim#getting-started
    -- brew install fd
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- telescope ui 选择
    use {'nvim-telescope/telescope-ui-select.nvim' }
    -- dashboard
    -- https://github.com/glepnir/dashboard-nvim
    use {'glepnir/dashboard-nvim'}
    -- 缩进美化展示
    use "lukas-reineke/indent-blankline.nvim"
    -- 多光标选择
    use { "mg979/vim-visual-multi" }
    -- ============================ 主题/美观 end
    -- tagbar
    use { "liuchengxu/vista.vim" }
    -- 快速注释
    use { 'scrooloose/nerdcommenter' }
    -- 底部状态栏
    -- https://github.com/vim-airline/vim-airline
    -- use { 'bling/vim-airline' }
    -- 替换 vim-airline
    -- https://github.com/nvim-lualine/lualine.nvim
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- 快速跳转
    -- use { 'Lokaltog/vim-easymotion' }
    -- 快速跳转用来代替 vim-easymotion
    -- https://github.com/phaazon/hop.nvim
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
    -- 快速去掉行尾空格
    -- use { 'bronson/vim-trailing-whitespace' }
    -- 快速去掉行尾空格 替换 bronson/vim-trailing-whitespace
    use { 'ntpeters/vim-better-whitespace' }
    -- 成对标签自动补全
    use { 'jiangmiao/auto-pairs' }
    -- fzf 插件
    use {
        'junegunn/fzf.vim',
        requires = {"junegunn/fzf"}
    }
    -- 文件搜索
    use { 'Yggdroot/LeaderF' }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- nvim-treesitter
    use { 'nvim-treesitter/nvim-treesitter', commit='11e88f6', run = ':TSUpdate'  }
    -- git 相关
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }
    -- 通知
    -- https://github.com/rcarriga/nvim-notify
    use { 'rcarriga/nvim-notify' }

    -- bufferline.nvim
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- ============================ 代码相关 begin
    -- for go
    use { 'fatih/vim-go' }
    -- 高亮相同单词
    use {'RRethy/vim-illuminate'}
    -- 代码片段运行
    -- https://github.com/michaelb/sniprun
    -- 需要下载 rust
    -- brew install rust
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- lspconfig
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'
    -- ============================ 代码相关 end
end)

-- 启动插件
local function setup_plugin()
    -- for _, value in pairs(plugin_setups) do
        -- -- vim.notify(name)
        -- pcall(value)
    -- end
    if is_install_plugin("wvim") then
        vim.api.nvim_command("source" .. config.PLUGIN_HOME .. "/wvim/vimrcs/basic.vim")
        vim.api.nvim_command("source" .. config.PLUGIN_HOME .. "/wvim/vimrcs/mapping.vim")
    end

    require("plugin-config")


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
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
    return
    end

end

local M = {}

-- 启动方法
M.setup = function ()
    setup_plugin()
end

return M
