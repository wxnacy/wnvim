local ok, null_ls = require("utils").require("null-ls", true)
if not ok then
    return
end

vim.keymap.set('n', '<leader>=', '<CMD>lua vim.lsp.buf.formatting()<CR>')

-- 资源列表
local sources = {}
-- mason 安装目录
local mason_home = require("mason.settings").current.install_root_dir

local append_sources = function (typ, servers)
    for _, item in ipairs(servers) do
        local name
        if type(item) == 'table' then
            name = item[1]
        else
            name = item
        end


        local package_path = mason_home .. "/packages/" .. name
        if require("utils").is_dir_exists(package_path) then
            -- 名称以 mason 源为准，这里替换为 null-ls 可以使用的名称
            name = name:gsub('-', '_')
            local source = null_ls.builtins[typ][name]
            table.insert(sources, source)
        end
    end
end

-- 加载 lint sources
append_sources('diagnostics', require("linter.config").servers)
-- 加载 formater sources
append_sources('formatting', require("formatter.config").servers)

-- table.insert(sources, null_ls.builtins.code_actions.gitsigns)

-- 启动配置 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
null_ls.setup({
    sources = sources
})
