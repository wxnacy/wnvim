-- name = 'wvim'
-- print(name, _G.packer_plugins[name], _G.packer_plugins[name].loaded)


-- local count = 0
-- print(count)

local function print_pairs(_table)
    local count = 0
    for name, plugin in pairs(_table) do
        print(name, plugin)
        count = count + 1
    end
    print(count)
end

-- print(require("mason-lspconfig.mappings.server").lspconfig_to_package.tsserver)
-- print_pairs(require("mason-lspconfig.mappings.server").package_to_lspconfig)
print_pairs(require("mason-registry.index"))
