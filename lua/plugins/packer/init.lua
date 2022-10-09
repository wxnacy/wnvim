local packer_config = require("plugins.packer.config")
local config = require("config")
-- 基础插件
local basic_plugins = {
    -- ============================ 基础插件
    -- Packer can manage itself
    {
        'wbthomason/packer.nvim',
        config = function ()
            vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
            vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>")
        end
    },

    -- wvim 基础设置
    {
        'wxnacy/wvim',
        config = function ()
            vim.api.nvim_command("source " .. packer_config.HOME .. "/wvim/vimrcs/basic.vim")
            vim.api.nvim_command("source " .. packer_config.HOME .. "/wvim/vimrcs/mapping.vim")

        end
    },

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


}

local prettify_plugins = {
    -- ============================ 美化
    -- icon 基础
    -- require by
    --     trouble.nvim
    --     lualine.nvim
    --     nvim-tree
    --     bufferline.nvim
    --     diffview.nvim
    { 'kyazdani42/nvim-web-devicons' },

    {
        -- 主题
        { "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"} },
        {'shaunsingh/nord.nvim'},
        { 'glepnir/zephyr-nvim' },
        { 'folke/tokyonight.nvim' },
    },

    -- dashboard
    -- https://github.com/glepnir/dashboard-nvim
    {'glepnir/dashboard-nvim'},

    -- 高亮相同单词
    {
        'RRethy/vim-illuminate',
    },

    {
        -- 缩进美化展示
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

    -- 底部状态栏
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight'
                }
            }
        end
    },

}

local code_plugins = {
    -- ============================ 代码相关

    {
        -- 代码片段运行
        'michaelb/sniprun',
        -- 需要先下载 rust
        -- brew install rust
        run = 'bash ./install.sh',
        config = function ()
            -- 执行当前文件
            vim.keymap.set('n', '<Leader>r', 'ggvG<Plug>SnipRun', {silent = true})
            -- 执行选中片段
            vim.keymap.set('v', '<leader>r', '<Plug>SnipRun', {silent = true})
            return require('sniprun').setup({
                display = {
                    -- 底部弹窗展示结果
                    -- "Classic",
                    "VirtualTextOk",
                    "VirtualTextErr",          --# display error results as virtual text
                    "NvimNotify",              --# display with the nvim-notify plugin
                },
                show_no_output = {
                    "NvimNotify",              --# display with the nvim-notify plugin
                }
            })
        end
    },

    {
        -- lsp, dap, linter, formatter 包管理
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

    {
        -- lsp 相关
        {'neovim/nvim-lspconfig'},
        {'rafamadriz/friendly-snippets'},
        {'onsails/lspkind-nvim'},
        -- nvim-cmp
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'}, -- { name = nvim_lsp }
        {'hrsh7th/cmp-buffer'},   -- { name = 'buffer' },
        {'hrsh7th/cmp-path'},     -- { name = 'path' }
        {'hrsh7th/cmp-cmdline'},  -- { name = 'cmdline' }
        -- vsnip
        {'hrsh7th/cmp-vsnip'},    -- { name = 'vsnip' }
        {
            'hrsh7th/vim-vsnip',
            config = function ()
                vim.cmd([[
                imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
                smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'
                imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-n>'
                smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-n>'
                imap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-n>'
                smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-n>'
                imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
                smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
                imap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-p>'
                smap <expr> <C-p>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-p>'
                ]])
                -- 设置代码片段目录
                vim.g.vsnip_snippet_dir = config.HOME .. '/config/vsnip'
            end
        },
        -- ultisnips
        -- {'SirVer/ultisnips'},    -- { name = 'ultisnips' }
        -- {'honza/vim-snippets'},    -- { name = 'ultisnips' }
    },

    -- Linter, Formatter
    {"jose-elias-alvarez/null-ls.nvim"},

    -- for golang
    { 'fatih/vim-go' },
}

local tool_plugins = {
    -- ============================ 工具相关
    -- 多终端
    {"akinsho/toggleterm.nvim", tag = 'v2.*'},
    -- telescope 相关插件
    {
        -- 搜索工具
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { {'nvim-lua/plenary.nvim'} },
            config = function ()
                require("plugins.config.telescope")
            end
        },
        -- 文件浏览器
        { "nvim-telescope/telescope-file-browser.nvim" },
        -- 管理项目 require file-browser
        { 'nvim-telescope/telescope-project.nvim' },
        -- 管理 packer require file-browser
        { 'nvim-telescope/telescope-packer.nvim' },
        -- telescope 快速跳转
        {'nvim-telescope/telescope-hop.nvim'},
        -- 管理命令
        { "LinArcX/telescope-command-palette.nvim" },
    },
    -- 多光标选择
    { "mg979/vim-visual-multi" },
}

local other_plugins = {
    -- ============================ 其他插件
    -- tagbar
    { "liuchengxu/vista.vim" },

    -- 快速注释
    {
        'scrooloose/nerdcommenter',
        config = function ()
            -- https://github.com/scrooloose/nerdcommenter
            vim.g.NERDSpaceDelims = 1   -- 注释后面保留一个空格
        end
    },

    -- 快速跳转
    -- https://github.com/phaazon/hop.nvim
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },

    -- 快速去掉行尾空格
    {
        'ntpeters/vim-better-whitespace',
        config = function ()
            -- https://github.com/bronson/vim-trailing-whitespace
            -- 修复空格
            vim.keymap.set('n', '<leader><space>', ':StripWhitespace<CR>')
            -- 展示 dashboard 时不高亮空格
            vim.cmd([[ let g:better_whitespace_filetypes_blacklist = ['dashboard'] ]])
        end
    },

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
        config = function ()
            require("plugins.config.nvim-tree")
        end,
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },

    -- nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        commit='11e88f6',
        -- run = ':TSUpdate',
        config = function ()
            require('plugins.config.nvim-treesitter')
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
    {'akinsho/bufferline.nvim'},

    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup { }
        end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    },
}

local plugins = {}
for _, _plugins in ipairs({
    basic_plugins,
    prettify_plugins,
    tool_plugins,
    code_plugins,
    other_plugins
}) do
    for _, _plugin in ipairs(_plugins) do
        table.insert(plugins, _plugin)
    end
end

require("plugins.packer.loader").setup(plugins)
