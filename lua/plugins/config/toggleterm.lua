-- https://github.com/akinsho/toggleterm.nvim
local map = require("utils").set_keymap
map('n', '<leader>t', '<cmd>ToggleTerm<CR>')
map('n', '<leader>ts', '<cmd>ToggleTermSendCurrentLine<CR>')       -- 向 Terminal 发送当前行文本
map('v', '<leader>ts', ":'<,'>ToggleTermSendVisualSelection<CR>")  -- 向 Terminal 发送选中块文本

-- 设置窗口快捷键
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', 'jk', [[<C-\><C-n>]], opts)
  map('t', '<leader>q', [[<C-\><C-n>:q<CR>]], opts)
  map('n', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  map('n', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- 设置快捷窗口
local Terminal  = require('toggleterm.terminal').Terminal
local pyterm = Terminal:new({
    cmd = 'bpython',
    direction = 'horizontal' -- 'vertical' 'horizontal'
})

function python_toggle()
    pyterm:toggle()
end

map("n", "<leader>py", "<Cmd>lua python_toggle()<CR>", {noremap = true, silent = true})

-- local lazygit = Terminal:new({
  -- cmd = "lazygit",
  -- dir = "git_dir",
  -- direction = "float",
  -- float_opts = {
    -- border = "double",
  -- },
  -- -- function to run on opening the terminal
  -- on_open = function(term)
    -- vim.cmd("startinsert!")
    -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  -- end,
  -- -- function to run on closing the terminal
  -- on_close = function(term)
    -- vim.cmd("startinsert!")
  -- end,
-- })

-- function _lazygit_toggle()
  -- lazygit:toggle()
-- end

-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
require('toggleterm').setup()
