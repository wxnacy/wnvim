local ok, null_ls = require("utils").require("null-ls", true)
if not ok then
    return
end

vim.keymap.set('n', '<leader>=', '<CMD>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('v', '<leader>=', ":'<,'>lua vim.lsp.buf.range_formatting()<CR>")

-- 资源列表
local sources = {}

local append_sources = function(typ, servers)
    for _, item in ipairs(servers) do
        local name
        if type(item) == 'table' then
            name = item[1]
        else
            name = item
        end

        if require("plugins.config.mason-null-ls").is_install(name) then
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
    -- sources = {
    -- null_ls.builtins.formatting.google_java_format,
    -- }
})
