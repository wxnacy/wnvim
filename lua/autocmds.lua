local config = require("config")

-- nvim-tree 自动关闭
config.autocmd("BufEnter", {
    nested = true,
    group = config.group_auto,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd("quit")
        end
    end,
})

-- 保存 plugins.lua 自动重新加载
config.autocmd('BufWritePost', {
    pattern = {
        '*nvim/lua/*.lua',
    },
    group = config.group_auto,
    callback = function()
        vim.api.nvim_command("source %")
        require("plugins.config.bufferline").setup()
        require("packer").compile()
    end,
})
