local config_loader = require("config_loader")
local config = vim.g.wnvim_config or config_loader.load()

if type(config.filetype) == "table" then
	local group = vim.api.nvim_create_augroup("WNvimFiletype", { clear = true })
	for ft, opts in pairs(config.filetype) do
		local patterns = opts.pattern
		if patterns ~= nil then
			if type(patterns) ~= "table" then
				patterns = { patterns }
			end
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				group = group,
				pattern = patterns,
				callback = function()
					vim.bo.filetype = ft
				end,
			})
		end
	end
end

-- 自动创建 pyrightconfig.json 文件
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- 获取当前目录路径
		local cwd = vim.fn.getcwd()

		-- 检查所需文件是否存在
		local has_pyproject = vim.fn.filereadable(cwd .. "/pyproject.toml") == 1
		local has_envrc = vim.fn.filereadable(cwd .. "/.envrc") == 1
		local has_pyrightconfig = vim.fn.filereadable(cwd .. "/pyrightconfig.json") == 1

		-- 如果条件满足但缺少 pyrightconfig.json
		if has_pyproject and has_envrc and not has_pyrightconfig then
			-- 获取环境变量
			local venv_path = os.getenv("CONDA_PREFIX") or ""
			local venv_name = os.getenv("CONDA_DEFAULT_ENV") or ""

			-- 截取 venvPath 到 envs 目录（如果路径有效）
			if venv_path ~= "" then
				venv_path = venv_path:match("^(.*/envs)") or venv_path
			end

			-- 构建配置内容
			local config_content = string.format(
				[[
{
    "reportAssignmentType": "none",
    "reportAttributeAccessIssue": "none",
    "reportArgumentType": "none",
    "reportCallIssue": "none",
    "reportOptionalCall": "none",
    "reportOptionalMemberAccess": "none",
    "reportGeneralTypeIssues": "none",
    "reportReturnType": "none",
    "reportInvalidTypeForm": "none",
    "venvPath": "%s",
    "venv": "%s"
}]],
				venv_path,
				venv_name
			)

			-- 写入文件
			local file = io.open(cwd .. "/pyrightconfig.json", "w")
			if file then
				file:write(config_content)
				file:close()
				print("[Pyright] 已自动创建 pyrightconfig.json")
			else
				print("[Pyright] 错误: 无法创建 pyrightconfig.json")
			end
		end
	end,
})
