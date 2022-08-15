-- 文件树
-- https://github.com/kyazdani42/nvim-tree.lua

vim.keymap.set('n', '<Leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
