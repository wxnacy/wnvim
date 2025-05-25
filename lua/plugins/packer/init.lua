local config = require("config")
local utils = require("utils")
local map = utils.set_keymap
-- 基础插件
local basic_plugins = {
    -- ============================ 基础插件
    -- Packer can manage itself
    {
        'wbthomason/packer.nvim',
        config = function()
            vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
            vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>")
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
        config = function()
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
    --     glepnir/dashboard-nvim
    { 'nvim-tree/nvim-web-devicons' },

    -- begin theme
    {
        -- { "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"} },
        -- {'shaunsingh/nord.nvim'},
        -- { 'glepnir/zephyr-nvim' },
        -- OceanicNext
        -- onedark
        -- nightfox
        -- {

        -- 2024-12-31 停止使用
        -- 'folke/tokyonight.nvim',
        -- config = function()
            -- vim.o.background = "dark"
            -- vim.g.tokyonight_style = "storm" -- day / night
            -- -- 半透明
            -- -- vim.g.tokyonight_transparent = true
            -- -- vim.g.tokyonight_transparent_sidebar = true
            -- vim.cmd([[
                -- colorscheme tokyonight
            -- ]])
        -- end

        -- },
    },

    -- catppuccin
    -- https://github.com/catppuccin/nvim
    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
            })
            vim.cmd.colorscheme "catppuccin"
        end
    },
    -- end theme

    -- dashboard
    -- https://github.com/glepnir/dashboard-nvim
    {
        'glepnir/dashboard-nvim',
        config = function()
            require("plugins.config.dashboard-nvim")
        end
    },

    -- 高亮相同单词
    {
        'RRethy/vim-illuminate',
    },

    {
        -- 缩进美化展示
        -- v3 新版本文档
        -- https://github.com/lukas-reineke/indent-blankline.nvim/wiki/Migrate-to-version-3
        "lukas-reineke/indent-blankline.nvim",
        main='ibl',
        config = function()
            -- https://github.com/lukas-reineke/indent-blankline.nvim
            vim.opt.list = true
            -- vim.opt.listchars:append "space:⋅"
            -- vim.opt.listchars:append "eol:↴"
            require("ibl").setup {
                -- show_end_of_line = true,
                -- space_char_blankline = " ",
                -- 代码块缩进竖线
                -- show_current_context = true, v3 去掉替换为下面的方式
                scope = {
                    enabled = true
                },
                -- 过滤文件类型
                -- filetype_exclude = { "dashboard" }
                -- filetype_exclude 在 v3 版本移除，详见 issues
                -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/644
                exclude = {
                    filetypes = {
                        "dashboard",
                    },
                },
                -- 代码块首行标下划线
                -- show_current_context_start = true,
            }
        end
    },

    -- 底部状态栏
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'catppuccin'
                }
            }
        end
    },

    -- 展示图片
    -- https://github.com/edluffy/hologram.nvim
    -- TODO: 需要解决图片大小问题
    {
        'edluffy/hologram.nvim',
        config = function()
            require('hologram').setup{
                auto_display = true -- WIP automatic markdown image display, may be prone to breaking
            }
        end
    },

    -- 标签
    -- https://github.com/utilyre/barbecue.nvim
    {
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons",       -- keep this if you're using NvChad
        config = function()
            -- triggers CursorHold event faster
            vim.opt.updatetime = 200

            require("barbecue").setup({
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            })

            vim.api.nvim_create_autocmd({
                "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",

                -- include these if you have set `show_modified` to `true`
                "BufWritePost",
                "TextChanged",
                "TextChangedI",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end,
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
        config = function()
            -- 执行当前文件
            vim.keymap.set('n', '<Leader>r', 'ggvG<Plug>SnipRun', { silent = true })
            -- 执行选中片段
            vim.keymap.set('v', '<leader>r', '<Plug>SnipRun', { silent = true })
            return require('sniprun').setup({
                display = {
                    -- 底部弹窗展示结果
                    -- "Classic",
                    "VirtualTextOk",
                    "VirtualTextErr", --# display error results as virtual text
                    "NvimNotify",     --# display with the nvim-notify plugin
                },
                show_no_output = {
                    "NvimNotify", --# display with the nvim-notify plugin
                }
            })
        end
    },

    -- lsp, dap, linter, formatter 包管理
    { "williamboman/mason.nvim", tag = "v1.11.0" },
    { "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', },

    {
        -- lsp 相关
        { 'neovim/nvim-lspconfig' },
        { 'rafamadriz/friendly-snippets' },
        { 'onsails/lspkind-nvim' },
        -- nvim-cmp
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' }, -- { name = nvim_lsp }
        { 'hrsh7th/cmp-buffer' },   -- { name = 'buffer' },
        { 'hrsh7th/cmp-path' },     -- { name = 'path' }
        { 'hrsh7th/cmp-cmdline' },  -- { name = 'cmdline' }
        -- vsnip
        { 'hrsh7th/cmp-vsnip' },    -- { name = 'vsnip' }
        {
            'hrsh7th/vim-vsnip',
            config = function()
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
                vim.g.vsnip_snippet_dir = require("config").HOME .. '/config/vsnip'
            end
        },
        -- ultisnips
        -- {'SirVer/ultisnips'},    -- { name = 'ultisnips' }
        -- {'honza/vim-snippets'},    -- { name = 'ultisnips' }
        -- 签名增强
        -- https://github.com/ray-x/lsp_signature.nvim
        {
            'ray-x/lsp_signature.nvim',
            config = function()
                require("lsp_signature").setup({
                    fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
                    -- always_trigger = true,
                    hi_parameter = 'IncSearch',
                })
            end
        },
    },

    -- Linter, Formatter
    { "nvimtools/none-ls.nvim" },

    -- for golang
    { 'fatih/vim-go' },

    -- for rust
    {
        'mrcjkb/rustaceanvim',
        tag = '5.*', -- Recommended
        -- lazy = false, -- This plugin is already lazy
        config = function()
            require("plugins.config.rustaceanvim")
        end
    },
}

local tool_plugins = {
    -- ============================ 工具相关
    -- 多终端
    -- https://github.com/akinsho/toggleterm.nvim
    {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = function()
            require("plugins.config.toggleterm")
        end
    },

    -- telescope 相关插件
    {
        -- 搜索工具
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.6',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
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
        { 'nvim-telescope/telescope-hop.nvim' },
        -- 管理命令
        { "LinArcX/telescope-command-palette.nvim" },
    },
    -- 多光标选择
    { "mg979/vim-visual-multi" },
}

local other_plugins = {
    -- ============================ 其他插件
    -- tagbar
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({
                -- auto_close = true    -- 跳转后自动关闭
                require("utils").set_keymap('n', 'tb', '<Cmd>SymbolsOutline<CR>')
            })
            require("config").autocmd("BufEnter", {
                nested = true,
                group = require("config").auto_group,
                callback = function()
                    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("OUTLINE") ~= nil then
                        vim.cmd("quit")
                    end
                end,
            })
        end
    },

    -- 快速注释
    {
        'scrooloose/nerdcommenter',
        config = function()
            -- https://github.com/scrooloose/nerdcommenter
            vim.g.NERDSpaceDelims = 1 -- 注释后面保留一个空格
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
        config = function()
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
        requires = { "junegunn/fzf" }
    },

    -- nvim-tree
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("plugins.config.nvim-tree")
        end,
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    },

    -- nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        -- commit='11e88f6',
        -- run = ':TSUpdate',
        config = function()
            require('plugins.config.nvim-treesitter')
        end
    },

    -- git 相关
    {
        'tpope/vim-fugitive',
        config = function()
            -- http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/
            -- gs 状态下
            -- - add/reset Unpush - git push
            -- = 展示 diff
            -- cc commit 信息
            -- <enter> 打开文件
            require("utils").set_keymap('n', '<leader>g', ':G<CR>')        -- 打开提交面板
            require("utils").set_keymap('n', '<leader>gb', ':G blame<CR>') -- 展示文件 blame
        end
    },
    {
        -- https://github.com/lewis6991/gitsigns.nvim
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugins.config.gitsigns')
        end
    },

    -- diffview 查看文件不同
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    -- simnalamburt/vim-mundo 文件历史记录
    -- https://github.com/simnalamburt/vim-mundo
    {
        'simnalamburt/vim-mundo',
        config = function()
            vim.keymap.set('n', '<leader>h', '<Cmd>MundoToggle<CR>')
            vim.cmd([[
                set undofile
                set undodir=~/.local/share/nvim/undo
            ]])
        end
    },

    -- bufferline.nvim
    {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('plugins.config/bufferline').setup()
        end
    },

    {
        "folke/trouble.nvim",
        config = function()
            require("trouble")
        end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    },
    {
        -- 查找并替换
        -- https://github.com/nvim-pack/nvim-spectre
        "nvim-pack/nvim-spectre",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/trouble.nvim",
        },
        config = function()
            require('spectre').setup()
            require("utils").set_keymap('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
                desc = "Toggle Spectre"
            })
            require("utils").set_keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
                desc = "Search current word"
            })
            require("utils").set_keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
                desc = "Search on current file"
            })
        end
    },
    {
        -- https://github.com/toppair/peek.nvim
        -- https://github.com/iamcco/markdown-preview.nvim
        -- 需要先安装 deno
        -- peek.nvim 支持 webview 双屏时预览更方便
        'toppair/peek.nvim',
        run = 'deno task --quiet build:fast',
        config = function()
            require("peek").setup()
            local peek = require('peek')

            vim.api.nvim_create_user_command('PeekToggle', function()
                if peek.is_open() then
                    peek.close()
                else
                    if vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
                        peek.open()
                    else
                        require("utils").notify_warn("不是 markdown 文件，无法预览")
                    end
                end
            end, {})

            require("utils").set_keymap({ 'n', 'i' }, '<leader>mp', '<Cmd>PeekToggle<CR>')
        end
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
