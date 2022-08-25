-- 文件树
-- https://github.com/kyazdani42/nvim-tree.lua

vim.keymap.set('n', '<Leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local print_node_path = function(node)
    print(node.absolute_path)
    print(node)
end

require("nvim-tree").setup({
    open_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                -- 半屏打开文件
                { key = "s", cb = tree_cb("vsplit") },
                -- 使用系统打开文件
                { key = "O", action = "system_open" },
                -- 显示帮助文档
                { key = "?",action = "toggle_help" },
                -- { key = "t", action = "print_path", action_cb = print_node_path },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        -- 是否过滤 dotfiles, 隐藏文件
        -- dotfiles = true,
        -- exclude = { "" }
        -- 自定义过滤文件
        custom = { "^.git$", "^.mypy_cache$" }
    },
    actions = {
        remove_file = {
            close_window = true,
        },
    }
})
