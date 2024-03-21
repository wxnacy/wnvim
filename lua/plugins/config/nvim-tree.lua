-- ===============================
-- nvim-tree
-- 项目目录
-- https://github.com/kyazdani42/nvim-tree.lua
-- ===============================
local ok, tree = require("utils").require("nvim-tree")
if not ok then
    return
end

-- 查找/关闭目录
vim.keymap.set('n', '<Leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')
-- 查找/关闭当前文件在目录中的位置
vim.keymap.set('n', 'tf', ':NvimTreeFindFileToggle<CR>')

tree.setup({
    -- open_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        -- mappings = {
            -- list = {
                -- -- 半屏打开文件
                -- { key = "s", action = "vsplit" },
                -- -- 使用系统打开文件
                -- { key = "O", action = "system_open" },
                -- -- 显示帮助文档
                -- { key = "?",action = "toggle_help" },
            -- },
        -- },
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
