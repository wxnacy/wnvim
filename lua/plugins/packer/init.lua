local plugins = {

-- Packer can manage itself
 {'wbthomason/packer.nvim'},
-- wvim 基础设置
 {'wxnacy/wvim'},
-- 中文帮助文档
 { 'yianwillis/vimcdoc' },
-- 查看 lua 加载速度
 { 'lewis6991/impatient.nvim' },
-- ============================ 主题/美观 begin
-- gruvbox theme
 {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
},
 'shaunsingh/nord.nvim',
-- 主题 https://github.com/glepnir/zephyr-nvim
{ 'glepnir/zephyr-nvim', },
-- 主题
 { 'folke/tokyonight.nvim' },
--  {
    -- "folke/which-key.nvim",
    -- config = function()
        -- require("which-key").setup {
            -- -- your configuration comes here
            -- -- or leave it empty to  the default settings
            -- -- refer to the configuration section below
        -- }
    -- end
-- }
--https://github.com/nvim-telescope/telescope.nvim#getting-started
-- brew install fd
 {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
},
-- telescope ui 选择
--  {'nvim-telescope/telescope-ui-select.nvim' }
-- 文件浏览器
 { "nvim-telescope/telescope-file-browser.nvim" },
-- 管理项目 require file-browser
-- 管理 packer require file-browser
 { 'nvim-telescope/telescope-project.nvim' },
 { 'nvim-telescope/telescope-packer.nvim' },
-- 管理命令
 { "LinArcX/telescope-command-palette.nvim" },
-- telescope 快速跳转
 {'nvim-telescope/telescope-hop.nvim'},
-- 使用 sqlite3 记录历史记录
--  {
    -- 'nvim-telescope/telescope-smart-history.nvim',
    -- requires = { "kkharji/sqlite.lua" }
-- }
-- 查找本地 git 仓库
--  { 'cljoly/telescope-repo.nvim' }
-- dashboard
-- https://github.com/glepnir/dashboard-nvim
 {'glepnir/dashboard-nvim'},
-- 缩进美化展示
 "lukas-reineke/indent-blankline.nvim",
-- 多光标选择
 { "mg979/vim-visual-multi" },
-- ============================ 主题/美观 end
-- tagbar
 { "liuchengxu/vista.vim" },
-- 快速注释
 { 'scrooloose/nerdcommenter' },
-- 底部状态栏
-- https://github.com/vim-airline/vim-airline
--  { 'bling/vim-airline' }
-- 替换 vim-airline
-- https://github.com/nvim-lualine/lualine.nvim
--  {
    -- 'nvim-lualine/lualine.nvim',
    -- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
-- }
-- 快速跳转
--  { 'Lokaltog/vim-easymotion' }
-- 快速跳转用来代替 vim-easymotion
-- https://github.com/phaazon/hop.nvim
 {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
},
-- 快速去掉行尾空格
--  { 'bronson/vim-trailing-whitespace' }
-- 快速去掉行尾空格 替换 bronson/vim-trailing-whitespace
 { 'ntpeters/vim-better-whitespace' },
-- 成对标签自动补全
 { 'jiangmiao/auto-pairs' },
-- fzf 插件
 {
    'junegunn/fzf.vim',
    requires = {"junegunn/fzf"}
},
-- 文件搜索
 { 'Yggdroot/LeaderF' },
-- nvim-tree
 {
    'kyazdani42/nvim-tree.lua',
    requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function ()
        require("plugin-config.nvim-tree")
    end,
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
},
-- nvim-treesitter
 { 'nvim-treesitter/nvim-treesitter', commit='11e88f6', run = ':TSUpdate'},
-- git 相关
 { 'tpope/vim-fugitive' },
 { 'lewis6991/gitsigns.nvim' },
-- diffview 查看文件不同
 { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
-- simnalamburt/vim-mundo 文件历史记录
 { 'simnalamburt/vim-mundo' },
-- 通知
-- https://github.com/rcarriga/nvim-notify
 { 'rcarriga/nvim-notify' },

-- bufferline.nvim
 {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'},
-- ============================ 代码相关 begin
-- for go
 { 'fatih/vim-go' },
-- 高亮相同单词
 {'RRethy/vim-illuminate'},
-- 代码片段运行
-- https://github.com/michaelb/sniprun
-- 需要下载 rust
-- brew install rust
 { 'michaelb/sniprun', run = 'bash ./install.sh' },
 {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        }
    end
},
 {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
},

-- nvim 包管理
 {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'WhoIsSethDaniel/mason-tool-installer.nvim',
},

-- lspconfig
 {'neovim/nvim-lspconfig'},
--  {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
-- nvim-cmp
 'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
 'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
 'hrsh7th/cmp-path',     -- { name = 'path' }
 'hrsh7th/cmp-cmdline',  -- { name = 'cmdline' }
 'hrsh7th/nvim-cmp',
-- vsnip
 'hrsh7th/cmp-vsnip',    -- { name = 'vsnip' }
 'hrsh7th/vim-vsnip',
 'rafamadriz/friendly-snippets',
-- lspkind
 'onsails/lspkind-nvim',

-- Linters
 {"jose-elias-alvarez/null-ls.nvim"},
-- ============================ 代码相关 end

-- ============================ 工具相关 begin
-- 多终端
 {"akinsho/toggleterm.nvim", tag = 'v2.*'},
-- ============================ 工具相关 end

}

require("plugins.packer.loader").setup(plugins)
