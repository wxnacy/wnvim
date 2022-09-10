local plugins = {

    -- ============================ nvim 基础 begin
    -- Packer can manage itself
    {'wbthomason/packer.nvim'},

    -- wvim 基础设置
    {'wxnacy/wvim'},

    -- 中文帮助文档
    { 'yianwillis/vimcdoc' },

    -- 查看 lua 加载速度
    { 'lewis6991/impatient.nvim' },
    --
    -- 通知
    -- https://github.com/rcarriga/nvim-notify
    {
        'rcarriga/nvim-notify',
        config = function ()
            vim.opt.termguicolors = true
            local notify = require("notify")
            notify.setup({
                background_colour = "#000000"
            })
            vim.notify = notify
        end
    },

    -- 高亮相同单词
    {
        'RRethy/vim-illuminate',
    },
    -- ============================ nvim 基础 end


    -- ============================ 工具相关 begin
    -- 多终端
    {"akinsho/toggleterm.nvim", tag = 'v2.*'},
    -- ============================ 工具相关 end


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
    --https://github.com/nvim-telescope/telescope.nvim#getting-started
    -- brew install fd
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    },
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
    -- dashboard
    -- https://github.com/glepnir/dashboard-nvim
    {'glepnir/dashboard-nvim'},
    -- 缩进美化展示
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()

            -- https://github.com/lukas-reineke/indent-blankline.nvim
            vim.opt.list = true
            -- vim.opt.listchars:append "space:⋅"
            -- vim.opt.listchars:append "eol:↴"

            require("indent_blankline").setup {
                -- show_end_of_line = true,
                -- space_char_blankline = " ",
                -- 代码块缩进竖线
                show_current_context = true,
                -- 过滤文件类型
                filetype_exclude = { "dashboard" }
                -- 代码块首行标下划线
                -- show_current_context_start = true,
            }
        end
    },
    -- 多光标选择
    { "mg979/vim-visual-multi" },
    -- ============================ 主题/美观 end
    -- tagbar
    { "liuchengxu/vista.vim" },
    -- 快速注释
    {
        'scrooloose/nerdcommenter',
        config = function ()
            vim.g.NERDSpaceDelims = 1   -- 注释后面保留一个空格
        end
    },

    -- 底部状态栏
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight'
                }
            }
        end
    },

    -- 快速跳转
    -- https://github.com/phaazon/hop.nvim
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },
    -- 快速去掉行尾空格
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
            require("plugins.config.nvim-tree")
        end,
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    -- nvim-treesitter
    { 'nvim-treesitter/nvim-treesitter', commit='11e88f6', run = ':TSUpdate'},
    -- 代码格式化
    {
        'mhartington/formatter.nvim',
        config = function ()
            require("plugins.config.formatter")
        end
    },
    -- git 相关
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    -- diffview 查看文件不同
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    -- simnalamburt/vim-mundo 文件历史记录
    { 'simnalamburt/vim-mundo' },


    -- bufferline.nvim
    {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'},
    -- ============================ 代码相关 begin
    -- for go
    { 'fatih/vim-go' },


    -- 代码片段运行
    -- https://github.com/michaelb/sniprun
    -- 需要下载 rust
    -- brew install rust
    { 'michaelb/sniprun', run = 'bash ./install.sh' },
    {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup { }
        end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    },

    -- lsp,linter,formatter 包管理
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    -- lspconfig
    {'neovim/nvim-lspconfig'},
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


}

require("plugins.packer.loader").setup(plugins)
