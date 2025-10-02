local M = {}

-- 全局补全能力声明
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- 添加一个函数来刷新 gopls
local function refresh_gopls()
	-- 使用更可靠的方式刷新 gopls
	-- 通过触发 workspace_symbol 来刷新
	vim.lsp.buf.workspace_symbol("")
	vim.notify("gopls refresh triggered", vim.log.levels.INFO)
end

-- 添加一个更强大的刷新函数，重新加载整个工作区
local function reload_gopls_workspace()
	-- 执行系统命令来更新 go.mod
	local function run_cmd(cmd, callback)
		local handle = io.popen(cmd)
		if handle then
			local result = handle:read("*a")
			handle:close()
			if callback then callback(result) end
		end
	end

	-- 运行 go mod tidy
	run_cmd("cd " .. vim.fn.getcwd() .. " && go mod tidy", function()
		-- 刷新 LSP
		vim.lsp.buf.workspace_symbol("")
		vim.notify("gopls workspace reloaded", vim.log.levels.INFO)
	end)
end

-- 创建用户命令来刷新 gopls
vim.api.nvim_create_user_command("GoLspRefresh", refresh_gopls, {})
vim.api.nvim_create_user_command("GoLspReload", reload_gopls_workspace, {})

-- 为 gopls 创建专门的配置函数
function M.setup()
	vim.lsp.config("gopls", {
		capabilities = capabilities,
		-- 优化 gopls 性能配置
		settings = {
			gopls = {
				-- 分析选项
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				-- 静态检查
				staticcheck = true,
				-- 使用 gofumpt 格式化
				gofumpt = true,
				-- 使用占位符
				usePlaceholders = true,
				-- 补全未导入的包
				completeUnimported = true,
				-- hints 配置
				hints = {
					rangeVariableTypes = true,
					parameterNames = true,
					constantValues = true,
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					functionTypeParameters = true,
				},
				-- 性能优化选项
				buildFlags = { "-tags", "integration" }, -- 如果你有构建标签
				-- 内存优化
				memoryMode = "DegradeClosed", -- 对于大型项目，关闭文件时降级内存使用
				-- 工作目录选项
				verboseOutput = false, -- 减少输出日志
				-- 启用监视模式，自动检测文件变化
				watchFileChanges = true,
			},
		},
		-- 添加性能优化标志
		flags = {
			debounce_text_changes = 150, -- 防抖延迟
		},
		-- 在 on_attach 中禁用 LSP 格式化，使用专门的格式化工具
		on_attach = function(client, bufnr)
			-- 禁用 LSP 格式化功能，使用 conform.nvim 进行格式化
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			local opts = { noremap = true, silent = true }

			-- 添加刷新工作区的按键映射
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>R", "<cmd>lua vim.lsp.buf.workspace_symbol('')<CR>", opts)
		end,
	})

	-- 添加文件监视，当 go.mod 或 go.sum 文件变化时自动刷新
	vim.api.nvim_create_autocmd({"BufWritePost"}, {
		pattern = {"go.mod", "go.sum"},
		callback = function()
			vim.notify("go.mod or go.sum changed, refreshing gopls...", vim.log.levels.INFO)
			reload_gopls_workspace()
		end,
	})
end

return M
