
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("n", "<leader>ps", ":PackerSync<CR>", opt)
map("n", "<leader>pi", ":PackerInstall<CR>", opt)

local packer = require('packer')

return packer.startup(function()
    -- Packer can manage itself
    packer.use 'wbthomason/packer.nvim'
    -- wvim 基础设置
    packer.use 'wxnacy/wvim'
    -- ============================ 主题/美观 begin
    -- gruvbox theme
    packer.use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    packer.use 'shaunsingh/nord.nvim'
    packer.use({
        'glepnir/zephyr-nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
    })
    --https://github.com/nvim-telescope/telescope.nvim#getting-started
    -- brew install fd
    packer.use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- telescope ui 选择
    packer.use {'nvim-telescope/telescope-ui-select.nvim' }
    -- dashboard
    packer.use {'glepnir/dashboard-nvim'}
    -- 缩进美化展示
    packer.use "lukas-reineke/indent-blankline.nvim"
    -- 多光标选择
    packer.use { "mg979/vim-visual-multi" }
    -- ============================ 主题/美观 end
    -- 快速注释
    packer.use { 'scrooloose/nerdcommenter' }
    -- 底部状态栏
    packer.use { 'bling/vim-airline' }
    -- 快速跳转
    packer.use { 'Lokaltog/vim-easymotion' }
    -- 快速去掉行尾空格
    packer.use { 'bronson/vim-trailing-whitespace' }
    -- 成对标签自动补全
    packer.use { 'jiangmiao/auto-pairs' }
    -- fzf 插件
    packer.use {
        'junegunn/fzf.vim',
        requires = {"junegunn/fzf"}
    }
    -- 文件搜索
    packer.use { 'Yggdroot/LeaderF' }
    -- nvim-tree
    packer.use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- nvim-treesitter
    packer.use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'  }
    -- git 相关
    packer.use { 'tpope/vim-fugitive' }
    packer.use { 'lewis6991/gitsigns.nvim' }
    -- 通知
    -- https://github.com/rcarriga/nvim-notify
    packer.use { 'rcarriga/nvim-notify' }

    -- bufferline.nvim
    packer.use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- ============================ 代码相关 begin
    -- 高亮相同单词
    packer.use {'RRethy/vim-illuminate'}
    -- 代码片段运行
    -- https://github.com/michaelb/sniprun
    -- 需要下载 rust
    -- brew install rust
    packer.use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    packer.use {
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
    packer.use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- lspconfig
    packer.use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- nvim-cmp
    packer.use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    packer.use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    packer.use 'hrsh7th/cmp-path'     -- { name = 'path' }
    packer.use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    packer.use 'hrsh7th/nvim-cmp'
    -- vsnip
    packer.use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    packer.use 'hrsh7th/vim-vsnip'
    packer.use 'rafamadriz/friendly-snippets'
    -- lspkind
    packer.use 'onsails/lspkind-nvim'
    -- ============================ 代码相关 end
end)
