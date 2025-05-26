-- 代码语法高亮
-- nvim-treesitter/nvim-treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        -- 默认不折叠代码
        vim.wo.foldlevel = 99
        -- 要安装高亮的语言直接加入括号即可，把sync_install设置为true下次进入vim自动安装，语言列表查看treesitter的github
        -- 或者执行:TSInstall <language_to_install>
        local language = {
            "python",
            "lua",
            "markdown",
            "go",
            "bash",
            "java",
            "sql",
            "rust",
            "html",
        }
        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all"
            ensure_installed = language,
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,
            -- List of parsers to ignore installing (for "all")
            ignore_install = {},
            highlight = {
                enable = true,
                -- list of language that will be disabled
                disable = {},
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
