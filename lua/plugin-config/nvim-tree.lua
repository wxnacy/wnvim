-- 文件树
-- https://github.com/kyazdani42/nvim-tree.lua

vim.keymap.set('n', '<Leader>tt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>')

require("nvim-tree").setup({
	open_on_setup = true,
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
  actions = {
	  remove_file = {
          close_window = true,
        },
  }
})
