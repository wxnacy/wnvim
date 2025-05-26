-- https://github.com/akinsho/bufferline.nvim
return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
        vim.opt.termguicolors = true
        local map = require("utils").set_keymap
        map("n", "<S-h>", ":BufferLineCyclePrev<CR>")
        map("n", "<S-l>", ":BufferLineCycleNext<CR>")
        map("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>")
        map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
        map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
        map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
        map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
        map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
        map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
        map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
        map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
        map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
        map("n", "<leader>bp", ":BufferLinePick<CR>")
        map("n", "<leader>bd", ":BufferLinePickClose<CR>")
    end,
    opts = {
        options = {
            -- 使用 nvim 内置lsp
            diagnostics = "nvim_lsp",
            -- 左侧让出 nvim-tree 的位置
            offsets = { {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            } },
            separator_style = 'thick', -- 粗隔档
            -- 右侧自定义区域
            custom_areas = {
                right = function()
                    local result = {}
                    local seve = vim.diagnostic.severity
                    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                    if error ~= 0 then
                        table.insert(result, { text = "  " .. error, fg = "#EC5241" })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
                    end
                    return result
                end,
            },

        },
    },
}
