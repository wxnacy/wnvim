-- 快速跳转
-- https://github.com/smoka7/hop.nvim
return {
    'smoka7/hop.nvim',
    version = "*",
    keys = {
        { "<leader><leader>w", "<Cmd>HopWord<CR>", desc = "快速跳转" },
        { "<leader><leader>b", "<Cmd>HopWord<CR>", desc = "快速跳转" },
        {
            "<leader>/",
            "<Cmd>HopPattern<CR>",
            desc = "增强全局搜索",
        },
        {
            "f",
            function()
                local directions = require('hop.hint').HintDirection
                local hop = require("hop")
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end,
            desc = "向前查找",
        },
        {
            "F",
            function()
                local directions = require('hop.hint').HintDirection
                local hop = require("hop")
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end,
            desc = "向前查找",
        },
    },
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    }
}
