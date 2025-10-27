local M = {}

local uv = vim.uv or vim.loop

--- 检查路径是否可读文件
---@param path string
---@return boolean
local function is_readable(path)
	local stat = uv.fs_stat(path)
	return stat ~= nil and stat.type == "file"
end

--- 加载配置文件内容
---@param path string
---@return table
local function load_table(path)
	if not is_readable(path) then
		return {}
	end
	local ok, result = pcall(dofile, path)
	if not ok then
		vim.notify(string.format("加载配置失败: %s", result), vim.log.levels.WARN, { title = "wnvim" })
		return {}
	end
	if type(result) ~= "table" then
		return {}
	end
	return result
end

--- 深度合并配置表
---@param base table
---@param extra table
---@return table
local function merge_configs(base, extra)
	if next(extra) == nil then
		return base
	end
	return vim.tbl_deep_extend("force", base, extra)
end

--- 载入默认配置
---@return table
local function load_defaults()
	local defaults_path = vim.fn.stdpath("config") .. "/config.lua"
	return load_table(defaults_path)
end

--- 加载并缓存最终配置
---@return table
function M.load()
	if vim.g.wnvim_config ~= nil then
		return vim.g.wnvim_config
	end

	local defaults = load_defaults()
	local cwd = vim.fn.getcwd()
	local project_config_path = cwd .. "/.wnvim.lua"
	local project_config = load_table(project_config_path)

	local final_config = merge_configs(vim.deepcopy(defaults), project_config)
	final_config.root = cwd
	final_config.project_config_path = is_readable(project_config_path) and project_config_path or nil

	vim.g.wnvim_config = final_config
	return final_config
end

return M
