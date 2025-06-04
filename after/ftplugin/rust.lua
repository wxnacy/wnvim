local bufnr = vim.api.nvim_get_current_buf()
local opt = { silent = true, buffer = bufnr }
local mapbuf = vim.keymap.set
-- 使用默认的 lsp 快捷键
--require("keybindings").maplsp(mapbuf)

---- 代码分组操作
--mapbuf('n', '<leader>a', '<cmd>RustLsp codeAction<CR>', opt)

---- 打开注释
--local hover = function()
    ---- 执行两次可以将光标定位到悬停框中
    --vim.cmd.RustLsp({'hover', 'actions'})
    --vim.cmd.RustLsp({'hover', 'actions'})
--end
--mapbuf("n", "gh", hover, opt)
--mapbuf("n", "K", hover, opt)

---- 打开在线文档
--mapbuf('n', 'gH', '<cmd>RustLsp openDocs<CR>', opt)
---- 打开 Cargo.toml
--mapbuf('n', 'gc', '<cmd>RustLsp openCargo<CR>', opt)
---- 打开父模块
--mapbuf('n', 'gm', '<cmd>RustLsp parentModule<CR>', opt)
---- 带有语法的合并代码
--mapbuf('n', 'J', '<cmd>RustLsp joinLines<CR>', opt)
--mapbuf('v', 'J', ":'<,'>RustLsp joinLines<CR>", opt)
-- 检查代码
-- mapbuf('v', 'gf', "<cmd>cargo fix --allow-dirty<CR>", opt)

-- 跳转源码
-- vim.keymap.set(
  -- "n",
  -- "<leader>d",
  -- '<Plug>RustHoverAction',
  -- { silent = true, buffer = bufnr }
-- )
