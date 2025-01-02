-- ===============================
-- rustaceanvim
-- https://github.com/mrcjkb/rustaceanvim
-- 键位配置 after/ftplugin/rust.lua
-- ===============================
local ok, rustaceanvim = pcall(require, 'rustaceanvim')
if not ok then
    return
end

-- local utils = require("utils")
-- require("keybindings").maplsp(vim.keymap.set)

-- TODO: 配置后不生效
-- vim.g.rustaceanvim = {
    -- -- Plugin configuration
    -- tools = {
        -- float_win_config = {
        -- --- whether the window gets automatically focused
        -- --- default: false
        -- ---@type boolean
        -- auto_focus = true,

        -- --- whether splits opened from floating preview are vertical
        -- --- default: false
        -- ---@type 'horizontal' | 'vertical'
        -- open_split = 'vertical',
        -- },
    -- },
    -- -- LSP configuration
    -- server = {
        -- on_attach = function(client, bufnr)
            -- -- 打开注释
            -- -- utils.set_keymap('n', 'K',
            -- -- -- '<Cmd>RustLsp hover actions<CR>',
            -- -- function()
                -- -- -- 执行两次可以将光标定位到悬停框中
                -- -- vim.cmd.RustLsp({'hover', 'actions'})
                -- -- vim.cmd.RustLsp({'hover', 'actions'})
            -- -- end,
            -- -- { silent = true, buffer = bufnr })
        -- end,
        -- default_settings = {
        -- -- rust-analyzer language server configuration
        -- ['rust-analyzer'] = {
        -- },
        -- },
    -- },
    -- -- DAP configuration
    -- dap = {
    -- },
-- }
