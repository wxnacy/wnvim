-- 配置文件
--
-- 文件描述:
-- - 当前文件提供 wnvim 的默认全局配置
-- - nvim 启动时由 lua/config_loader.lua 加载并合并项目配置
--
-- 功能需求:
-- - 项目配置作为全局配置增量配置，一起加载
-- - 项目内可以获取到配置内容做相关操作
-- - init.lua 启动时加载一次全局配置，其他模块通过 vim.g.wnvim_config 复用
-- - filetype 配置可以在 @lua/autocmds.lua 中自动设置文件类型

return {
	-- 文件类型匹配配置，供 lua/autocmds.lua 自动设置 filetype
	filetype = {
		-- Shell 文件类型模式
		sh = {
			pattern = { "*.envrc", "installer" },
		},
		-- Zsh 配置文件模式
		zsh = {
			pattern = { "zprofile" },
		},
	},
}
