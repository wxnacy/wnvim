-- ===============================
-- nvim-tree
-- 项目目录
-- https://github.com/kyazdani42/nvim-tree.lua
-- mappings
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Archived#alternative-default-mappings
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

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)


    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'O', api.node.run.system, opts('Run System'))
end

tree.setup({
    -- open_on_setup = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
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
    },
    on_attach = on_attach
})
