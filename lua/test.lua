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

local function print_ipairs(_table)
    local count = 0
    for name, plugin in ipairs(_table) do
        print(name, plugin)
        count = count + 1
    end
    print(count)
end

local function mysplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

-- print(mysplit("a b.c", '.')[1])
print(require("lspconfig.server_configurations.jedi_language_server").default_config.filetypes[1])
-- print(require("mason-lspconfig.mappings.server").lspconfig_to_package.tsserver)
-- print_pairs(require("mason-lspconfig.mappings.server").package_to_lspconfig)
-- print_pairs(require("mason-registry.index"))
-- print(require("mason-core.path").package_prefix("test"))
-- print(require("mason-registry.index")['cfn-lint'])
-- print(vim.fn.executable('jsonlints'))
-- print_pairs(require("lspconfig").jdtls)
-- print_pairs(require("lspconfig").gopls)
-- print(require("telescope").load_extension('mason'))
-- print(require("telescope._extensions.project"))
-- require("telescope._extensions.mason")
-- require("plugins.config.telescope")
-- print_pairs(require("lspconfig").__index)
-- print(require("packer.util").join_paths("test", "test"))
local a= {"a"}
-- local b= {"b"}
table.insert(a, "b")
print_pairs(a)
