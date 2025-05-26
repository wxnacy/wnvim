return {
    -- ============================ 基础工具箱
    require("plugins.lazy.snacks"),
    -- 快速跳转
    -- https://github.com/smoka7/hop.nvim
    require("plugins.lazy.hop"),

    -- 成对括号
    -- https://github.com/windwp/nvim-autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },


    -- 绑定键位展示
    -- https://github.com/folke/which-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
            vim.keymap.set("n", "<leader>nl", function()
                require("noice").cmd("last")
            end)

            vim.keymap.set("n", "<leader>m", function()
                require("noice").cmd("history")
            end)
        end
    },




    -- ============================ 样式美化
    -- https://github.com/akinsho/bufferline.nvim
    require("plugins.lazy.bufferline"),

    -- 高亮相同单词
    { 'RRethy/vim-illuminate', },

    -- 底部状态栏
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'catppuccin'
            }
        }
    },

    -- 添加括号
    -- https://github.com/kylechui/nvim-surround
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- ============================ 文件浏览器
    -- 文件树
    require("plugins.lazy.neo-tree"),
    -- yazi
    require("plugins.lazy.yazi"),

    -- ============================ Git
    -- https://github.com/lewis6991/gitsigns.nvim
    require("plugins.lazy.gitsigns"),
    -- https://github.com/tpope/vim-fugitive
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


}
