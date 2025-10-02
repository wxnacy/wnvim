return {
    -- https://github.com/olimorris/codecompanion.nvim
    -- https://github.com/kiddos/gemini.nvim
    -- https://codecompanion.olimorris.dev/getting-started
    -- https://codecompanion.olimorris.dev/configuration/adapters
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                http = {
                    gemini = {
                        name = "Gemini",
                        -- 使用系统命令行调用gemini
                        type = "system",
                        model = "gemini-pro",
                        -- 设置请求超时和温度参数
                        timeout = 30000, -- 30秒
                        temperature = 0.7
                    }
                }
            },
            -- 设置默认适配器为gemini
            default_adapter = "http.gemini",
            -- 支持的文件类型
            opts = {
                filetypes = {
                    python = true,
                    go = true,
                    javascript = true,
                    typescript = true,
                    lua = true
                }
            },
            -- 设置快捷键
            on_attach = function(client, bufnr)
                -- 确保使用正确的 leader 键设置
                local map = vim.keymap.set
                local opt = {noremap = true, silent = true, buffer = bufnr}

                -- 聊天相关快捷键
                map("n", "<leader>ac", "<cmd>CodeCompanion chat new<CR>", opt)
                map("n", "<leader>aq", "<cmd>CodeCompanion chat quick<CR>", opt)

                -- 上下文相关快捷键
                map("n", "<leader>aa", "<cmd>CodeCompanion context add<CR>", opt)
                map("n", "<leader>ax", "<cmd>CodeCompanion context clear<CR>", opt)

                -- 工作流快捷键
                map("n", "<leader>ae", "<cmd>CodeCompanion explain<CR>", opt)
                map("n", "<leader>ar", "<cmd>CodeCompanion refactor<CR>", opt)
                map("n", "<leader>ad", "<cmd>CodeCompanion document<CR>", opt)
                map("n", "<leader>ab", "<cmd>CodeCompanion debug<CR>", opt)
            end,
            -- 添加常用工作流配置
            workflows = {
                -- 代码解释
                { name = "Explain", cmd = ":CodeCompanion explain" },
                -- 代码重构
                { name = "Refactor", cmd = ":CodeCompanion refactor" },
                -- 生成注释
                { name = "Document", cmd = ":CodeCompanion document" },
                -- 查找bug
                { name = "Debug", cmd = ":CodeCompanion debug" }
            },
            -- 集成代码补全
            integrations = {
                nvim_cmp = {
                    enabled = true,
                    priority = 100
                }
            }
        })
    end
}