-- https://github.com/nvim-telescope/telescope.nvim
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope search_history<cr>')
vim.keymap.set('n', 'gl', '<cmd>Telescope git_commits<cr>')
vim.keymap.set('n', 'gcb', '<cmd>Telescope git_branches<cr>')

local actions = require "telescope.actions"

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
})
require("telescope").load_extension("ui-select")
