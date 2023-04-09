local utils = require("utils")
map = utils.set_keymap
map("n", "<leader><leader>w", ":HopWord<CR>")
map("n", "<leader><leader>b", ":HopWord<CR>")
map("n", "<leader>/", ":HopPattern<CR>")
-- place this in one of your configuration file(s)
map('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
utils.setup("hop", {
    keys = 'etovxqpdygfblzhckisuran'
}, true)
