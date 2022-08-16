-- 设置 leader 键位
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- 去掉高亮
map("n", "<leader>nh", ":nohls<CR>", opt)
-- 快速返回常用模式
map("i", "jk", "<ESC>", opt)
map("v", "jk", "<ESC>", opt)

-- 快速退出
map("n", "<leader>q", ":q<CR>", opt)
-- 不保存修改退出
map("n", "<leader>Q", ":q!<CR>", opt)
-- 快速保存
map("n", "<leader>w", ":w<CR>", opt)
-- 没有保存权限时，使用 sudo 身份保存
map("n", "<leader>W", ":w !sudo tee % > /dev/null<CR>", opt)
-- 快速保存退出
map("n", "<leader>wq", ":wq<CR>", opt)

-- 光标移动
map("n", "<C-e>", "A", opt)
map("i", "<C-e>", "<esc>A", opt)
map("n", "<C-a>", "I", opt)
map("i", "<C-a>", "<esc>I", opt)
-- TODO 光标后移，在开头时有 BUG
map("i", "<C-f>", "<esc>lli", opt)
map("i", "<C-b>", "<esc>i", opt)
-- 向后删除数据 TODO 光标后移，在开头时有 BUG
map("i", "<C-d>", "<esc>lxi", opt)
-- map("n", "<C-j>", "<C-e>", opt)

-- 窗口调整
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 文本操作 {{{
-- 选中全部
map("n", "<leader>sa", "ggVG", opt)
-- 选中到行尾
map("n", "vig", "vg_", opt)
-- 快速选中当前行有效文字区域
map("n", "vv", "g_v0", opt)
-- 模拟IDE<tab>键，单行的缩紧退回和选中模式下的缩进退回
map("n", "<tab>", "V>", opt)
-- }}}

--map("n", "<tabl")
map("n", "yp", "yyp", opt)

local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', '<leader>g', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- cmp
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<C-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<C-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

return pluginKeys
