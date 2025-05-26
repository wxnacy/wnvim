return {
    -- 代码补全
    require("plugins.lazy.blink"),
    -- lsp
    require("plugins.lazy.lsp"),
    -- 代码格式化
    require("plugins.lazy.formatter"),
    -- 代码语法高亮
    require("plugins.lazy.treesitter"),
    -- 搜索增强
    require("plugins.lazy.telescope"),
    require("plugins.lazy.trouble"),
    -- 代码折叠
    require("plugins.lazy.fold"),
    -- for golang
    { 'fatih/vim-go' },

    -- https://github.com/folke/todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- 快速去掉行尾空格
    -- https://github.com/ntpeters/vim-better-whitespace
    {
        'ntpeters/vim-better-whitespace',
        init = function()
            vim.keymap.set('n', '<leader><space>', '<Cmd>StripWhitespace<CR>')
            -- 展示 snacks_dashboard 时不高亮空格
            -- https://github.com/ntpeters/vim-better-whitespace/issues/172#issuecomment-2778894757
            vim.api.nvim_create_autocmd("User", {
                pattern = "SnacksDashboardOpened",
                callback = function() vim.cmd [[DisableWhitespace]] end,
            })
        end
    },


    -- 快速注释
    -- https://github.com/scrooloose/nerdcommenter
    {
        'scrooloose/nerdcommenter',
        config = function()
            -- 新版本会默认有一个空格
            -- vim.g.NERDSpaceDelims = 1 -- 注释后面保留一个空格，新版本会默认有一个空格
        end
    },

    -- 签名增强
    -- https://github.com/ray-x/lsp_signature.nvim
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            -- cfg options
        },
    },




}
