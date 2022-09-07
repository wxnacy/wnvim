local ok, null_ls = require("utils").require("null-ls", true)
if not ok then
    return
end

local sources = {}

local mason_home = require("mason.settings").current.install_root_dir

-- 加载 lint sources
for _, item in ipairs(require("linter.config").servers) do
    local name
    if type(item) == 'table' then
        name = item[1]
    else
        name = item
    end

    local package_path = mason_home .. "/packages/" .. name
    if require("utils").is_dir_exists(package_path) then
        local source = null_ls.builtins.diagnostics[name]
        table.insert(sources, source)
    end
end

-- 启动配置 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
null_ls.setup({
    sources = sources
})
