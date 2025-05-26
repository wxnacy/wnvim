-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/mason-org/mason-lspconfig.nvim

local opts = { noremap = true, silent = true }
-- 全局补全能力声明
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config_pyright()
	vim.g.loaded_python_provider = 0
	vim.lsp.config("pyright", {
		settings = {
			["pyright"] = {
				analysis = {
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly", -- 限制分析范围
				},
				completion = {
					disableSnippets = false,
					postfixEnabled = true, -- 启用智能后缀补全
				},
			},
		},
		capabilities = capabilities, -- 携带全局补全能力
		autostart = true,
	})

	-- 根据文件类型延迟加载
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "python",
		callback = function()
			vim.lsp.enable("pyright")
			require("inlay-hints").refresh()
		end,
	})

	-- 在配置中添加性能监控
	require("lspconfig").pyright.setup({
		capabilities = capabilities, -- 携带全局补全能力
		handlers = {
			["textDocument/completion"] = function(_, result, ctx)
				print("Completion latency:", os.difftime(os.time(), ctx.client.rpc.start_time))
				return result
			end,
		},
		on_attach = function(client, bufnr)
			-- 此处添加你的按键映射
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },
		{ "MysticalDevil/inlay-hints.nvim", event = "LspAttach" },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- 通过mason来自动安装语言服务器并启用
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"marksman",
				"rust_analyzer",
				"pyright",
				"gopls",
				"bashls",
			},
			automatic_enable = {
				exclude = {},
			},
			automatic_installation = true, -- 新增自动安装
			handlers = { -- 新增自动配置
				function(server_name)
					vim.lsp.enable(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities, -- 携带全局补全能力
					})
				end,
				pyright = function()
					config_pyright()
				end,
			},
		})

		-- 快捷键的映射
		vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts) -- <space>h显示提示文档
		--vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- gd跳转到定义的位置
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts) -- go跳转到变量类型定义的位置
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)           -- gr跳转到引用了对应变量或函数的位置
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- <space>rn变量重命名
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts) -- <space>aw可以在出现警告或错误的地方打开建议的修复方法
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- <space>d浮动窗口显示所在行警告或错误信息
		vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts) -- <space>-跳转到上一处警告或错误的地方
		vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts) -- <space>+跳转到下一处警告或错误的地方
		-- vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts) -- <space>f进行代码格式化

		-- 诊断信息的图标
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
			virtual_text = false, -- 关闭行内诊断提示
			update_in_insert = false, -- 插入模式不更新诊断
		})

		-- 特定语言开启inlay-hints等自定义配置
		require("inlay-hints").setup()
		vim.lsp.config("lua_ls", {
			settings = {
				["Lua"] = {
					hint = { -- Lua开启hints
						enable = true, -- necessary
					},
					diagnostics = {
						-- 忽略掉vim配置时一些全局变量语言服务器找不到的警告
						globals = {
							"vim",
							"require",
							"opts",
						},
					},
				},
			},
		})
		vim.lsp.config("gopls", {
			settings = {
				["gopls"] = {
					hints = { -- gopls开启hints
						rangeVariableTypes = true,
						parameterNames = true,
						constantValues = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						functionTypeParameters = true,
					},
				},
			},
		})
	end,
}
