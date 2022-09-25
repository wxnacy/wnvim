local utils = require("telescope._extensions.mason.utils")
local packer_util = require("packer.util")
local M = {results={}}

local is_installed, installed_path = utils.is_installed('nvim-lspconfig')
if not is_installed then
    return M
end

local dirname = packer_util.join_paths(installed_path, 'lua', 'lspconfig', 'server_configurations')
local sources = {}
local lsp_filetypes = require("mason-lspconfig.mappings.filetype")
for filetype, lsp_items in pairs(lsp_filetypes) do
    for _, lsp_name in ipairs(lsp_items) do
        table.insert(sources, {
            name = lsp_name,
            path = packer_util.join_paths(dirname, lsp_name .. '.lua'),
            filetype = filetype,
            source = 'nvim-lspconfig',
        })
    end
end

M.results = sources

return M
