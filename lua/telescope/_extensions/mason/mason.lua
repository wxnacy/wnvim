local utils = require("telescope._extensions.mason.utils")
local packer_util = require("packer.util")
local M = {results={}}

local is_installed, installed_path = utils.is_installed('mason')
if not is_installed then
    return M
end

local dirname = packer_util.join_paths(installed_path, 'lua', 'mason-registry')
local sources = {}
local filetypes = require("mason.mappings.language")
for filetype, names in pairs(filetypes) do
    for _, name in ipairs(names) do
        table.insert(sources, {
            name = name,
            path = packer_util.join_paths(dirname, name , 'init.lua'),
            filetype = filetype,
            source = 'mason',
        })
    end
end

M.results = sources

return M
