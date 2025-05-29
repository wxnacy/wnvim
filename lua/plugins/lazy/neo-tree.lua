--- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
        {
            "tt",
            mode = { "n", "v" },
            "<cmd>Neotree<cr>",
            desc = "Open Neotree",
        },
        --{
            --"tf",
            --mode = { "n", "v" },
            --"<cmd>Neotree filesystem reveal<cr>",
            --desc = "Open Neotree focus file",
        --},

    },
    ---@module "neo-tree"
    ---@type neotree.Config?
    --- https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#longer-example-for-lazynvim
    opts = {
        filesystem = {
            filters = {
                -- hide_dotfiles = false, -- 可选：同时显示以 "." 开头的隐藏文件，这样 .gitignore 这类文件可以展示成出来
                always_show = { -- remains visible even if other settings would normally hide it
                    ".gitignore",
                    ".flake8",
                    "pyrightconfig.json",
                },
                always_show_by_pattern = { -- uses glob style patterns
                    ".env*",
                },
            },
        },
        -- fill any relevant options here
        close_if_last_window = true,
        window = {
            position = "left",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["o"] = "open",
                ["O"] = "open",
            },
        }
    },
}
