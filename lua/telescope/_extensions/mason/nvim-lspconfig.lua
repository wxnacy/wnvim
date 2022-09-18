local utils = require("telescope._extensions.mason.utils")
local packer_util = require("packer.util")
local M = {results={}}

local is_installed, installed_path = utils.is_installed('nvim-lspconfig')
if not is_installed then
    return M
end

local dirname = packer_util.join_paths(installed_path, 'lua', 'lspconfig', 'server_configurations')
local sources = {}
for _, file in ipairs(utils.listdir(dirname)) do
    if file.type == 'file' then
        -- table.insert(sources, file.name)
        table.insert(sources, {
            name = file.name,
            path = packer_util.join_paths(dirname, file.name),
            plugin_name = 'nvim-lspconfig'
        })
    end
end

M.results = sources
return M
